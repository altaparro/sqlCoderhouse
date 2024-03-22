USE coderhouse;

-- ESTA VISTA FILTRA POR PRODUCTOS VENDIDOS DESDE EL 2024

CREATE OR REPLACE VIEW vista_ventas2024 AS
SELECT v.id_venta, v.id_cliente, c.nombre AS nombre_cliente, v.monto_total, v.fecha, dv.id_producto, p.nombre AS nombre_producto, dv.cantidad, dv.monto_parcial
FROM ventas v
JOIN detalle_ventas dv ON v.id_venta = dv.id_venta
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON dv.id_producto = p.id_producto
WHERE v.fecha >= '2024-01-01' ;

-- ESTA VISTA MUESTRA LOS PRODUCTOS QUE FUERON VENDIDOS AL MENOS UNA VEZ

CREATE OR REPLACE VIEW vista_vendidos AS
SELECT p.id_producto, p.nombre AS nombre_producto, SUM(dv.cantidad) AS total_vendido
FROM productos p
JOIN detalle_ventas dv ON p.id_producto = dv.id_producto
GROUP BY p.id_producto, p.nombre
HAVING SUM(dv.cantidad) > 0;

-- ESTA VISTA ORDENA POR NOMBRE DE CLIENTE

CREATE OR REPLACE VIEW vista_ordenada AS
SELECT * FROM clientes
ORDER BY nombre;











