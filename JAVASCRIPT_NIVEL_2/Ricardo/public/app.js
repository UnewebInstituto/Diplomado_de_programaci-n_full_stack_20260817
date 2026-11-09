const contenido = document.getElementById('contenido');

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

  if (enlacePendiente) {
    evento.preventDefault();
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

Promise.all([
  cargarFragmento('encabezado', 'encabezado.html'),
  cargarFragmento('pie', 'pie.html')
]).catch((error) => {
  console.error(error);
  const contenidoMensajes = document.getElementById('pie');
  contenidoMensajes.textContent = 'No se pudo cargar la página correctamente.';
});