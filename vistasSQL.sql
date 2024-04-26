USE sistema_ventas;

-- vista con datos de clientes

CREATE VIEW vista_clientes_domicilios AS
SELECT 
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.dni,
    d.id_domicilio,
    CONCAT(d.calle_principal, ', ', d.numero, ', ', d.entre_calles) AS direccion,
    ci.ciudad AS ciudad,
    p.provincia AS provincia,
    pa.pais AS pais
FROM 
    Clientes c
JOIN 
    Domicilio d ON c.id_domicilio = d.id_domicilio
JOIN 
    Ciudad ci ON d.id_ciudad = ci.id_ciudad
JOIN 
    Provincia p ON ci.id_provincia = p.id_provincia
JOIN 
    Pais pa ON p.id_pais = pa.id_pais;
    
-- Vista de Ventas y Productos

CREATE VIEW vista_ventas_productos AS
SELECT 
    v.id_venta,
    v.fecha,
    v.monto_total,
    c.nombre AS nombre_cliente,
    p.nombre AS nombre_producto,
    dp.cantidad,
    dp.monto_parcial
FROM 
    Ventas v
JOIN 
    Clientes c ON v.id_cliente = c.id_cliente
JOIN 
    detalle_ventas dp ON v.id_venta = dp.id_venta
JOIN 
    Productos p ON dp.id_producto = p.id_producto;


--  Vista 3: Vista de Proveedores y Productos

CREATE VIEW vista_proveedores_productos AS
SELECT 
    pr.id_proveedor,
    pr.nombre AS nombre_proveedor,
    pr.empresa,
    p.id_producto,
    p.nombre AS nombre_producto,
    p.cantidad,
    p.precio
FROM 
    proveedores pr
JOIN 
    Productos p ON pr.id_proveedor = p.id_proveedor;
    
-- Vista 4: Vista de Envíos Pendientes

CREATE VIEW vista_envios_pendientes AS
SELECT 
    e.id_envio,
    e.detalle,
    e.fecha,
    e.empresa,
    v.fecha AS fecha_venta,
    v.id_cliente,
    c.nombre AS nombre_cliente,
    c.dni
FROM 
    envios e
JOIN 
    Ventas v ON e.id_venta = v.id_venta
JOIN 
    Clientes c ON v.id_cliente = c.id_cliente
WHERE 
    e.estado != 'Entregado';
    
-- Vista 5: Vista de Promociones Activas

CREATE VIEW vista_promociones_activas AS
SELECT 
    id,
    fecha_inicio,
    fecha_fin,
    detalle,
    descuento
FROM 
    Promociones
WHERE 
    CURDATE() BETWEEN fecha_inicio AND fecha_fin;















