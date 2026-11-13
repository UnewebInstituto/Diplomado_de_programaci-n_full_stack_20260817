const contenido = document.getElementById('contenido');

let contactosParaActualizar = [];

async function cargarContactosParaActualizar() {
  const cuerpoTabla = document.getElementById('tabla-actualizar-contactos');
  const respuesta = await fetch('/api/contactos');
  const resultado = await respuesta.json();

  if (!respuesta.ok) {
    throw new Error(resultado.mensaje || 'No se pudieron cargar los contactos.');
  }

  if (!Array.isArray(resultado.contactos)) {
    throw new Error('El servidor devolvió una lista de contactos no válida.');
  }

  contactosParaActualizar = resultado.contactos;
  cuerpoTabla.replaceChildren();

  if (contactosParaActualizar.length === 0) {
    const fila = document.createElement('tr');
    const celda = document.createElement('td');
    celda.colSpan = 8;
    celda.className = 'text-center';
    celda.textContent = 'No hay contactos registrados.';
    fila.appendChild(celda);
    cuerpoTabla.appendChild(fila);
    mostrarMensaje('No hay contactos registrados.', 'info');
    return;
  }

  const campos = [
    'id',
    'cedula',
    'nombre',
    'apellido',
    'telefono',
    'correo_electronico',
    'direccion'
  ];

  for (const contacto of contactosParaActualizar) {
    const fila = document.createElement('tr');

    for (const campo of campos) {
      const celda = document.createElement('td');
      celda.textContent = contacto[campo] ?? '';
      fila.appendChild(celda);
    }

    const celdaAccion = document.createElement('td');
    const boton = document.createElement('button');
    boton.type = 'button';
    boton.className = 'btn btn-warning btn-sm';
    boton.textContent = 'Actualizar';
    boton.dataset.actualizarId = contacto.id;
    boton.setAttribute(
      'aria-label',
      `Actualizar contacto con cédula ${contacto.cedula ?? ''}`
    );

    celdaAccion.appendChild(boton);
    fila.appendChild(celdaAccion);
    cuerpoTabla.appendChild(fila);
  }

  mostrarMensaje(`Contactos cargados: ${contactosParaActualizar.length}.`, 'info');
}

function mostrarFormularioActualizacion(contacto) {
  contenido.innerHTML = `
    <h2>Actualizar contacto</h2>
    <form id="form-actualizar-contacto" data-contacto-id="">
      <div class="row">
        <div class="col-md-6">
          <div class="mb-3">
            <label for="actualizar-cedula" class="form-label">Cédula:</label>
            <input class="form-control" id="actualizar-cedula" name="cedula" readonly>
          </div>
          <div class="mb-3">
            <label for="actualizar-nombre" class="form-label">Nombre:</label>
            <input class="form-control" id="actualizar-nombre" name="nombre" maxlength="80" required>
          </div>
          <div class="mb-3">
            <label for="actualizar-apellido" class="form-label">Apellido:</label>
            <input class="form-control" id="actualizar-apellido" name="apellido" maxlength="80" required>
          </div>
        </div>
        <div class="col-md-6">
          <div class="mb-3">
            <label for="actualizar-telefono" class="form-label">Teléfono:</label>
            <input class="form-control" id="actualizar-telefono" name="telefono" maxlength="15" required>
          </div>
          <div class="mb-3">
            <label for="actualizar-correo" class="form-label">Correo electrónico:</label>
            <input class="form-control" type="email" id="actualizar-correo" name="correo_electronico" readonly>
          </div>
          <div class="mb-3">
            <label for="actualizar-direccion" class="form-label">Dirección:</label>
            <textarea class="form-control" id="actualizar-direccion" name="direccion" required></textarea>
          </div>
        </div>
      </div>
      <button class="btn btn-primary" type="submit">Guardar</button>
      <button class="btn btn-secondary" type="button" data-cancelar-actualizacion>
        Volver
      </button>
    </form>
  `;

  const formulario = document.getElementById('form-actualizar-contacto');
  formulario.dataset.contactoId = contacto.id;
  formulario.elements.cedula.value = contacto.cedula ?? '';
  formulario.elements.nombre.value = contacto.nombre ?? '';
  formulario.elements.apellido.value = contacto.apellido ?? '';
  formulario.elements.telefono.value = contacto.telefono ?? '';
  formulario.elements.correo_electronico.value = contacto.correo_electronico ?? '';
  formulario.elements.direccion.value = contacto.direccion ?? '';

  mostrarMensaje('');
}


function mostrarTablaBorrarVacia(cuerpoTabla) {
  const fila = document.createElement('tr');
  const celda = document.createElement('td');

  celda.colSpan = 8;
  celda.className = 'text-center';
  celda.textContent = 'No hay contactos registrados.';
  fila.appendChild(celda);
  cuerpoTabla.appendChild(fila);
}

