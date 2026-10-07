CREATE TABLE IF NOT EXISTS practica02.reservas
(
    id serial,
    espacio_id integer,
    persona_id integer,
    evento text,
    inicio_fecha_hora timestamp without time zone DEFAULT NOW(),
    fin_fecha_hora timestamp without time zone DEFAULT NOW(),
    estatus practica02.reserva_estatus,
    -- Cambiamos a INTERVAL para almacenar correctamente la diferencia de tiempo
    tiempo_reserva interval GENERATED ALWAYS AS (fin_fecha_hora - inicio_fecha_hora) STORED,
    PRIMARY KEY (id)
);


-- DATA DE PRUEBA

-- =========================================================
-- 1. SEMBRADO DE DATOS: ESPACIOS
-- =========================================================
INSERT INTO practica02.espacios (ubicacion, estatus) VALUES
('Sala de Conferencias A - Torre Este', 'disponible'),
('Auditorio Principal - Planta Baja', 'en_reparacion'),
('Laboratorio de Computación 1', 'ocupado'),
('Cancha de usos múltiples', 'disponible');


-- =========================================================
-- 2. SEMBRADO DE DATOS: PERSONAS
-- =========================================================
INSERT INTO practica02.personas (nombre, apellido, tipo) VALUES
('Carlos', 'Pérez', 'empleado_administrativo'),
('María', 'Gómez', 'profesor'),
('Ana', 'Rodríguez', 'profesor');


-- =========================================================
-- 3. SEMBRADO DE DATOS: RESERVAS
-- =========================================================
-- (Nota: espacio_id y persona_id hacen referencia a los IDs 
-- generados en los bloques anteriores de espacios y personas)
    INSERT INTO practica02.reservas (espacio_id, persona_id, evento, inicio_fecha_hora, fin_fecha_hora, estatus) VALUES
    (
        4, 
        3, 
        'Juego semifinal torneo futbol interuniversidades', 
        '2026-10-13 09:00:00', 
        '2026-10-13 12:30:00', 
        'abierta'
    ),
    (
        2, 
        2, 
        'Defensa de Trabajo de Grado', 
        '2026-10-13 14:00:00', 
        '2026-10-13 16:00:00', 
        'abierta'
    ),
    (
        1, 
        3, 
        'Inducción de nuevos estudiantes', 
        '2026-10-14 10:00:00', 
        '2026-10-14 12:00:00', 
        'abierta'
    );

alweysdata
Base de datos: Andresfranco_db_andres_pga
clave: Uneweb*01

psql -h postgresql-andresfranco.alwaysdata.net -U andresfranco -d andresfranco_db_andres_pga -f db_andres_pga_20261007.sql