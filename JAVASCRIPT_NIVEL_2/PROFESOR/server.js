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

app.patch('/api/contactos/:id', async (req, res) => {
  const id = req.params.id;

  if (!/^[1-9]\d*$/.test(id) || Number(id) > 2147483647) {
    return res.status(400).json({ mensaje: 'El ID del contacto no es válido.' });
  }

  const campos = ['nombre', 'apellido', 'telefono', 'direccion'];
  const cambios = {};

  for (const campo of campos) {
    const valor = req.body?.[campo];

    if (typeof valor !== 'string' || !valor.trim()) {
      return res.status(400).json({
        mensaje: `El campo ${campo} es obligatorio.`
      });
    }

    cambios[campo] = valor.trim();
  }

  const limites = {
    nombre: 80,
    apellido: 80,
    telefono: 15
  };

  for (const [campo, limite] of Object.entries(limites)) {
    if (cambios[campo].length > limite) {
      return res.status(400).json({
        mensaje: `El campo ${campo} no puede superar ${limite} caracteres.`
      });
    }
  }

  try {
    const resultado = await pool.query(
      `UPDATE contactos
       SET nombre = $1,
           apellido = $2,
           telefono = $3,
           direccion = $4
       WHERE id = $5
       RETURNING id`,
      [
        cambios.nombre,
        cambios.apellido,
        cambios.telefono,
        cambios.direccion,
        Number(id)
      ]
    );

    if (resultado.rowCount === 0) {
      return res.status(404).json({
        mensaje: 'No se encontró el contacto que se desea actualizar.'
      });
    }

    return res.json({
      mensaje: 'Contacto actualizado correctamente.'
    });
  } catch (error) {
    console.error('Error al actualizar el contacto:', error.message);
    return res.status(500).json({
      mensaje: 'No se pudo actualizar el contacto.'
    });
  }
});


app.delete('/api/contactos/:id', async (req, res) => {
  const id = req.params.id;

  if (!/^[1-9]\d*$/.test(id) || Number(id) > 2147483647) {
    return res.status(400).json({ mensaje: 'El ID del contacto no es válido.' });
  }

  try {
    const resultado = await pool.query(
      `DELETE FROM contactos
       WHERE id = $1
       RETURNING id, cedula`,
      [Number(id)]
    );

    if (resultado.rowCount === 0) {
      return res.status(404).json({
        mensaje: 'El contacto ya no existe o no fue encontrado.'
      });
    }

    return res.json({
      mensaje: `Se borró el contacto con cédula ${resultado.rows[0].cedula}.`
    });
  } catch (error) {
    console.error('Error al borrar el contacto:', error.message);
    return res.status(500).json({
      mensaje: 'No se pudo borrar el contacto.'
    });
  }
});

app.get('/api/contactos', async (req, res) => {
  try {
    const resultado = await pool.query(
      `SELECT id, cedula, nombre, apellido, telefono, correo_electronico, direccion
       FROM contactos
       ORDER BY id`
    );

    return res.json({ contactos: resultado.rows });
  } catch (error) {
    console.error('Error al generar el reporte:', error.message);
    return res.status(500).json({
      mensaje: 'No se pudo generar el reporte de contactos.'
    });
  }
});

app.get('/api/contactos/:cedula', async (req, res) => {
  const cedula = req.params.cedula.trim();

  if (!cedula || cedula.length > 10) {
    return res.status(400).json({ mensaje: 'La cédula no es válida.' });
  }

  try {
    const resultado = await pool.query(
      `SELECT cedula, nombre, apellido, telefono, correo_electronico, direccion
       FROM contactos
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