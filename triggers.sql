use coderhouse;

DELIMITER $$
CREATE TRIGGER actualizar_cantidad_despues_venta
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
    DECLARE cantidad_vendida INT;
    
    -- Obtener la cantidad de productos vendidos en esta venta
    SELECT SUM(dv.cantidad) INTO cantidad_vendida
    FROM detalle_ventas dv
    WHERE dv.id_venta = NEW.id_venta;
    
    -- Actualizar la cantidad de productos restantes en la tabla productos
    UPDATE productos
    SET cantidad = cantidad - cantidad_vendida
    WHERE id_producto IN (
        SELECT id_producto
        FROM detalle_ventas
        WHERE id_venta = NEW.id_venta
    );
END$$
DELIMITER ;

