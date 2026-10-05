
-- ███ CREATED WITH POSTGRESQL ███
BEGIN;


CREATE TABLE IF NOT EXISTS a_practica01.categorias
(
    id serial,
    nombre text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS a_practica01.productos
(
    id serial,
    categorias_id integer,
    nombre text,
    precio numeric(13, 2),
    cantidad integer,
    descripcion text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS a_practica01.imagenes
(
    id serial,
    productos_id integer,
    archivo text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS a_practica01.productos_etiquetas
(
    productos_id integer,
    etiquetas_id integer,
    PRIMARY KEY (productos_id, etiquetas_id)
);

CREATE TABLE IF NOT EXISTS a_practica01.usuarios
(
    id serial,
    cedula character varying(20),
    nombre character varying(100),
    apellido character varying(100),
    telefono character varying(20)[],
    correo text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS a_practica01.etiquetas
(
    id serial,
    descripcion text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS a_practica01.roles
(
    id serial,
    descripcion text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS a_practica01.usuarios_roles
(
    usuarios_id integer,
    roles_id serial,
    PRIMARY KEY (usuarios_id, roles_id)
);

CREATE TABLE IF NOT EXISTS a_practica01.calificaciones
(
    id serial,
    descripcion text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS a_practica01.calificaciones_productos_usuarios
(
    productos_id integer,
    calificaciones_id integer,
    usuarios_id integer,
    PRIMARY KEY (productos_id, calificaciones_id, usuarios_id)
);

ALTER TABLE IF EXISTS a_practica01.productos
    ADD FOREIGN KEY (categorias_id)
    REFERENCES a_practica01.categorias (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS a_practica01.imagenes
    ADD FOREIGN KEY (productos_id)
    REFERENCES a_practica01.productos (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS a_practica01.productos_etiquetas
    ADD FOREIGN KEY (productos_id)
    REFERENCES a_practica01.productos (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS a_practica01.productos_etiquetas
    ADD FOREIGN KEY (etiquetas_id)
    REFERENCES a_practica01.etiquetas (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS a_practica01.usuarios_roles
    ADD FOREIGN KEY (usuarios_id)
    REFERENCES a_practica01.usuarios (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS a_practica01.usuarios_roles
    ADD FOREIGN KEY (roles_id)
    REFERENCES a_practica01.roles (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS a_practica01.calificaciones_productos_usuarios
    ADD FOREIGN KEY (productos_id)
    REFERENCES a_practica01.productos (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS a_practica01.calificaciones_productos_usuarios
    ADD FOREIGN KEY (calificaciones_id)
    REFERENCES a_practica01.calificaciones (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS a_practica01.calificaciones_productos_usuarios
    ADD FOREIGN KEY (usuarios_id)
    REFERENCES a_practica01.usuarios (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
-- ███                         ███

    -- █ NOTE █
    -- Several id's are wrong and need to be checked.
INSERT INTO a_practica01.calificaciones (descripcion)VALUES
('Muy Malo'),
('Malo'),
('Medio'),
('Bueno'),
('Muy Bueno');

INSERT INTO a_practica01.categorias (nombre) VALUES
('Electronicos'),
('Ropa y Accesorios'),
('Hogar');

INSERT INTO a_practica01.etiquetas (descripcion)VALUES
('Nuevo'),
('Oferta'),
('Destacado'),
('Envío Gratis');

INSERT INTO a_practica01.productos (categorias_id, nombre, cantidad, precio, descripcion) VALUES
(16, 'Smartphone X', 15, 450.00, 'Teléfono inteligente de última generación'),
(17, 'Camisa Casual', 30, 25.50, 'Camisa de algodón para caballero'),
(18, 'Licuadora Pro', 10, 89.99, 'Licuadora de alta potencia con vaso de vidrio');

INSERT INTO a_practica01.imagenes (productos_id, archivo) VALUES
(7, '/imagenes/smartphone_x_1.jpg'),
(7, '/imagenes/smartphone_x_2.jpg'),
(8, '/imagenes/camisa_casual_1.jpg'),
(9  , '/imagenes/licuadora_pro_1.jpg');

INSERT INTO practica01.productos_etiquetas (productos_id, etiquetas_id) VALUES
(7, 21), -- Smartphone X -> Nuevo
(7, 22), -- Smartphone X -> Destacado
(8, 23), -- Camisa Casual -> Oferta
(9, 24); -- Licuadora Pro -> Envío Gratis

INSERT INTO a_practica01.roles (descripcion) VALUES
('Administrador'),
('Cliente'),
('Vendedor');

INSERT INTO a_practica01.usuarios (cedula, nombre, apellido, telefono, correo) VALUES
('V12345678', 'Carlos', 'Pérez', ARRAY['04121234567', '02125551234'], 'carlos.perez@email.com'),
('V87654321', 'Ana', 'Gómez', ARRAY['04149876543'], 'ana.gomez@email.com'),
('V11223344', 'Luis', 'Rodríguez', ARRAY['04241112233', '04162223344'], 'luis.rodriguez@email.com');

INSERT INTO a_practica01.usuarios_roles (usuarios_id, roles_id) VALUES
(1, 1), -- Carlos es Administrador
(2, 2), -- Ana es Cliente
(3, 3); -- Luis es Vendedor

INSERT INTO a_practica01.calificaciones_productos_usuarios (productos_id, calificaciones_id, usuarios_id) VALUES
(1, 1, 2), -- Ana calificó al Smartphone X como Muy Bueno
(2, 2, 2), -- Ana calificó a la Camisa Casual como Bueno
(3, 1, 3); -- Luis calificó a la Licuadora Pro como Muy Bueno

    -- ( 1 )
    -- Mostrar nombre de la categoría
    -- nombre del producto, descripción
    -- y precio para los productos 
    -- registrados:
SELECT A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.precio AS "Precio del producto",
       B.nombre AS "Nombre de la categoría" 
       FROM a_practica01.productos AS A, 
        a_practica01.categorias AS B 
       WHERE A.categorias_id = B.id;

    -- ( 2 )
    -- Mostrar los mismos campos de la consulta
    -- anterios para los productos que están
    -- calificados con 4 estrellas:
SELECT A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.precio AS "Precio del producto",
       B.nombre AS "Nombre de la categoría",
       D.descripcion AS "Calificación"
       FROM a_practica01.productos AS A, 
       a_practica01.categorias AS B,
       a_practica01.calificaciones_productos_usuarios AS C,
       a_practica01.calificaciones AS D
       WHERE A.categorias_id = B.id AND 
       C.productos_id = A.id AND
       C.calificaciones_id = D.id and
       C.calificaciones_id = 24;

    -- ( 3 )
    -- Mostrar nombre del producto mas caro.
SELECT A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.precio AS "Precio del producto",
       B.nombre AS "Nombre de la categoría",
       D.descripcion AS "Calificación"
       FROM a_practica01.productos AS A, 
       a_practica01.categorias AS B,
       a_practica01.calificaciones_productos_usuarios AS C,
       a_practica01.calificaciones AS D
       WHERE A.categorias_id = B.id AND 
       C.productos_id = A.id AND
       C.calificaciones_id = D.id AND
       A.precio = (SELECT MAX(precio) FROM a_practica01.productos);

    -- ( 4 )
    -- Mostrar nombre del producto mas barato.
SELECT A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.precio AS "Precio del producto",
       B.nombre AS "Nombre de la categoría",
       D.descripcion AS "Calificación"
       FROM a_practica01.productos AS A, 
       a_practica01.categorias AS B,
       a_practica01.calificaciones_productos_usuarios AS C,
       a_practica01.calificaciones AS D
       WHERE A.categorias_id = B.id AND 
       C.productos_id = A.id AND
       C.calificaciones_id = D.id AND
       A.precio = (SELECT MIN(precio) FROM a_practica01.productos);

INSERT INTO a_practica01.productos (categorias_id, nombre, cantidad, precio, descripcion) VALUES
(16, 'Smartwatch Deportivo', 0, 85.50, 'Reloj inteligente con monitor de ritmo cardíaco'),
(18, 'Licuadora Vidrio', 0, 45.00, 'Licuadora de 3 velocidades');

    -- ( 5 )
    -- Mostrar nombre del producto mas barato.
SELECT A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.precio AS "Precio del producto",
       B.nombre AS "Nombre de la categoría",
       D.descripcion AS "Calificación"
       FROM a_practica01.productos AS A, 
       a_practica01.categorias AS B,
       a_practica01.calificaciones_productos_usuarios AS C,
       a_practica01.calificaciones AS D
       WHERE A.categorias_id = B.id AND 
       C.productos_id = A.id AND
       C.calificaciones_id = D.id AND
       A.cantidad = 0;

    -- ( 6 )
    -- Productos que no tienen cantidad
SELECT A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.precio AS "Precio del producto",
       A.Cantidad AS "No disponible",
       B.nombre AS "Nombre de la categoría"
       FROM a_practica01.productos AS A, 
       a_practica01.categorias AS B
       WHERE A.categorias_id = B.id AND 
       A.cantidad = 0;

    -- ( 7 )
    -- Mostras nombres de productos, cantidades disponibles, en la categoria de 'Hogar'
SELECT B.nombre AS "Nombre de la categoría",
       A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.Cantidad AS "Cantidad",
       A.precio AS "Precio del producto"
       FROM a_practica01.productos AS A, 
       a_practica01.categorias AS B
       WHERE A.categorias_id = B.id AND 
       A.categorias_id = 18

    -- ( 8 )
    -- Mostrar cuantos productos hay registrados en cada categoria
SELECT B.nombre AS "Nombre de la categoría", 
       COUNT(A.id) AS "Cantidad de productos"
       from a_practica01.productos as A, 
       a_practica01.categorias as B
       where A.categorias_id = B.id
       GROUP BY B.nombre;

    -- ( 9 )
    -- Monstrar nombre de usuario y roles
SELECT A.nombre AS "Nombre del usuario",     
       A.cedula AS "Cedula",
       B.descripcion AS "Roles"
       FROM
       a_practica01.usuarios AS A,
       a_practica01.roles AS B,
       a_practica01.usuarios_roles AS C
       WHERE
       A.id = C.usuarios_id AND
       C.roles_id = B.id;

    -- ( 10 )
    -- Cuántos usuarios están resgistrados por cada rol
SELECT B.descripcion AS "Rol", 
       COUNT(A.id) AS "Cantidad de usuarios"
       from a_practica01.usuarios as A,       
       a_practica01.roles as B,
       a_practica01.usuarios_roles as C
       where A.id = C.usuarios_id and C.roles_id = B.id
       GROUP BY B.descripcion;

    -- ( 11 )
    -- Mostrar nombre de cada categoria
    -- nombre de producto
    -- cantidad disponible
    -- cantidad minima
    -- cantidad maxima
    -- ordenada por cantidad disponible
    -- y categoria