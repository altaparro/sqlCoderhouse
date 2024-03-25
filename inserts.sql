use coderhouse;

INSERT INTO productos (id_producto, nombre, cantidad, precio) VALUES
(1, 'Laptop Acer', 15, 1200.00),
(2, 'Smartphone Samsung', 30, 700.00),
(3, 'Impresora HP', 10, 300.00),
(4, 'Tablet Lenovo', 20, 500.00),
(5, 'Monitor LG', 8, 250.00);


INSERT INTO clientes (id_cliente, nombre, dni) VALUES
(1, 'Pedro Martinez', '12345678A'),
(2, 'Ana García', '87654321B'),
(3, 'Juan Pérez', '98765432C'),
(4, 'María López', '54321678D'),
(5, 'Carlos Ruiz', '87654321E');

INSERT INTO ventas (id_venta, id_cliente, monto_total, fecha) VALUES
(1, 1, 1800.00, '2024-03-15'),
(2, 2, 1250.00, '2024-03-17'),
(3, 1, 950.00, '2024-03-20'),
(4, 3, 2000.00, '2024-03-22'),
(5, 2, 350.00, '2024-03-25');


INSERT INTO proveedores (id_proveedor, nombre, empresa) VALUES
(1, 'Distribuidora X', 'Empresa X'),
(2, 'Proveedora Y', 'Empresa Y'),
(3, 'Suministros Z', 'Empresa Z'),
(4, 'Importadora W', 'Empresa W'),
(5, 'Comercializadora V', 'Empresa V');


INSERT INTO detalle_ventas (id, id_venta, id_producto, monto_parcial, cantidad) VALUES
(1, 1, 1, 1200.00, 1),
(2, 1, 2, 700.00, 2),
(3, 2, 3, 300.00, 1),
(4, 3, 4, 500.00, 1),
(5, 4, 5, 250.00, 2);
