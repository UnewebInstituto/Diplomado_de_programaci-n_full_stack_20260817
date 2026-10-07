-- ███ CREATED WITH POSTGRESQL ███-
BEGIN;


CREATE TABLE IF NOT EXISTS a_practica02.espacios
(
    id serial,
    nombre text,
    estatus a_practica02.nombre_estatus,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS a_practica02.reservas
(
    id serial,
    espacio_id integer,
    persona_id integer,
    evento text,
    inicio_tiempo timestamp without time zone DEFAULT NOW(),
    final_tiempo timestamp without time zone DEFAULT NOW(),
    estatus a_practica02.reserva_estatus,
    reserva_tiempo interval GENERATED ALWAYS AS (final_tiempo - inicio_tiempo) STORED,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS a_practica02.persona
(
    id serial,
    nombre character varying(40),
    apellido character varying(40),
    tipo a_practica02.personas_tipo,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS a_practica02.reservas
    ADD FOREIGN KEY (espacio_id)
    REFERENCES a_practica02.espacios (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS a_practica02.reservas
    ADD FOREIGN KEY (persona_id)
    REFERENCES a_practica02.persona (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
-- ███                         ███

ALTER TABLE IF EXISTS a_practica02.espacios
    RENAME nombre TO ubicacion;

INSERT INTO a_practica02.persona (nombre, apellido, tipo) VALUES
('Carlos', 'Pérez', 'EMPLEADO_ADMIN'),
('María', 'Gómez', 'PROFESOR'),
('Ana', 'Rodríguez', 'PROFESOR');

INSERT INTO a_practica02.espacios (ubicacion, estatus) VALUES
('Sala de Conferencias A - Torre Este', 'DISPONIBLE'),
('Auditorio Principal - Planta Baja', 'REPARACION'),
('Laboratorio de Computación 1', 'OCUPADO'),
('Cancha de Multiple Uso', 'DISPONIBLE');

ABIERTA
CERRADA
CANCELADA

INSERT INTO a_practica02.reservas (espacio_id, persona_id, evento, inicio_tiempo, final_tiempo, estatus) VALUES
(
    4, 
    3, 
    'Torneo futbol inter-universidades', 
    '2026-10-13 09:00:00', 
    '2026-10-13 12:30:00', 
    'ABIERTA'
),
(
    2, 
    2, 
    'Defensa trabajo de grado', 
    '2026-10-13 14:00:00', 
    '2026-10-13 16:30:00', 
    'CANCELADA'
),
(
    1, 
    1, 
    'Induccion de nuevos estudiantes', 
    '2026-10-14 10:00:00', 
    '2026-10-14 12:00:00', 
    'ABIERTA'
);