use coderhouse;
-- Crear tabla para la entidad Productos
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

-- Crear tabla para la entidad Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    dni VARCHAR(20) NOT NULL
);

-- Crear tabla para la entidad Ventas
CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    monto_total DECIMAL(10, 2) NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Crear tabla para la entidad Detalle_Ventas
CREATE TABLE Detalle_Ventas (
    id INT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    monto_parcial DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);