async function cargarContactosParaBorrar() {
  const cuerpoTabla = document.getElementById('tabla-borrar-contactos');
  const respuesta = await fetch('/api/contactos');
  const resultado = await respuesta.json();

  if (!respuesta.ok) {
    throw new Error(resultado.mensaje || 'No se pudieron cargar los contactos.');
  }

  if (!Array.isArray(resultado.contactos)) {
    throw new Error('El servidor devolvió una lista de contactos no válida.');
  }

  cuerpoTabla.replaceChildren();

  if (resultado.contactos.length === 0) {
    mostrarTablaBorrarVacia(cuerpoTabla);
    mostrarMensaje('No hay contactos registrados.', 'info');
    return;
  }

  const campos = [
    'id',
    'cedula',
    'nombre',
    'apellido',
    'telefono',
    'correo_electronico',
    'direccion'
  ];

  for (const contacto of resultado.contactos) {
    const fila = document.createElement('tr');
    fila.dataset.contactoId = contacto.id;

    for (const campo of campos) {
      const celda = document.createElement('td');
      celda.textContent = contacto[campo] ?? '';
      fila.appendChild(celda);
    }

    const celdaAccion = document.createElement('td');
    const boton = document.createElement('button');
    boton.type = 'button';
    boton.className = 'btn btn-danger btn-sm';
    boton.textContent = 'Borrar';
    boton.dataset.borrarId = contacto.id;
    boton.dataset.cedula = contacto.cedula ?? '';
    boton.setAttribute('aria-label', `Borrar contacto con cédula ${contacto.cedula ?? ''}`);

    celdaAccion.appendChild(boton);
    fila.appendChild(celdaAccion);
    cuerpoTabla.appendChild(fila);
  }

  mostrarMensaje(`Contactos cargados: ${resultado.contactos.length}.`, 'info');
}

async function cargarReporte() {
  const cuerpoTabla = document.getElementById('tabla-contactos');
  const respuesta = await fetch('/api/contactos');
  const resultado = await respuesta.json();

  if (!respuesta.ok) {
    throw new Error(resultado.mensaje || 'No se pudo cargar el reporte.');
  }

  if (!Array.isArray(resultado.contactos)) {
    throw new Error('El servidor devolvió un reporte no válido.');
  }

  cuerpoTabla.replaceChildren();

  if (resultado.contactos.length === 0) {
    const fila = document.createElement('tr');
    const celda = document.createElement('td');
    celda.colSpan = 7;
    celda.textContent = 'No hay contactos registrados.';
    fila.appendChild(celda);
    cuerpoTabla.appendChild(fila);
    mostrarMensaje('No hay contactos registrados.', 'info');
    return;
  }

  const campos = [
    'id',
    'cedula',
    'nombre',
    'apellido',
    'telefono',
    'correo_electronico',
    'direccion'
  ];

  for (const contacto of resultado.contactos) {
    const fila = document.createElement('tr');

    for (const campo of campos) {
      const celda = document.createElement('td');
      celda.textContent = contacto[campo] ?? '';
      fila.appendChild(celda);
    }

    cuerpoTabla.appendChild(fila);
  }

  mostrarMensaje(`Reporte cargado: ${resultado.contactos.length} contacto(s).`, 'success');
}


