use sistema_ventas;

-- Inserciones de ejemplo para la tabla Productos
INSERT INTO Productos (id_producto, nombre, cantidad, precio, id_proveedor, id_tipo)
VALUES 
    (1, 'Parlante Bluetooth', 50, 39.99, 1, 1),
    (2, 'Auriculares Inalámbricos', 100, 29.99, 2, 2),
    (3, 'Cargador USB', 200, 9.99, 3, 3),
    (4, 'Smartphone', 30, 499.99, 4, 4),
    (5, 'Tablet', 20, 299.99, 5, 5);

-- Inserciones de ejemplo para la tabla Ventas
INSERT INTO Ventas (id_venta, monto_total, fecha, id_cliente, id_promocion, id_mp)
VALUES 
    (1, 99.98, '2024-04-25', 1, 1, 1),
    (2, 59.98, '2024-04-26', 2, 2, 2),
    (3, 19.99, '2024-04-27', 3, NULL, 3),
    (4, 1499.97, '2024-04-28', 4, 3, 1),
    (5, 599.98, '2024-04-29', 5, 2, 2);

-- Inserciones de ejemplo para la tabla Clientes
INSERT INTO Clientes (id_cliente, nombre, dni, id_domicilio)
VALUES 
    (1, 'Juan Perez', '12345678', 1),
    (2, 'María López', '87654321', 2),
    (3, 'Carlos García', '23456789', 3),
    (4, 'Ana Martínez', '34567890', 4),
    (5, 'Pedro Rodriguez', '45678901', 5);

-- Inserciones de ejemplo para la tabla Domicilio
INSERT INTO Domicilio (id_domicilio, calle_principal, entre_calles, numero, id_ciudad)
VALUES 
    (1, 'Av. Rivadavia', 'Aguero y Pasteur', 123, 1),
    (2, 'Calle 9 de Julio', 'San Martín y Belgrano', 456, 2),
    (3, 'Av. Cordoba', 'Medrano y Salguero', 789, 3),
    (4, 'Av. San Juan', 'Boedo y Estados Unidos', 1011, 4),
    (5, 'Calle Florida', 'Perú y Diagonal Norte', 1213, 5);

-- Inserciones de ejemplo para la tabla Ciudad
INSERT INTO Ciudad (id_ciudad, ciudad, id_provincia)
VALUES 
    (1, 'Buenos Aires', 1),
    (2, 'Córdoba', 2),
    (3, 'Rosario', 3),
    (4, 'Mendoza', 4),
    (5, 'Mar del Plata', 5);

-- Inserciones de ejemplo para la tabla Provincia
INSERT INTO Provincia (id_provincia, provincia, id_pais)
VALUES 
    (1, 'Buenos Aires', 1),
    (2, 'Córdoba', 1),
    (3, 'Santa Fe', 1),
    (4, 'Mendoza', 1),
    (5, 'Entre Ríos', 1);

-- Inserciones de ejemplo para la tabla Pais
INSERT INTO Pais (id_pais, pais)
VALUES 
    (1, 'Argentina'),
    (2, 'Brasil'),
    (3, 'Estados Unidos'),
    (4, 'España'),
    (5, 'México');

-- Inserciones de ejemplo para la tabla Telefonos
INSERT INTO Telefonos (id_telefono, numero, cod_area, id_cliente)
VALUES 
    (1, '1122334455', '11', 1),
    (2, '9988776655', '11', 2),
    (3, '6655443322', '11', 3),
    (4, '1122334411', '11', 4),
    (5, '6655441122', '11', 5);

-- Inserciones de ejemplo para la tabla Promociones
INSERT INTO Promociones (id, fecha_inicio, fecha_fin, detalle, descuento)
VALUES 
    (1, '2024-04-01', '2024-04-15', 'Descuento del 10% en productos seleccionados', 10.00),
    (2, '2024-04-10', '2024-04-20', '2x1 en accesorios', 50.00),
    (3, '2024-04-15', '2024-04-30', 'Envío gratis en compras mayores a $100', NULL),
    (4, '2024-04-20', '2024-04-25', 'Descuento del 20% en electrónicos', 20.00),
    (5, '2024-04-25', '2024-05-05', 'Regalo sorpresa en todas las compras', NULL);

-- Inserciones de ejemplo para la tabla medios_pago
INSERT INTO medios_pago (id, medio, recargo, id_venta)
VALUES 
    (1, 'Tarjeta de crédito', 5.00, 1),
    (2, 'Efectivo', NULL, 2),
    (3, 'Transferencia bancaria', 3.00, 3),
    (4, 'Tarjeta de débito', 2.00, 4),
    (5, 'Cheque', NULL, 5);

-- Inserciones de ejemplo para la tabla tipo_producto
INSERT INTO tipo_producto (id, tipo, id_producto)
VALUES 
    (1, 'Parlantes', 1),
    (2, 'Auriculares', 2),
    (3, 'Accesorios', 3),
    (4, 'Electrónicos', 4),
    (5, 'Electrónicos', 5);

-- Inserciones de ejemplo para la tabla proveedores
INSERT INTO proveedores (id_proveedor, nombre, empresa)
VALUES 
    (1, 'Proveedor A', 'Empresa A'),
    (2, 'Proveedor B', 'Empresa B'),
    (3, 'Proveedor C', 'Empresa C'),
    (4, 'Proveedor D', 'Empresa D'),
    (5, 'Proveedor E', 'Empresa E');

-- Inserciones de ejemplo para la tabla envios
INSERT INTO envios (id_envio, detalle, fecha, empresa, estado, id_venta)
VALUES 
    (1, 'Envío estándar', '2024-04-26', 'Empresa de Envíos A', 'En camino', 1),
    (2, 'Envío urgente', '2024-04-27', 'Empresa de Envíos B', 'Entregado', 2),
    (3, 'Envío estándar', '2024-04-28', 'Empresa de Envíos C', 'En proceso', 3),
    (4, 'Envío urgente', '2024-04-29', 'Empresa de Envíos D', 'Entregado', 4),
    (5, 'Envío estándar', '2024-04-30', 'Empresa de Envíos E', 'En proceso', 5);

-- Inserciones de ejemplo para la tabla detalle_ventas
INSERT INTO detalle_ventas (id, monto_parcial, cantidad, id_producto, id_venta)
VALUES 
    (1, 39.99, 1, 1, 1),
    (2, 29.99, 2, 2, 2),
    (3, 9.99, 3, 3, 3),
    (4, 499.99, 1, 4, 4),
    (5, 299.99, 2, 5, 5);

-- Inserciones de ejemplo para la tabla cotizacion_dolar
INSERT INTO cotizacion_dolar (id, cotizacion, fecha)
VALUES 
    (1, 98.50, '2024-04-01'),
    (2, 99.00, '2024-04-02'),
    (3, 99.50, '2024-04-03'),
    (4, 100.00, '2024-04-04'),
    (5, 100.50, '2024-04-05');
