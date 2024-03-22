use coderhouse;

DELIMITER $$
CREATE PROCEDURE ordenar_por_id(IN tabla_nombre VARCHAR(255), IN orden VARCHAR(4))
BEGIN
    SET @query = CONCAT('SELECT * FROM ', tabla_nombre, ' ORDER BY id ', orden);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$
DELIMITER ;


-- llamado a dicho stored procedure

CALL ordenar_por_id('nombre_de_tabla', 'ASC');
