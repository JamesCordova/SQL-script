CREATE OR REPLACE TRIGGER TRIGGER_PARTIDO_INSERT_BEFORE
BEFORE INSERT ON PARTIDO
FOR EACH ROW
DECLARE
    -- Variables locales para almacenar el código de equipo local, el código de equipo visitante y la fecha/hora del partido
    EquLocCod NUMBER;
    EquVisCod NUMBER;
    FecAñoMesDia DATE;
    ParCon NUMBER;
BEGIN
    -- Obtener los códigos de equipo local y visitante y la fecha/hora del partido de la nueva fila insertada
    SELECT ParEquLocCod, ParEquVisCod, TO_DATE(ParFecAño || '-' || ParFecMes || '-' || ParFecDia || ' ' || ParFecHor || ':' || ParFecMin, 'YYYY-MM-DD HH24:MI') INTO EquLocCod, EquVisCod, FecAñoMesDia
    FROM PARTIDO WHERE ParCod = :NEW.ParCod;
    
    -- Verificar si ya existe un partido programado entre los mismos equipos en la misma fecha/hora
    SELECT COUNT(*) INTO ParCon
    FROM PARTIDO
    WHERE ((ParEquLocCod = EquLocCod AND ParEquVisCod = EquVisCod)
            OR (ParEquLocCod = EquVisCod AND ParEquVisCod = EquLocCod))
            AND TO_CHAR(ParFecAño || '-' || ParFecMes || '-' || ParFecDia || ' ' || ParFecHor || ':' || ParFecMin, 'YYYY-MM-DD HH24:MI') = TO_CHAR(FecAñoMesDia, 'YYYY-MM-DD HH24:MI');
    
    -- Si ya existe un partido programado, generar un error personalizado
    IF ParCon > 1 THEN
        raise_application_error(-20001, 'Partido ya creado');
    END IF;
END;
/
