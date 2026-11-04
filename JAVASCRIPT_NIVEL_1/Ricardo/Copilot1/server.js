const express = require("express");
const fs = require("node:fs/promises");
const path = require("node:path");
const { Pool } = require("pg");
/**
 * Profesor: 3000
 * José    : 3001
 * Ricardo : 3002
 * Andrés  : 3003
 */

const app = express();
const puerto = 3000;
const directorio = path.join(__dirname, "archivos");
const archivoCsv = path.join(directorio, "usuarios.csv");
const db = new Pool({
    host: "localhost",
    database: "db_ricardo",
    port: 5432,
    user: "postgres",
    password: "123456"
});

app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

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

app.post("/contactos", async (req, res) => {
    const campos = ["cedula", "nombre", "apellido", "telefono", "correo_electronico", "direccion"];
    const datos = Object.fromEntries(
        campos.map(campo => [campo, String(req.body[campo] ?? "").trim()])
    );

    const limites = { cedula: 10, nombre: 80, apellido: 80, telefono: 15 };

    for (const campo of Object.keys(limites)) {
        if (!datos[campo]) {
            return res.status(400).json({ mensaje: `El campo ${campo} es obligatorio.` });
        }
        if (datos[campo].length > limites[campo]) {
            return res.status(400).json({ mensaje: `El campo ${campo} supera el máximo permitido.` });
        }
    }

    if (!datos.correo_electronico) {
        return res.status(400).json({ mensaje: "El correo electrónico es obligatorio." });
    }

    try {
        const resultado = await db.query(
            `INSERT INTO contactos
             (cedula, nombre, apellido, telefono, correo_electronico, direccion)
             VALUES ($1, $2, $3, $4, $5, $6)
             RETURNING *`,
            campos.map(campo => datos[campo])
        );

        res.status(201).json({
            mensaje: "Contacto guardado correctamente.",
            contacto: resultado.rows[0]
        });
    } catch (error) {
        if (error.code === "23505") {
            const repetido = error.constraint === "contactos_cedula_key"
                ? "La cédula ya existe."
                : "El correo electrónico ya existe.";
            return res.status(409).json({ mensaje: repetido });
        }

        console.error("Error al guardar el contacto:", error);
        res.status(500).json({ mensaje: "No fue posible guardar el contacto." });
    }
});

app.listen(puerto, () => {
    console.log(`Servidor disponible en http://localhost:${puerto}/ej11_index.html`);
});