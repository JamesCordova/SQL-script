/* Trigger simple para cambiar el EstReg en base a su apuesta cabecera */
DELIMITER //
CREATE TRIGGER `TRIGGER_APUESTA_CAB_UPDATE`
AFTER UPDATE ON `APUESTA_CAB`
FOR EACH ROW
BEGIN
	/* Estado Activo */
    IF NEW.ApuEstReg = 'A' THEN
        UPDATE `APUESTA_DET`
        SET `ApuDetEstReg` = 'A'
        WHERE `ApuCabCod` = NEW.ApuCod;
    END IF;
    /* Estado Inactivo */
    IF NEW.ApuEstReg = 'I' THEN
        UPDATE `APUESTA_DET`
        SET `ApuDetEstReg` = 'I'
        WHERE `ApuCabCod` = NEW.ApuCod;
    END IF;
    /* Estado eliminado */
    IF NEW.ApuEstReg = '*' THEN
        UPDATE `APUESTA_DET`
        SET `ApuDetEstReg` = '*'
        WHERE `ApuCabCod` = NEW.ApuCod;
    END IF;
END;
//
DELIMITER ;