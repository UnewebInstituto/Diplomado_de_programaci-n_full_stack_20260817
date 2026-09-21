    -- Agrupamiento de datos:

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
(7,'AIRE ACONDICIONADO',4,600.75),
(7,'TELEVISOR',7,400.00),
(7,'LAPTOP',5,1200.00),
(2,'MICROONDAS',8,150.25),
(1,'LICUADORA',12,100.00),
(2,'PLANCHA',12,75.50),
(7,'VENTILADOR',12,50.00),
(1,'HORNO A GAS',6,450.00),
(2,'CAFETERA',12,250.00),
(7,'TOSTADORA',12,80.00),
(1,'NEVERA',6,500.25),
(1,'COCINA',3,300.75),
(2,'LAVADORA',2,800.50),
(7,'AIRE ACONDICIONADO',4,600.75),
(7,'TELEVISOR',7,400.00),
(7,'LAPTOP',5,1200.00),
(2,'MICROONDAS',8,150.25),
(1,'LICUADORA',12,100.00),
(2,'PLANCHA',12,75.50),
(7,'VENTILADOR',12,50.00),
(1,'HORNO A GAS',6,450.00),
(2,'CAFETERA',12,250.00),
(7,'TOSTADORA',12,80.00),
(1,'NEVERA',6,500.25),
(1,'COCINA',3,300.75),
(2,'LAVADORA',2,800.50),
(7,'AIRE ACONDICIONADO',4,600.75),
(7,'TELEVISOR',7,400.00),
(7,'LAPTOP',5,1200.00),
(2,'MICROONDAS',8,150.25),
(1,'LICUADORA',12,100.00),
(2,'PLANCHA',12,75.50),
(7,'VENTILADOR',12,50.00),
(1,'HORNO A GAS',6,450.00),
(2,'CAFETERA',12,250.00),
(7,'TOSTADORA',12,80.00),
(1,'NEVERA',6,500.25),
(1,'COCINA',3,300.75),
(2,'LAVADORA',2,800.50),
(7,'AIRE ACONDICIONADO',4,600.75),
(7,'TELEVISOR',7,400.00),
(7,'LAPTOP',5,1200.00),
(2,'MICROONDAS',8,150.25),
(1,'LICUADORA',12,100.00),
(2,'PLANCHA',12,75.50),
(7,'VENTILADOR',12,50.00),
(1,'HORNO A GAS',6,450.00),
(2,'CAFETERA',12,250.00),
(7,'TOSTADORA',12,80.00);

    -- DISTINCT: elimina duplicados de los resultados en consulta
SELECT DISTINCT nombre FROM productos_varios;

    -- GROUP BY: Agrupa los resultados de una consulta en función de una o más columnas
SELECT nombre FROM productos_varios GROUP BY nombre;

    -- Totaliza la cantidad de productos por el nombre del producto
SELECT nombre AS nombre_producto, 
       sum(cantidad) AS total_cantidad FROM productos_varios
       GROUP BY nombre;

INSERT INTO productos_varios(proveedor_id, nombre, cantidad, precio) VALUES
(1,'NEVERA',6,250.50),
(1,'COCINA',8,120.25),
(2,'LAVADORA',12,350.75);

    -- Minimo, maximo, promedio del precio
SELECT nombre AS nombre_producto,
        sum(cantidad) AS cantidad_total,
        min(precio) AS precio_minimo,
        max(precio) AS precio_maximo,
        round(avg(precio),2) AS precio_promedio
        FROM productos_varios
        WHERE nombre IN ('NEVERA','COCINA','LAVADORA')
        GROUP BY nombre;

    -- LISTA
SELECT * FROM productos_varios WHERE nombre NOT IN ('NEVERA','COCINA','LAVADORA');

    -- SELECCION INDIVIDUAL
SELECT * FROM productos_varios WHERE nombre = 'NEVERA' OR
                                     nombre = 'COCINA' OR
                                     nombre = 'LAVADORA';

    -- SELECCION INDIVIDUAL NEGADA
SELECT * FROM productos_varios WHERE NOT(nombre = 'NEVERA' OR
                                     nombre = 'COCINA' OR
                                     nombre = 'LAVADORA');

    -- SELECCION INDIVIDUAL DESIGUAL
SELECT * FROM productos_varios WHERE nombre <> 'NEVERA' OR
                                     nombre <> 'COCINA' OR
                                     nombre <> 'LAVADORA';

    -- CONDICION RANGO DE VALORES
SELECT * FROM productos_varios WHERE precio >= 200 AND precio <= 400;
    -- 
SELECT * FROM productos_varios WHERE precio BETWEEN 200 and 400;

    -- CONDICION NEGACION RANGO DE VALORES
SELECT * FROM productos_varios WHERE NOT (precio >= 200 AND precio <= 400);
    -- 
SELECT * FROM productos_varios WHERE NOT (precio BETWEEN 200 and 400);



    --  XOR
SELECT * FROM productos_varios WHERE precio < 400 XOR nombre = 'COCINA';


    -- PHPMYADMIN
    -- INTERFAZ GRAFICA MYSQL


Create Table proveedores(
    id int unsigned auto_increment,
    nombre varchar(30),
    direccion text,
    telefono char(20),
    correo_electronico varchar(80),
    primary key (id),
    unique (correo_electronico)
);

Create Table productos(
    id int unsigned auto_increment,
    proveedor_id int unsigned,
    nombre varchar(30),
    cantidad int unsigned,
    precio numeric(13,2),
    primary key (id),
);