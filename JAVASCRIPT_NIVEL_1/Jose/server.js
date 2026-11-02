const express = require("express");
const fs = require("node:fs/promises");
const path = require("node:path");
/**
 * José 
 */

const app = express();
const puerto = 3001;
const directorio = path.join(__dirname, "archivos");
const archivoCsv = path.join(directorio, "usuarios.csv");

app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

function campoCsv(valor) {
    return `"${String(valor ?? "").trim().replace(/"/g, '""')}"`;
}

app.post("/usuarios", async (req, res) => {
    try {
        const { nombre, apellido, email } = req.body;

        if (!nombre || !apellido || !email) {
            return res.status(400).send("Completa nombre, apellido y email.");
        }

        await fs.mkdir(directorio, { recursive: true });

        try {
            await fs.access(archivoCsv);
        } catch {
            await fs.writeFile(
                archivoCsv,
                "nombre,apellido,email\r\n",
                "utf8"
            );
        }

        const fila = [nombre, apellido, email].map(campoCsv).join(",");
        await fs.appendFile(archivoCsv, `${fila}\r\n`, "utf8");

        res.status(201).send("Usuario guardado correctamente.");
    } catch (error) {
        console.error(error);
        res.status(500).send("No se pudo guardar el usuario.");
    }
});

app.listen(puerto, () => {
    console.log(`Servidor disponible en http://localhost:${puerto}/javascript_clase_3_10.html`);
});
