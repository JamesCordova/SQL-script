/* Trigger Complejo para mandar un error si el partido con los mismos equipos y fecha ya esta creado */
DELIMITER //
CREATE TRIGGER `TRIGGER_PARTIDO_INSERT_BEFORE`
BEFORE INSERT ON `PARTIDO`
FOR EACH ROW
BEGIN
    /* Variables locales para almacenar el código de equipo local, el código de equipo visitante y la fecha/hora del partido */
    DECLARE EquLocCod INT;
    DECLARE EquVisCod INT;
    DECLARE FecAñoMesDia DATETIME;
    DECLARE ParCon INT;
    
    /* Obtener los códigos de equipo local y visitante y la fecha/hora del partido de la nueva fila insertada */
    SELECT `ParEquLocCod`, `ParEquVisCod`, CONCAT(`ParFecAño`, '-', `ParFecMes`, '-', `ParFecDia`, ' ', `ParFecHor`, ':', `ParFecMin`) INTO EquLocCod, EquVisCod, FecAñoMesDia
    FROM `PARTIDO` WHERE `ParCod` = NEW.`ParCod`;
    
    /* Verificar si ya existe un partido programado entre los mismos equipos en la misma fecha/hora */
    SELECT COUNT(*) INTO ParCon
    FROM `PARTIDO`
    WHERE ((`ParEquLocCod` = EquLocCod AND `ParEquVisCod` = EquVisCod)
            OR (`ParEquLocCod` = EquVisCod AND `ParEquVisCod` = EquLocCod))
            AND CONCAT(`ParFecAño`, '-', `ParFecMes`, '-', `ParFecDia`, ' ', `ParFecHor`, ':', `ParFecMin`) = FecAñoMesDia;
    
    /* Si ya existe un partido programado, generar un error personalizado */
    IF ParCon > 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Partido ya creado';
    END IF;
END;

//
DELIMITER ;