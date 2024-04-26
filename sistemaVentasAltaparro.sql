CREATE DATABASE sistema_ventas;

USE sistema_ventas;

-- Creación de tabla Productos
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(255),
    cantidad INT,
    precio DECIMAL(10, 2),
    id_proveedor INT,
    id_tipo INT,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
    FOREIGN KEY (id_tipo) REFERENCES tipo_producto(id)
);

-- Creación de tabla Ventas
CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY,
    monto_total DECIMAL(10, 2),
    fecha DATE,
    id_cliente INT,
    id_promocion INT,
    id_mp INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_promocion) REFERENCES Promociones(id),
    FOREIGN KEY (id_mp) REFERENCES medios_pago(id)
);

-- Creación de tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(255),
    dni VARCHAR(20),
    id_domicilio INT,
    FOREIGN KEY (id_domicilio) REFERENCES Domicilio(id_domicilio)
);

-- Creación de tabla Domicilio
CREATE TABLE Domicilio (
    id_domicilio INT PRIMARY KEY,
    calle_principal VARCHAR(255),
    entre_calles VARCHAR(255),
    numero INT,
    id_ciudad INT,
    FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad)
);

-- Creación de tabla Ciudad
CREATE TABLE Ciudad (
    id_ciudad INT PRIMARY KEY,
    ciudad VARCHAR(255),
    id_provincia INT,
    FOREIGN KEY (id_provincia) REFERENCES Provincia(id_provincia)
);

-- Creación de tabla Provincia
CREATE TABLE Provincia (
    id_provincia INT PRIMARY KEY,
    provincia VARCHAR(255),
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES Pais(id_pais)
);

-- Creación de tabla Pais
CREATE TABLE Pais (
    id_pais INT PRIMARY KEY,
    pais VARCHAR(255)
);

-- Creación de tabla Telefonos
CREATE TABLE Telefonos (
    id_telefono INT PRIMARY KEY,
    numero VARCHAR(20),
    cod_area VARCHAR(10),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Creación de tabla Promociones
CREATE TABLE Promociones (
    id INT PRIMARY KEY,
    fecha_inicio DATE,
    fecha_fin DATE,
    detalle VARCHAR(255),
    descuento DECIMAL(5, 2)
);

-- Creación de tabla medios_pago
CREATE TABLE medios_pago (
    id INT PRIMARY KEY,
    medio VARCHAR(50),
    recargo DECIMAL(5, 2),
    id_venta INT,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta)
);

-- Creación de tabla tipo_producto
CREATE TABLE tipo_producto (
    id INT PRIMARY KEY,
    tipo VARCHAR(50),
    id_producto INT,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Creación de tabla proveedores
CREATE TABLE proveedores (
    id_proveedor INT PRIMARY KEY,
    nombre VARCHAR(255),
    empresa VARCHAR(255)
);

-- Creación de tabla envios
CREATE TABLE envios (
    id_envio INT PRIMARY KEY,
    detalle VARCHAR(255),
    fecha DATE,
    empresa VARCHAR(255),
    estado VARCHAR(50),
    id_venta INT,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta)
);

-- Creación de tabla detalle_ventas
CREATE TABLE detalle_ventas (
    id INT PRIMARY KEY,
    monto_parcial DECIMAL(10, 2),
    cantidad INT,
    id_producto INT,
    id_venta INT,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta)
);

-- Creación de tabla cotizacion_dolar
CREATE TABLE cotizacion_dolar (
    id INT PRIMARY KEY,
    cotizacion DECIMAL(10, 2),
    fecha DATE
);
