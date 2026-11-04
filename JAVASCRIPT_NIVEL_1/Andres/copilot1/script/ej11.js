const formulario = document.querySelector("#formulario-contacto");
const mensajes = document.querySelector("#mensajes");

function mostrarMensaje(texto, tipo) {
    mensajes.textContent = texto;
    mensajes.className = `alert alert-${tipo}`;
}

document.querySelectorAll("[data-seccion]").forEach((enlace) => {
    enlace.addEventListener("click", () => {
        const seccionActiva = enlace.dataset.seccion;

        document.querySelectorAll("main section").forEach((seccion) => {
            seccion.classList.toggle("d-none", seccion.id !== `seccion-${seccionActiva}`);
        });
        document.querySelectorAll("[data-seccion]").forEach((opcion) => {
            opcion.classList.toggle("active", opcion === enlace);
        });

        if (seccionActiva !== "ingresar") {
            mensajes.classList.add("d-none");
        }
    });
});

formulario.addEventListener("submit", async (evento) => {
    evento.preventDefault();
    const boton = formulario.querySelector('[type="submit"]');
    boton.disabled = true;

    try {
        const respuesta = await fetch("/api/contactos", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(Object.fromEntries(new FormData(formulario))),
        });
        const resultado = await respuesta.json();

        mostrarMensaje(resultado.mensaje, respuesta.ok ? "success" : "danger");
        if (respuesta.ok) {
            formulario.reset();
        }
    } catch {
        mostrarMensaje("No fue posible comunicarse con el servidor.", "danger");
    } finally {
        boton.disabled = false;
    }
});

formulario.addEventListener("reset", () => {
    mensajes.className = "alert d-none";
    mensajes.textContent = "";
});