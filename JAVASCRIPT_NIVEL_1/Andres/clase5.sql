-- Conexión se efectuará a la base de datos db_andres

\c db_andres;

--Cear la tabla contactos
create table contactos(
    id serial primary key,
    cedula varchar(10),
    nombre varchar(80),
    apellido varchar(80),
    telefono varchar(15),
    correo_electronico text,
    direccion text,
    unique(cedula),
    unique(correo_electronico)
);

