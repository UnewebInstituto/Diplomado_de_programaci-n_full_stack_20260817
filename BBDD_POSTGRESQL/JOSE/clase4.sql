INSERT INTO public.trabajadores(nombre, apellido, cargo, fecha_ingreso)	VALUES
('NELLY', 'CONTRERAS', 'ASISTENTE ADMINISTRATIVO', '2000-04-15');

INSERT INTO public.emergencias(trabajadores_id, persona, direccion, alergias, notas) VALUES
    (1 ,
    ROW('MARIA', 'PEREZ', '{"212000001", "212000002"}', '{"mperez@trabajo", "mperez@personal"}'),
    'CHACAITO', 'PENICILINA', 'DIABETES TIPO 2');

INSERT INTO public.emergencias(trabajadores_id, persona, direccion, alergias, notas) VALUES
(1 ,ROW('MARIA', 'PEREZ', ARRAY['212000001', '212000002'], ARRAY['mperez@trabajo', 'mperez@personal']), 'CHACAITO', 'PENICILINA', 'DIABETES TIPO 2');

    -- Consulta del tipo de dato

SELECT  T.nombre,
        T.apellido,
        T.cargo,
        T.fecha_ingreso,
        (E.persona).nombre AS "Nombre EMERGENCIA",
        (E.persona).apellido AS "Nombre EMERGENCIA",
        (E.persona).correo AS "Nombre EMERGENCIA",
        (E.persona).telefono AS "Nombre EMERGENCIA", 
      	 E.direccion AS "Nombre EMERGENCIA",
        E.alergias AS "Nombre EMERGENCIA"
FROM    trabajadores AS T,
        emergencias AS E
WHERE   E.trabajadores_id = T.id
;
-- ███ CREATED WITH POSTGRESQL ███

CREATE TYPE public.cargo AS ENUM
    ('OPERADOR', 'SUPERVISOR', 'COORDINADOR', 'ASISTENTE', 'GERENTE');

ALTER TYPE public.cargo
    OWNER TO postgres;
-- ███                         ███

INSERT INTO public.trabajadores(
    nombre, apellido, cargos, fecha_ingreso
    ) VALUES
    ('YOLANDA', 'TORTOZA', 'COORDINADOR', '2001-05-30');

    -- Actualiza la tabla para agregar un bonus de 12%
UPDATE trabajadores SET bonus = 0.12;

UPDATE trabajadores SET cargos = 'OPERADOR' WHERE id = 1;

INSERT INTO public.trabajadores(nombre, apellido, cargos, fecha_ingreso) VALUES
    ('ANA', 'VASQUEZ', 'GERENTE', '2025-12-15', 0.20);

UPDATE trabajadores SET salario = 500 WHERE id = 1;
UPDATE trabajadores SET salario = 1000 WHERE id = 2;
UPDATE trabajadores SET salario = 400 WHERE id = 3;

ALTER TABLE trabajadores 
ADD COLUMN pago_bono NUMERIC(12,2) 
GENERATED ALWAYS AS (salario * bonificacion) STORED;


INSERT INTO public.trabajadores(nombre, apellido, cargos, fecha_ingreso, bonus, salario) VALUES
    ('SUSANA', 'GUERRERO', 'OPERADOR', '2025-06-15', '0.15', '400.00');