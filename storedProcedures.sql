use sistema_ventas;

-- PRIMER STOREDPROCEDURE.

DELIMITER $$
CREATE PROCEDURE ordenar_por_id(IN proveedores VARCHAR(255), IN orden VARCHAR(4))
BEGIN
    DECLARE query_string VARCHAR(1000);
    SET @query = CONCAT('SELECT * FROM ', proveedores, ' ORDER BY id ', orden);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$
DELIMITER ;

-- llamado a dicho stored procedure

CALL ordenar_por_id('proveedores', 'ASC');

-- SEGUNDO STOREDPROCEDURE

DELIMITER $$
CREATE PROCEDURE ordenar_por_columna(IN tabla_nombre VARCHAR(255), IN columna_nombre VARCHAR(255), IN orden VARCHAR(4))
BEGIN
    DECLARE query_string VARCHAR(1000);
    SET @query = CONCAT('SELECT * FROM ', tabla_nombre, ' ORDER BY ', columna_nombre, ' ', orden);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$
DELIMITER ;

-- llamado a dicho stored procedure

CALL ordenar_por_columna('Ventas', 'fecha', 'ASC');

