-------- View apuesta cabecera y detalle ---------
/* Vista para mostrar la cabecera y detalle relacionado */
CREATE VIEW `VISTA_APUESTA_CABECERA_DETALLE` AS
SELECT
  AC.ApuCod AS Apuesta_Cabecera,
  C.CliNom AS Cliente,
  A.AfiNom AS Afiliado,
  AC.ApuFecAño AS Año,
  AC.ApuFecMes AS Mes,
  AC.ApuFecDia AS Dia,
  AC.ApuFecHor AS Hora,
  AC.ApuFecMin AS Minuto,
  AC.ApuTip AS Tipo,
  AD.ApuDetCod AS Apuesta_Detalle,
  T.TorNom AS Torneo,
  ELoc.EquNom AS Equipo_Local,
  EVis.EquNom AS Equipo_Visitante,
  AD.ApuDetCuo AS Cuota,
  EGan.EquNom AS Equipo_Ganador
FROM APUESTA_CAB AS AC
JOIN APUESTA_DET AS AD ON AC.ApuCod = AD.ApuCabCod
JOIN CLIENTE AS C ON AC.ApuCliCod = C.CliCod
LEFT JOIN AFILIADO AS A ON AC.ApuAfiCod = A.AfiCod
JOIN PARTIDO AS P ON AD.ApuDetParCod = P.ParCod
JOIN EQUIPO_LOCAL AS EL ON P.ParEquLocCod = EL.EquLocCod
JOIN EQUIPO AS ELoc ON EL.EquCod = ELoc.EquCod
JOIN EQUIPO_VISITANTE AS EV ON P.ParEquVisCod = EV.EquVisCod
JOIN EQUIPO AS EVis ON EV.EquCod = EVis.EquCod
JOIN TORNEO AS T ON P.ParTorCod = T.TorCod
LEFT JOIN EQUIPO AS EGan ON P.ParGanCod = EGan.EquCod;