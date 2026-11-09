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

app.get('/api/contactos_js/:cedula', async (req, res) => {
  const cedula = req.params.cedula.trim();

  if (!cedula || cedula.length > 10) {
    return res.status(400).json({ mensaje: 'La cédula no es válida.' });
  }

  try {
    const resultado = await pool.query(
      `SELECT cedula, nombre, apellido, telefono, email, direccion
       FROM contactos_js
       WHERE cedula = $1`,
      [cedula]
    );

    if (resultado.rowCount === 0) {
      return res.status(404).json({
        mensaje: 'No se encontró un contacto con esa cédula.'
      });
    }

    return res.json({ contacto: resultado.rows[0] });
  } catch (error) {
    console.error('Error al consultar el contacto:', error.message);
    return res.status(500).json({
      mensaje: 'No se pudo consultar el contacto. Verifica la conexión con la base de datos.'
    });
  }
});

app.post('/api/contactos_js', async (req, res) => {
  const campos = [
    'cedula',
    'nombre',
    'apellido',
    'telefono',
    'email',
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

  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(contacto.email)) {
    return res.status(400).json({ mensaje: 'El email no es válido.' });
  }

  try {
    const resultado = await pool.query(
      `INSERT INTO contactos_js
        (cedula, nombre, apellido, telefono, email, direccion)
       VALUES ($1, $2, $3, $4, $5, $6)
       RETURNING id`,
      [
        contacto.cedula,
        contacto.nombre,
        contacto.apellido,
        contacto.telefono,
        contacto.email,
        contacto.direccion
      ]
    );

    return res.status(201).json({
      mensaje: `Contacto guardado correctamente. ID: ${resultado.rows[0].id}.`
    });
  } catch (error) {
    if (error.code === '23505') {
      const campo = error.constraint === 'contactos_js_cedula_key'
        ? 'La cédula'
        : error.constraint === 'contactos_js_email_key'
          ? 'El email'
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