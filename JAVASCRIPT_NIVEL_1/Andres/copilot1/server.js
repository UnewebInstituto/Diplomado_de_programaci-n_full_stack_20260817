const express = require("express");
const fs = require("node:fs/promises");
const path = require("node:path");
const { Pool } = require("pg");
require("dotenv").config();

const app = express();
const puerto = 3003;
const directorio = path.join(__dirname, "archivos");
const archivoCsv = path.join(directorio, "usuarios.csv");
const directorioPublico = path.join(__dirname, "public");
const pool = new Pool({
    host: process.env.DB_HOST || "localhost",
    port: Number(process.env.DB_PORT || 5432),
    database: process.env.DB_NAME || "db_andres",
    user: process.env.DB_USER || "postgres",
    password: process.env.DB_PASSWORD,
});

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.get(["/", "/ej11_index.html"], async (req, res) => {
    try {
        const [pagina, encabezado, formulario, pie] = await Promise.all([
            fs.readFile(path.join(directorioPublico, "ej11_index.html"), "utf8"),
            fs.readFile(path.join(directorioPublico, "ej11_encabezado.html"), "utf8"),
            fs.readFile(path.join(directorioPublico, "ej11_ingresar.html"), "utf8"),
            fs.readFile(path.join(directorioPublico, "ej11_pie.html"), "utf8"),
        ]);

        res.type("html").send(
            pagina
                .replace("<!-- ENCABEZADO -->", encabezado)
                .replace("<!-- FORMULARIO -->", formulario)
                .replace("<!-- PIE -->", pie)
        );
    } catch (error) {
        console.error(error);
        res.status(500).send("No se pudo cargar la página de contactos.");
    }
});

app.use(express.static(directorioPublico, { index: false }));

app.post("/api/contactos", async (req, res) => {
    const campos = [
        "cedula",
        "nombre",
        "apellido",
        "telefono",
        "correo_electronico",
        "direccion",
    ];
    const contacto = Object.fromEntries(
        campos.map((campo) => [campo, String(req.body[campo] ?? "").trim()])
    );

    if (!contacto.cedula || !contacto.nombre || !contacto.apellido || !contacto.correo_electronico) {
        return res.status(400).json({ mensaje: "Completa cédula, nombre, apellido y correo electrónico." });
    }

    if (
        contacto.cedula.length > 10 ||
        contacto.nombre.length > 80 ||
        contacto.apellido.length > 80 ||
        contacto.telefono.length > 15 ||
        !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(contacto.correo_electronico)
    ) {
        return res.status(400).json({ mensaje: "Revisa el formato y la longitud de los datos ingresados." });
    }

    if (!process.env.DB_PASSWORD) {
        return res.status(500).json({ mensaje: "Falta configurar la contraseña de la base de datos en .env." });
    }

    try {
        await pool.query(
            `INSERT INTO contactos
                (cedula, nombre, apellido, telefono, correo_electronico, direccion)
             VALUES ($1, $2, $3, $4, $5, $6)`,
            campos.map((campo) => contacto[campo])
        );
        res.status(201).json({ mensaje: "Contacto guardado correctamente." });
    } catch (error) {
        if (error.code === "23505") {
            return res.status(409).json({ mensaje: "Ya existe un contacto con esa cédula o correo electrónico." });
        }

        console.error("Error al guardar contacto:", error.message);
        res.status(500).json({ mensaje: "No se pudo guardar el contacto. Verifica la conexión y la tabla contactos." });
    }
});

function campoCsv(valor) {
    return `"${String(valor ?? "").trim().replace(/"/g, '""')}"`;
}

app.post("/usuarios", async (req, res) => {
    try {
        const { nombre, apellido, correo } = req.body;

        if (!nombre || !apellido || !correo) {
            return res.status(400).send("Completa nombre, apellido y correo.");
        }

        await fs.mkdir(directorio, { recursive: true });

        try {
            await fs.access(archivoCsv);
        } catch {
            await fs.writeFile(
                archivoCsv,
                "nombre,apellido,correo\r\n",
                "utf8"
            );
        }

        const fila = [nombre, apellido, correo].map(campoCsv).join(",");
        await fs.appendFile(archivoCsv, `${fila}\r\n`, "utf8");

        res.status(201).send("Usuario guardado correctamente.");
    } catch (error) {
        console.error(error);
        res.status(500).send("No se pudo guardar el usuario.");
    }
});

app.listen(puerto, () => {
    console.log(`Servidor disponible en http://localhost:${puerto}/`);
});
