use sistema_ventas;

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

-- segundo trigger

DELIMITER $$
CREATE TRIGGER verificar_ventas_asociadas_cliente
BEFORE DELETE ON Clientes
FOR EACH ROW
BEGIN
    DECLARE ventas_count INT;

    -- Verificar si hay ventas asociadas al cliente que se está intentando eliminar
    SELECT COUNT(*) INTO ventas_count
    FROM Ventas
    WHERE id_cliente = OLD.id_cliente;

    -- Si hay ventas asociadas, cancelar la eliminación y mostrar un mensaje de error
    IF ventas_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar este cliente porque tiene ventas asociadas.';
    END IF;
END$$
DELIMITER ;
