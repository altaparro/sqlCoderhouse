use sistema_ventas;

DELIMITER $$
CREATE FUNCTION obtener_nombre_precio_producto(id_parametro INT)
RETURNS VARCHAR(255)
BEGIN
    DECLARE nombre_precio VARCHAR(255);

    SELECT CONCAT('Nombre: ', nombre, ', Precio: ', precio)
    INTO nombre_precio
    FROM productos
    WHERE id_producto = id_parametro;

    RETURN nombre_precio;
END$$
DELIMITER ;



-- llamado a la funcion

SELECT obtener_nombre_precio_producto(1);


-- Funcion promedio precios

DELIMITER $$
CREATE FUNCTION calcular_precio_promedio_productos()
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE precio_promedio DECIMAL(10, 2);
    
    SELECT AVG(precio) INTO precio_promedio
    FROM productos;
    
    RETURN precio_promedio;
END$$
DELIMITER ;

SELECT calcular_precio_promedio_productos() AS precio_promedio;


