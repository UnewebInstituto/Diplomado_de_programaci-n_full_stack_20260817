A continuación se implementa el flujo de **ingreso de contactos**. El servidor Node.js servirá la página y expondrá una API que guarda los datos en PostgreSQL. Las opciones Consultar, Actualizar, Borrar y Reporte quedarán visibles en el menú, pero indicarán que aún no están implementadas.

Ubica `server.js`, `package.json` y `.env` en `PROFESOR`; los archivos HTML y JavaScript, dentro de `public`.

### 1. Dependencias y configuración

Instala las dependencias desde la terminal de VS Code, en la carpeta `PROFESOR`:

````powershell
npm init -y
npm install express pg dotenv
````

Crea `.env` con los datos de conexión. No subas este archivo al repositorio:

````dotenv
DB_HOST=localhost
DB_PORT=5432
DB_NAME=db_profesor
DB_USER=postgres
DB_PASSWORD=pon_aqui_la_contraseña_local
PORT=3000
````

Añádelo a `.gitignore`:

````gitignore
.env
node_modules/
````

Configura el comando de inicio en `package.json`:

````json
{
  "scripts": {
    "start": "node server.js"
  }
},
````

### 2. Servidor y API

La ruta `POST /api/contactos` valida los datos, inserta el registro con una consulta parametrizada y responde con un mensaje apropiado si la cédula o el correo ya existen.

````javascript
require('dotenv').config();

const express = require('express');
const path = require('path');
const { Pool } = require('pg');

const app = express();
const pool = new Pool({
  host: process.env.DB_HOST,
  port: Number(process.env.DB_PORT),
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD
});

app.use(express.json({ limit: '20kb' }));
app.use(express.static(path.join(__dirname, 'public')));

app.post('/api/contactos', async (req, res) => {
  const campos = [
    'cedula',
    'nombre',
    'apellido',
    'telefono',
    'correo_electronico',
    'direccion'
  ];

  const contacto = {};

  for (const campo of campos) {
    const valor = req.body?.[campo];

    if (typeof valor !== 'string' || !valor.trim()) {
      return res.status(400).json({
        mensaje: `El campo ${campo} es obligatorio.`
      });
    }

    contacto[campo] = valor.trim();
  }

  const limites = {
    cedula: 10,
    nombre: 80,
    apellido: 80,
    telefono: 15
  };

  for (const [campo, limite] of Object.entries(limites)) {
    if (contacto[campo].length > limite) {
      return res.status(400).json({
        mensaje: `El campo ${campo} no puede superar ${limite} caracteres.`
      });
    }
  }

  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(contacto.correo_electronico)) {
    return res.status(400).json({ mensaje: 'El correo electrónico no es válido.' });
  }

  try {
    const resultado = await pool.query(
      `INSERT INTO contactos
        (cedula, nombre, apellido, telefono, correo_electronico, direccion)
       VALUES ($1, $2, $3, $4, $5, $6)
       RETURNING id`,
      [
        contacto.cedula,
        contacto.nombre,
        contacto.apellido,
        contacto.telefono,
        contacto.correo_electronico,
        contacto.direccion
      ]
    );

    return res.status(201).json({
      mensaje: `Contacto guardado correctamente. ID: ${resultado.rows[0].id}.`
    });
  } catch (error) {
    if (error.code === '23505') {
      const campo = error.constraint === 'contactos_cedula_key'
        ? 'La cédula'
        : error.constraint === 'contactos_correo_electronico_key'
          ? 'El correo electrónico'
          : 'El dato';

      return res.status(409).json({
        mensaje: `${campo} ya está registrado.`
      });
    }

    console.error('Error al guardar el contacto:', error.message);
    return res.status(500).json({
      mensaje: 'No se pudo guardar el contacto. Verifica la conexión con la base de datos.'
    });
  }
});

const puerto = Number(process.env.PORT) || 3000;

app.listen(puerto, () => {
  console.log(`Servidor disponible en http://localhost:${puerto}`);
});
````

### 3. Página principal

`ej11_index.html` carga el encabezado y el pie como fragmentos. El formulario se mostrará en el área central al seleccionar Ingresar.

````html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Ejemplo 11 - Contactos</title>
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    crossorigin="anonymous">
  <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <script defer src="./app.js"></script>
</head>
<body>
  <div class="container">
    <div id="encabezado"></div>
    <main id="contenido" class="py-4">
      <h2>Gestión de contactos</h2>
      <p>Selecciona una opción del menú.</p>
    </main>
    <div id="pie"></div>
  </div>
</body>
</html>
````

### 4. Fragmentos compartidos y formulario

Reemplaza el contenido de los archivos existentes por estos fragmentos:

````html
<h1>Ejemplo 11</h1>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark" aria-label="Menú principal">
  <div class="container-fluid">
  
    <a class="navbar-brand" href="./ej11_index.html">Contactos</a>
	
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
      data-bs-target="#mynavbar" aria-controls="mynavbar" aria-expanded="false"
      aria-label="Abrir menú">
	  
      <span class="navbar-toggler-icon"></span>
	  
    </button>
	
    <div class="collapse navbar-collapse" id="mynavbar">
	
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
		
          <a class="nav-link" href="#" data-view="ingresar">Ingresar</a>
        </li>

        <li class="nav-item"><a class="nav-link" href="#" data-feature="Consultar">Consultar</a></li>
        <li class="nav-item"><a class="nav-link" href="#" data-feature="Actualizar">Actualizar</a></li>
		
        <li class="nav-item"><a class="nav-link" href="#" data-feature="Borrar">Borrar</a></li>
        <li class="nav-item"><a class="nav-link" href="#" data-feature="Reporte">Reporte</a></li>
      </ul>
    </div>
  </div>
