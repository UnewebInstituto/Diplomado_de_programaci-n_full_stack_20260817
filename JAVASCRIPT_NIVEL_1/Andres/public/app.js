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