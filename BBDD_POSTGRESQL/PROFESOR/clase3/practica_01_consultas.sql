-- ( 1 )
-- Mostrar nombre de la categoría
-- nombre del producto, descripción
-- y precio para los productos 
-- registrados:

SELECT A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.precio AS "Precio del producto",
       B.nombre AS "Nombre de la categoría" 
       from practica01.productos as A, 
       practica01.categorias as B 
       where A.categoria_id = B.id;

-- ( 2 )
-- Mostrar los mismos campos de la consulta
-- anterios para los productos que están
-- calificados con 4 estrellas:
SELECT A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.precio AS "Precio del producto",
       B.nombre AS "Nombre de la categoría", 
       C.calificacion_id AS "Calificación del producto",
       D.descripcion AS "Descripción de la calificación"
       from practica01.productos as A, 
       practica01.categorias as B,
       practica01.productos_calificaciones as C,
       practica01.calificaciones as D
       where A.categoria_id = B.id and 
       C.producto_id = A.id and 
       C.calificacion_id = D.id and
       C.calificacion_id = 1;

-- ( 3 ) 
-- Mostrar nombre del productos más caro.

SELECT A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.precio AS "Precio del producto",
       B.nombre AS "Nombre de la categoría", 
       C.calificacion_id AS "Calificación del producto",
       D.descripcion AS "Descripción de la calificación"
       from practica01.productos as A, 
       practica01.categorias as B,
       practica01.productos_calificaciones as C,
       practica01.calificaciones as D
       where A.categoria_id = B.id and 
       C.producto_id = A.id and 
       C.calificacion_id = D.id and
       A.precio = (select max(precio) from practica01.productos);

-- VISTA DE LA CONSULTA ANTERIOR

CREATE VIEW practica01.producto_mas_caro AS
SELECT A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.precio AS "Precio del producto",
       B.nombre AS "Nombre de la categoría", 
       C.calificacion_id AS "Calificación del producto",
       D.descripcion AS "Descripción de la calificación"
       from practica01.productos as A, 
       practica01.categorias as B,
       practica01.productos_calificaciones as C,
       practica01.calificaciones as D
       where A.categoria_id = B.id and 
       C.producto_id = A.id and 
       C.calificacion_id = D.id and
       A.precio = (select max(precio) from practica01.productos);

    -- ( 4 )
    -- Mostrar nombre del productos más barato.
    SELECT A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.precio AS "Precio del producto",
       B.nombre AS "Nombre de la categoría", 
       C.calificacion_id AS "Calificación del producto",
       D.descripcion AS "Descripción de la calificación"
       from practica01.productos as A, 
       practica01.categorias as B,
       practica01.productos_calificaciones as C,
       practica01.calificaciones as D
       where A.categoria_id = B.id and 
       C.producto_id = A.id and 
       C.calificacion_id = D.id and
       A.precio = (select min(precio) from practica01.productos);

-- ( 5 )
-- Mostrar nombres de productos que no están 
-- disponibles (cantidad = 0) y su categoría.
    SELECT A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.precio AS "Precio del producto"
       from practica01.productos as A, 
       practica01.categorias as B
       where A.categoria_id = B.id and 
       A.cantidad = 0;

-- ( 6 )
-- Mostrar nombres de productos y 
-- cantidades disponibles, para los 
-- productos para Ropa y Accesorios
-- (categoría_id = 2) 

SELECT A.nombre AS "Nombre del producto",
       A.descripcion AS "Descripción del producto",
       A.precio AS "Precio del producto",
       B.nombre AS "Nombre de la categoría", 
       C.calificacion_id AS "Calificación del producto",
       D.descripcion AS "Descripción de la calificación"
       from practica01.productos as A, 
       practica01.categorias as B,
       practica01.productos_calificaciones as C,
       practica01.calificaciones as D
       where A.categoria_id = B.id and 
       C.producto_id = A.id and 
       C.calificacion_id = D.id and
       A.categoria_id = 2;

-- ( 7 )
-- Mostrar cuántos productos 
-- hay resgistrados por cada 
-- categoría.
SELECT B.nombre AS "Nombre de la categoría", 
       COUNT(A.id) AS "Cantidad de productos"
       from practica01.productos as A, 
       practica01.categorias as B
       where A.categoria_id = B.id
       GROUP BY B.nombre;

-- ( 8 )
-- Mostrar nombre de usuario, login, 
-- rol; para todos los 
-- usuarios registrados
SELECT A.nombre AS "Nombre de usuario",
       A.cedula AS "Cédula de usuario",
       A.correo_electronico AS "Correo electrónico de usuario", 
       B.descripcion AS "Rol"
       from practica01.usuarios as A,       
       practica01.roles as B,
       practica01.usuarios_roles as C
       where A.id = C.usuario_id and C.rol_id = B.id;

-- ( 9 )
-- Mostrar cuántos usuarios están resgistrados por cada rol.
SELECT B.descripcion AS "Rol", 
       COUNT(A.id) AS "Cantidad de usuarios"
       from practica01.usuarios as A,       
       practica01.roles as B,
       practica01.usuarios_roles as C
       where A.id = C.usuario_id and C.rol_id = B.id
       GROUP BY B.descripcion;

-- ( 10 )
-- Mostrar nombre de categoría,
-- nombre de producto,
-- cantidad disponible, 
-- cantidad mínima y 
-- cantidad máxima, ordenada
-- por cantidad disponible y 
-- categoría.
