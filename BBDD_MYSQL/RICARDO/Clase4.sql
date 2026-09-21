-- AGRUPAMIENTO DE DATOS

-- DISTINCT: Se utiliza para eliminar duplicados en los resultados de una
-- consulta. Por ejemplo, si queremos obtener una lista de ciudades  
-- únicas de una tabla de clientes, podemos usar


create table productos_varios(
    id int unsigned auto_increment,
    proveedor_id int unsigned,
    nombre varchar(30), 
    cantidad int unsigned,
    precio numeric(13,2),
    primary key (id),
    foreign key (proveedor_id) references proveedores(id)
);

INSERT INTO productos_varios(proveedor_id, nombre, cantidad, precio) VALUES
(1,'NEVERA',6,500.25),
(1,'COCINA',3,300.75),
(2,'LAVADORA',2,800.50),
(3,'AIRE ACONDICIONADO',4,600.75),
(3,'TELEVISOR',7,400.00),
(3,'LAPTOP',5,1200.00),
(2,'MICROONDAS',8,150.25),
(1,'LICUADORA',12,100.00),
(2,'PLANCHA',12,75.50),
(3,'VENTILADOR',12,50.00),
(1,'HORNO A GAS',6,450.00),
(2,'CAFETERA',12,250.00),
(3,'TOSTADORA',12,80.00),
(1,'NEVERA',6,500.25),
(1,'COCINA',3,300.75),
(2,'LAVADORA',2,800.50),
(3,'AIRE ACONDICIONADO',4,600.75),
(3,'TELEVISOR',7,400.00),
(3,'LAPTOP',5,1200.00),
(2,'MICROONDAS',8,150.25),
(1,'LICUADORA',12,100.00),
(2,'PLANCHA',12,75.50),
(3,'VENTILADOR',12,50.00),
(1,'HORNO A GAS',6,450.00),
(2,'CAFETERA',12,250.00),
(3,'TOSTADORA',12,80.00),
(1,'NEVERA',6,500.25),
(1,'COCINA',3,300.75),
(2,'LAVADORA',2,800.50),
(3,'AIRE ACONDICIONADO',4,600.75),
(3,'TELEVISOR',7,400.00),
(3,'LAPTOP',5,1200.00),
(2,'MICROONDAS',8,150.25),
(1,'LICUADORA',12,100.00),
(2,'PLANCHA',12,75.50),
(3,'VENTILADOR',12,50.00),
(1,'HORNO A GAS',6,450.00),
(2,'CAFETERA',12,250.00),
(3,'TOSTADORA',12,80.00),
(1,'NEVERA',6,500.25),
(1,'COCINA',3,300.75),
(2,'LAVADORA',2,800.50),
(3,'AIRE ACONDICIONADO',4,600.75),
(3,'TELEVISOR',7,400.00),
(3,'LAPTOP',5,1200.00),
(2,'MICROONDAS',8,150.25),
(1,'LICUADORA',12,100.00),
(2,'PLANCHA',12,75.50),
(3,'VENTILADOR',12,50.00),
(1,'HORNO A GAS',6,450.00),
(2,'CAFETERA',12,250.00),
(3,'TOSTADORA',12,80.00);

-- CASO DISTINCT: Se utiliza para eliminar duplicados en los resultados de una consulta. Por ejemplo, si queremos obtener una lista de productos únicos de la tabla productos_varios, podemos usar la siguiente consulta:

select distinct nombre from productos_varios;

-- CASO GROUP BY: Se utiliza para agrupar los resultados de una consulta en función de una o más columnas. Por ejemplo, si queremos obtener la cantidad total de productos por proveedor, podemos usar la siguiente consulta:

select nombre from productos_varios group by nombre;

-- Totalización de cantidad de productos por nombre del producto:
select nombre as nombre_producto, 
       sum(cantidad) as total_cantidad from productos_varios
       group by nombre;

-- Obteniendo el minimo, máximo y promedio del precio
-- de cada producto:
select nombre as nombre_producto, 
       sum(cantidad) as cantidad_total,
       min(precio) as precio_minimo, 
       max(precio) as precio_maximo, 
       avg(precio) as precio_promedio
       from productos_varios group by nombre;

-- Selección de valores contenidos en una lista de valores utilizando la cláusula IN. Por ejemplo, si queremos obtener los productos cuyo nombre sea 'NEVERA', 'COCINA' o 'LAVADORA', podemos usar la siguiente consulta:
select * from productos_varios where nombre in ('NEVERA', 'COCINA', 'LAVADORA');

INSERT INTO productos_varios(proveedor_id, nombre, cantidad, precio) VALUES
(1,'NEVERA',6,250.50),
(1,'COCINA',8,120.25),
(2,'LAVADORA',12,350.75);

select nombre as nombre_producto, 
       sum(cantidad) as cantidad_total,
       min(precio) as precio_minimo, 
       max(precio) as precio_maximo, 
       round(avg(precio),2) as precio_promedio
       from productos_varios
       where nombre in ('NEVERA', 'COCINA', 'LAVADORA')     
       group by nombre;

-- NEGACIÓN DE LOS VALORES CONTENIDOS EN LA LISTA

-- 1) LISTA
select * from productos_varios where nombre NOT in ('NEVERA', 'COCINA', 'LAVADORA');

-- 2) SELECCIÓN INDIVIDUAL
select * from productos_varios where NOT ( nombre = 'NEVERA' OR 
                                           nombre = 'COCINA' OR 
                                           nombre = 'LAVADORA' );
-- EQUIVALENTE AL 2)
select * from productos_varios where nombre <> 'NEVERA' AND
                                     nombre <> 'COCINA' AND
                                     nombre <> 'LAVADORA';


-- CONDICIÓN DE INTERVALO (RANGO DE VALORES)
select * from productos_varios where precio >= 200 and 
precio <= 400;

-- EQUIVALENTE
select * from productos_varios where precio between 200 and 400;

-- NEGACIÓN
select * from productos_varios 
where 
not (precio >= 200 and precio <= 400);

-- EQUIVALENTE NEGACIÓN 
select * from productos_varios 
where precio < 200 or precio > 400;

-- EQUIVALENTE NEGACIÓN
select * from productos_varios where NOT (precio between 200 and 400);

-- DISYUNCIÓN EXCLUYENTE
-- CASO XOR
select * from productos_varios
where precio < 400 XOR
      nombre = 'COCINA';

-- PHPMYADMIN
-- INTERFACE GRÁFICA PARA MYSQL
--
-- Deben encontrarse activos en el panel de control de phpmyadmin
-- los servicios "Apache" y "MySQL"
--
-- También puede escribir en la ruta del navegador, la url
-- que se indica a continuación:
--
http://localhost/phpmyadmin/

create table productos(
    id int unsigned auto_increment,
    proveedor_id int unsigned,
    nombre varchar(30), 
    cantidad int unsigned,
    precio numeric(13,2),
    primary key (id)
);

create table productos_cascade(
    id int unsigned auto_increment,
    proveedor_id int unsigned,
    nombre varchar(30), 
    cantidad int unsigned,
    precio numeric(13,2),
    primary key (id)
);