function mostrarMensaje(texto, tipo = 'info') {
  const mensajes = document.getElementById('mensajes');
  if (!mensajes) return;

  mensajes.replaceChildren();
  if (!texto) return;

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

async function mostrarVista(archivo) {
  const respuesta = await fetch(`./${archivo}`);
  if (!respuesta.ok) throw new Error(`No se pudo cargar ${archivo}.`);
  contenido.innerHTML = await respuesta.text();
  mostrarMensaje('');
}

document.addEventListener('click', async (evento) => {
  const boton = evento.target.closest('[data-borrar-id]');
  if (!boton) return;

  const id = boton.dataset.borrarId;
  const cedula = boton.dataset.cedula;

  if (!window.confirm(`¿Deseas borrar el contacto con cédula ${cedula}?`)) {
    return;
  }

  boton.disabled = true;

  try {
    const respuesta = await fetch(`/api/contactos/${encodeURIComponent(id)}`, {
      method: 'DELETE'
    });
    const resultado = await respuesta.json();

    if (!respuesta.ok) {
      throw new Error(resultado.mensaje || 'No se pudo borrar el contacto.');
    }

    const fila = boton.closest('tr');
    const cuerpoTabla = document.getElementById('tabla-borrar-contactos');
    fila.remove();

    if (cuerpoTabla.querySelectorAll('tr[data-contacto-id]').length === 0) {
      mostrarTablaBorrarVacia(cuerpoTabla);
    }

    mostrarMensaje(resultado.mensaje, 'success');
  } catch (error) {
    mostrarMensaje(error.message || 'No se pudo contactar al servidor.', 'danger');
  } finally {
    if (boton.isConnected) boton.disabled = false;
  }
});

document.addEventListener('click', async (evento) => {
  const enlaceVista = evento.target.closest('[data-view]');
  const enlacePendiente = evento.target.closest('[data-feature]');

  if (enlaceVista) {
    evento.preventDefault();

    try {
      await mostrarVista('ingresar.html');
    } catch (error) {
      mostrarMensaje(error.message, 'danger');
    }
  }

  /*
  if (enlacePendiente) {
    evento.preventDefault();
    //console.log(`Opción pendiente: ${enlacePendiente.dataset.feature}`);
    //console.log(`Opción pendiente: ${enlacePendiente.dataset}`);
    if (enlacePendiente.dataset.feature.toLowerCase() === 'consultar') {
      try {
        await mostrarVista('consultar.html');
      } catch (error) {
        mostrarMensaje(error.message, 'danger');
      }
    } else {
      mostrarMensaje(`La opción "${enlacePendiente.dataset.feature}" aún no está implementada.`, 'warning');
    }
  }
*/
if (enlacePendiente) {
  evento.preventDefault();
  const opcion = enlacePendiente.dataset.feature.toLowerCase();

  try {
    if (opcion === 'consultar') {
      await mostrarVista('consultar.html');
    } else if (opcion === 'reporte') {
      await mostrarVista('reporte.html');
      await cargarReporte();
    } else if (opcion === 'borrar') {
      await mostrarVista('borrar.html');
      await cargarContactosParaBorrar();
    } else if (opcion === 'actualizar') {
      await mostrarVista('actualizar.html');
      await cargarContactosParaActualizar(); 
    } else {
      mostrarMensaje(
        `La opción "${enlacePendiente.dataset.feature}" aún no está implementada.`,
        'warning'
      );
    }
  } catch (error) {
    mostrarMensaje(error.message, 'danger');
  }
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

document.addEventListener('submit', async (evento) => {
  if (evento.target.id !== 'form-consultar') return;

  evento.preventDefault();
  const formulario = evento.target;
  const boton = formulario.querySelector('[type="submit"]');
  const cedula = formulario.elements.cedula.value.trim();
  const nombresCampos = [
    'nombre',
    'apellido',
    'telefono',
    'correo_electronico',
    'direccion'
  ];
  boton.disabled = true;

  for (const nombreCampo of nombresCampos) {
    formulario.elements[nombreCampo].value = '';
  }

  try {
    const respuesta = await fetch(`/api/contactos/${encodeURIComponent(cedula)}`);
    const resultado = await respuesta.json();

    if (respuesta.status === 404) {
      mostrarMensaje(resultado.mensaje || 'No se encontró un contacto con esa cédula.', 'warning');
      return;
    }

    if (!respuesta.ok) {
      throw new Error(resultado.mensaje || 'Ocurrió un error al consultar.');
    }

    const contacto = resultado.contacto;
    if (!contacto) throw new Error('El servidor no devolvió los datos del contacto.');

    for (const nombreCampo of nombresCampos) {
      formulario.elements[nombreCampo].value = contacto[nombreCampo] ?? '';
    }

    mostrarMensaje('Contacto encontrado.', 'success');
  } catch (error) {
    mostrarMensaje(error.message || 'No se pudo contactar al servidor.', 'danger');
  } finally {
    boton.disabled = false;
  }
});

document.addEventListener('click', async (evento) => {
  const botonActualizar = evento.target.closest('[data-actualizar-id]');
  const botonVolver = evento.target.closest('[data-cancelar-actualizacion]');

  if (botonActualizar) {
    const contacto = contactosParaActualizar.find(
      (item) => String(item.id) === botonActualizar.dataset.actualizarId
    );

    if (contacto) {
      mostrarFormularioActualizacion(contacto);
    }

    return;
  }

  if (botonVolver) {
    try {
      await mostrarVista('actualizar.html');
      await cargarContactosParaActualizar();
    } catch (error) {
      mostrarMensaje(error.message, 'danger');
    }
  }
});

document.addEventListener('submit', async (evento) => {
  if (evento.target.id !== 'form-actualizar-contacto') return;

  evento.preventDefault();

  const formulario = evento.target;
  const boton = formulario.querySelector('[type="submit"]');
  const id = formulario.dataset.contactoId;
  boton.disabled = true;

  const cambios = {
    nombre: formulario.elements.nombre.value.trim(),
    apellido: formulario.elements.apellido.value.trim(),
    telefono: formulario.elements.telefono.value.trim(),
    direccion: formulario.elements.direccion.value.trim()
  };

  try {
    const respuesta = await fetch(`/api/contactos/${encodeURIComponent(id)}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(cambios)
    });

    const resultado = await respuesta.json();

    if (!respuesta.ok) {
      throw new Error(resultado.mensaje || 'No se pudo actualizar el contacto.');
    }

    await mostrarVista('actualizar.html');
    await cargarContactosParaActualizar();
    mostrarMensaje(resultado.mensaje || 'Contacto actualizado correctamente.', 'success');
  } catch (error) {
    mostrarMensaje(error.message || 'No se pudo contactar al servidor.', 'danger');
  } finally {
    if (boton.isConnected) boton.disabled = false;
  }
});

Promise.all([
  cargarFragmento('encabezado', 'encabezado.html'),
  cargarFragmento('pie', 'pie.html')
]).catch((error) => {
  console.error(error);
  const contenidoMensajes = document.getElementById('pie');
  contenidoMensajes.textContent = 'No se pudo cargar la página correctamente.';
});


