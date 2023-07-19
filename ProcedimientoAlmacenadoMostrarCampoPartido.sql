DELIMITER //
CREATE PROCEDURE `PR_MOSTRAR_PARTIDO_ESPECIFICO_EQUIPOS` ()
BEGIN
  SELECT
	P.ParCod AS Partido,
	T.TorNom AS Torneo,
	ELoc.EquNom AS Equipo_Local,
	EVis.EquNom AS Equipo_Visitante,
	P.ParFecAño AS Año,
	P.ParFecMes AS Mes,
	P.ParFecDia AS Dia,
	P.ParFecHor AS Hora,
	P.ParFecMin AS Minuto,
	EGan.EquNom AS Equipo_Ganador
	FROM PARTIDO AS P
	JOIN TORNEO AS T ON P.ParTorCod = T.TorCod
	JOIN EQUIPO_LOCAL AS EL ON P.ParEquLocCod = EL.EquLocCod
	JOIN EQUIPO AS ELoc ON EL.EquCod = ELoc.EquCod
	JOIN EQUIPO_VISITANTE AS EV ON P.ParEquVisCod = EV.EquVisCod
	JOIN EQUIPO AS EVis ON EV.EquCod = EVis.EquCod
	LEFT JOIN EQUIPO AS EGan ON P.ParGanCod = EGan.EquCod;
END;
//
DELIMITER ;