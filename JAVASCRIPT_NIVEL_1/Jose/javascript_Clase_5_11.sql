-- Conexión

\c db_jose;

-- Tabla contactos
create table contactos_js(
    id serial primary key,
    cedula varchar(10),
    nombre varchar(80),
    apellido varchar(80),
    telefono varchar(15),
    email text,
    direccion text,
    unique(cedula),
    unique(email)
);