</nav>
````

````html
<h2>Ingresar contacto</h2>
<form id="form-contacto">
  <div class="row">
    <div class="col-md-6">
	
      <div class="mb-3">
        <label for="cedula" class="form-label">Cédula:</label>
        <input class="form-control" id="cedula" name="cedula" maxlength="10" required>
      </div>
	  
      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre:</label>
        <input class="form-control" id="nombre" name="nombre" maxlength="80" required>
      </div>
	  
      <div class="mb-3">
        <label for="apellido" class="form-label">Apellido:</label>
        <input class="form-control" id="apellido" name="apellido" maxlength="80" required>
      </div>
	  
    </div>
	
    <div class="col-md-6">
	
      <div class="mb-3">
        <label for="telefono" class="form-label">Teléfono:</label>
        <input class="form-control" id="telefono" name="telefono" maxlength="15" required>
      </div>
	  
      <div class="mb-3">
        <label for="correo_electronico" class="form-label">Correo electrónico:</label>
        <input class="form-control" type="email" id="correo_electronico"
          name="correo_electronico" required>
      </div>
	  
      <div class="mb-3">
        <label for="direccion" class="form-label">Dirección:</label>
        <textarea class="form-control" id="direccion" name="direccion" required></textarea>
      </div>
    </div>
  </div>
  <button class="btn btn-primary" type="submit">Guardar</button>
  <button class="btn btn-secondary" type="reset">Limpiar</button>
</form>
````

El pie debe contener el elemento donde aparecerán las confirmaciones y errores:

````html
<div id="mensajes" class="mt-3" aria-live="polite"></div>
````

### 5. JavaScript del navegador

Este archivo carga los fragmentos, muestra el formulario y envía los datos a Node.js. Los mensajes se insertan como texto, no como HTML.

````javascript
const contenido = document.getElementById('contenido');

function mostrarMensaje(texto, tipo = 'info') {
  const mensajes = document.getElementById('mensajes');
  if (!mensajes) return;

  mensajes.replaceChildren();

  const alerta = document.createElement('div');
  alerta.className = `alert alert-${tipo}`;
  alerta.setAttribute('role', tipo === 'danger' ? 'alert' : 'status');
  alerta.textContent = texto;
  mensajes.appendChild(alerta);
}

async function cargarFragmento(elementoId, archivo) {
  const respuesta = await fetch(`./${archivo}`);
  if (!respuesta.ok) throw new Error(`No se pudo cargar ${archivo}.`);
  document.getElementById(elementoId).innerHTML = await respuesta.text();
}

async function mostrarFormulario() {
  const respuesta = await fetch('./ej11_ingresar.html');
  if (!respuesta.ok) throw new Error('No se pudo cargar el formulario.');
  contenido.innerHTML = await respuesta.text();
  mostrarMensaje('');
}

document.addEventListener('click', async (evento) => {
  const enlaceVista = evento.target.closest('[data-view]');
  const enlacePendiente = evento.target.closest('[data-feature]');

  if (enlaceVista) {
    evento.preventDefault();

    try {
      await mostrarFormulario();
    } catch (error) {
      mostrarMensaje(error.message, 'danger');
    }
  }

  if (enlacePendiente) {
    evento.preventDefault();
    mostrarMensaje(`La opción "${enlacePendiente.dataset.feature}" aún no está implementada.`, 'warning');
  }
});

document.addEventListener('submit', async (evento) => {
  if (evento.target.id !== 'form-contacto') return;

  evento.preventDefault();
  const formulario = evento.target;
  const boton = formulario.querySelector('[type="submit"]');
  boton.disabled = true;

  try {
    const datos = Object.fromEntries(new FormData(formulario).entries());
    const respuesta = await fetch('/api/contactos', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(datos)
    });

    const resultado = await respuesta.json();

    if (!respuesta.ok) {
      throw new Error(resultado.mensaje || 'Ocurrió un error al guardar.');
    }

    mostrarMensaje(resultado.mensaje, 'success');
    formulario.reset();
  } catch (error) {
    mostrarMensaje(error.message || 'No se pudo contactar al servidor.', 'danger');
  } finally {
    boton.disabled = false;
  }
});

Promise.all([
  cargarFragmento('encabezado', 'ej11_encabezado.html'),
  cargarFragmento('pie', 'ej11_pie.html')
]).catch((error) => {
  console.error(error);
  const contenidoMensajes = document.getElementById('pie');
  contenidoMensajes.textContent = 'No se pudo cargar la página correctamente.';
});
````

### 6. Iniciar y verificar

Desde `PROFESOR`:

````powershell
npm start
````

Abre `http://localhost:3000`, selecciona **Ingresar** y prueba un registro nuevo. La página debe mostrar la confirmación en el pie; si la cédula o el correo están duplicados, mostrará el error correspondiente. La contraseña de PostgreSQL debe permanecer en `.env` y ser solo para desarrollo local.