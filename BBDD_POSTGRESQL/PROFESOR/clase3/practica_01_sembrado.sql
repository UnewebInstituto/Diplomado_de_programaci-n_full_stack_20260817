-- Script de sembrado de datos de prueba para el esquema practica01
-- Asegúrate de ejecutar este script después de haber creado y migrado el esquema base.

BEGIN;

-- 1. Sembrado de categorías
INSERT INTO practica01.categorias (id, nombre) VALUES
(1, 'Electrónica'),
(2, 'Ropa y Accesorios'),
(3, 'Hogar y Cocina');

-- 2. Sembrado de etiquetas
INSERT INTO practica01.etiquetas (id, descripcion) VALUES
(1, 'Nuevo'),
(2, 'Oferta'),
(3, 'Destacado'),
(4, 'Envío Gratis');

-- 3. Sembrado de roles
INSERT INTO practica01.roles (id, descripcion) VALUES
(1, 'Administrador'),
(2, 'Cliente'),
(3, 'Vendedor');

-- 4. Sembrado de usuarios (Nótese el uso de arreglos text[] para los teléfonos)
INSERT INTO practica01.usuarios (id, cedula, nombre, apellido, telefono, correo_electronico) VALUES
(1, 'V12345678', 'Carlos', 'Pérez', ARRAY['04121234567', '02125551234'], 'carlos.perez@email.com'),
(2, 'V87654321', 'Ana', 'Gómez', ARRAY['04149876543'], 'ana.gomez@email.com'),
(3, 'V11223344', 'Luis', 'Rodríguez', ARRAY['04241112233', '04162223344'], 'luis.rodriguez@email.com');

-- 5. Sembrado de usuarios_roles (Asociación M:N)
INSERT INTO practica01.usuarios_roles (usuario_id, rol_id) VALUES
(1, 1), -- Carlos es Administrador
(2, 2), -- Ana es Cliente
(3, 3); -- Luis es Vendedor

-- 6. Sembrado de productos (Depende de categorías)
INSERT INTO practica01.productos (id, categoria_id, nombre, cantidad, precio, descripcion) VALUES
(1, 1, 'Smartphone X', 15, 450.00, 'Teléfono inteligente de última generación'),
(2, 2, 'Camisa Casual', 30, 25.50, 'Camisa de algodón para caballero'),
(3, 3, 'Licuadora Pro', 10, 89.99, 'Licuadora de alta potencia con vaso de vidrio');

-- 7. Sembrado de imágenes (Depende de productos)
INSERT INTO practica01.imagenes (id, producto_id, archivo) VALUES
(1, 1, '/imagenes/smartphone_x_1.jpg'),
(2, 1, '/imagenes/smartphone_x_2.jpg'),
(3, 2, '/imagenes/camisa_casual_1.jpg'),
(4, 3, '/imagenes/licuadora_pro_1.jpg');

-- 8. Sembrado de calificaciones
INSERT INTO practica01.calificaciones (id, descripcion) VALUES
(1, 'Excelente'),
(2, 'Bueno'),
(3, 'Regular'),
(4, 'Malo');

-- 9. Sembrado de productos_etiquetas (Asociación M:N)
INSERT INTO practica01.productos_etiquetas (producto_id, etiqueta_id) VALUES
(1, 1), -- Smartphone X -> Nuevo
(1, 3), -- Smartphone X -> Destacado
(2, 2), -- Camisa Casual -> Oferta
(3, 4); -- Licuadora Pro -> Envío Gratis

-- 10. Sembrado de productos_calificaciones (Asociación M:N:N)
INSERT INTO practica01.productos_calificaciones (producto_id, calificacion_id, usuario_id) VALUES
(1, 1, 2), -- Ana calificó al Smartphone X como Excelente
(2, 2, 2), -- Ana calificó a la Camisa Casual como Bueno
(3, 1, 3); -- Luis calificó a la Licuadora Pro como Excelente

-- Actualizar las secuencias (Seriales) para evitar errores de llave duplicada en futuros INSERT manuales
SELECT setval('practica01.categorias_id_seq', (SELECT MAX(id) FROM practica01.categorias));
SELECT setval('practica01.etiquetas_id_seq', (SELECT MAX(id) FROM practica01.etiquetas));
SELECT setval('practica01.roles_id_seq', (SELECT MAX(id) FROM practica01.roles));
SELECT setval('practica01.imagenes_id_seq', (SELECT MAX(id) FROM practica01.imagenes));
SELECT setval('practica01.usuarios_id_seq', (SELECT MAX(id) FROM practica01.usuarios));
SELECT setval('practica01.productos_id_seq', (SELECT MAX(id) FROM practica01.productos));
SELECT setval('practica01.calificaciones_id_seq', (SELECT MAX(id) FROM practica01.calificaciones));

COMMIT;


-- AÑADIR ARTÍCULOS ADICIONALES PARA PRUEBAS
BEGIN;
-- Asegúrate de que el esquema esté activo
SET search_path TO practica01;

-- Inserción de productos con cantidad = 0
-- Se asume que existen categorías con IDs válidos (por ejemplo, 1, 2, 3 correspondientes a Electrónica, Línea Blanca, etc.)
INSERT INTO practica01.productos (categoria_id, nombre, cantidad, precio, descripcion) VALUES
(1, 'Smartphone Gama Baja (Agotado)', 0, 120.00, 'Modelo básico de teléfono inteligente sin stock actual en almacén.'),
(1, 'Smartwatch Deportivo Pro (Sin Stock)', 0, 85.50, 'Reloj inteligente con monitor de ritmo cardíaco, pendiente de reabastecimiento.'),
(2, 'Licuadora de 3 Velocidades', 0, 45.00, 'Licuadora de vaso de vidrio de 1.5 litros, agotada temporalmente.'),
(3, 'Audífonos Inalámbricos Bluetooth', 0, 25.00, 'Audífonos supraaurales con cancelación de ruido pasiva, sin existencias.');

COMMIT;