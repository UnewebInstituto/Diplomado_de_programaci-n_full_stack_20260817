insert into public.trabajadores(
    nombre, apellido, cargo, fecha_ingreso)
values
('NELLY', 'CONTRERAS',
'ASISTENTE ADMINISTRATIVO', '2000-04-15');

insert into emergencias(
    trabajador_id, persona, 
    direccion, alergias, notas)
values
(1, 
    ROW(
    'MARIA',
    'PEREZ',
    ARRAY['2129871234','4145678901'],
    ARRAY['mperez@trabajo.com','mperez@personal.com'])::contacto,
    'CHACAITO',
    'PENICILINA',
    'DIABETES TIPO 2'
);

SELECT t.nombre as nombre_trabajador,
       t.apellido as apellido_trabajador, 
       t.cargo as cargo_trabajador, 
       t.fecha_ingreso as fecha_ingreso_trabajador,
       e.direccion as direccion_emergencia,
       e.alergias as alergias_emergencia,
       e.notas as notas_emergencia,
       (e.persona).telefono[1] as telefono_emergencia_1,
       (e.persona).telefono[2] as telefono_emergencia_2,
       (e.persona).telefono[3] as telefono_emergencia_3,
       (e.persona).correo_electronico[1] as correo_emergencia_1,
       (e.persona).correo_electronico[2] as correo_emergencia_2,
       (e.persona).correo_electronico[3] as correo_emergencia_3
       FROM trabajadores as t,
       emergencias as e
       where t.id = e.trabajador_id
    ;


-- CREACIÓN DE TIPO DE DATOS QUE ES LISTA ENUMERADA
CREATE TYPE public.cargo AS ENUM
    ('OPERADOR(A)', 'SUPERVISOR(A)', 'COORDINADOR(A)', 'ASISTENTE', 'GERENTE');

ALTER TYPE public.cargo
    OWNER TO postgres;


-- PRUEBA DE TIPO DE DATOS ENUMERADO
insert into public.trabajadores(
    nombre, apellido, cargo, fecha_ingreso)
values
('YOLANDA', 'TORTOZA',
'COORDINADOR(A)', '2001-05-30');

-- ASIGNACIÓN DE INTERVALO DE BONIFICACIÓN A TRABAJADORES
ALTER TABLE trabajadores 
ADD COLUMN bonificacion NUMERIC(3,2) 
CONSTRAINT chk_bonificacion_rango CHECK (bonificacion >= 0.1 AND bonificacion <= 0.3);

-- ACTUALIZA LA TABLA trabajadores, ASIGNANDO UNA BONIFICACIÓN
-- DEL 12% A TODOS LOS TRABAJADORES
UPDATE trabajadores set bonificacion = 0.12;

insert into public.trabajadores(
    nombre, apellido, cargo, fecha_ingreso, bonificacion)
values
('ANA', 'VASQUEZ',
'GERENTE', '2025-12-15', 0.20);

-- SE ACTUALIZA LA TABLA trabajadores Y SE AÑADEN 2 COLUNAS NUEVAS: 
-- salario y pago_bono, ambos de tipo NUMERIC(10,2)
ALTER TABLE trabajadores
ADD COLUMN salario NUMERIC(10,2),
ADD COLUMN pago_bono NUMERIC(10,2);

-- SE AÑADE UNA REGLA PARA QUE LA COLUMNA pago_bono SEA IGUAL 
-- A LA COLUMNA salario MULTIPLICADA POR LA COLUMNA bonificacion
-- NO HAY CÁLCULO AUTOMÁTICO DE LA COLUMNA pago_bono, 
-- SE DEBE ACTUALIZAR MANUALMENTE
-- ALTER TABLE trabajadores
---ADD CONSTRAINT chk_pago_bono CHECK (pago_bono = salario * bonificacion);

-- CÁLCULO DE LA COLUMNA pago_bono COMO UNA COLUMNA CALCULADA, 
-- QUE SE GENERA SIEMPRE A PARTIR DE LA COLUMNA salario Y bonificacion
ALTER TABLE trabajadores 
ADD COLUMN pago_bono NUMERIC(12,2) 
GENERATED ALWAYS AS (salario * bonificacion) STORED;

-- PRUEBA
insert into public.trabajadores(
    nombre, apellido, cargo, fecha_ingreso, bonificacion, salario)
values
('SUSANA', 'GUERRERO',
'OPERADOR(A)', '2025-06-15', 0.15, 400.00);