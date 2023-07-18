-------- Consultas con funciones --------
/* Consulta que muestra el total de apuestas detalle
 que han hecho según cliente */
SELECT
  C.CliNom AS Cliente,
  COUNT(AC.ApuCod) AS TotalApuestas
FROM APUESTA_CAB AS AC 
JOIN APUESTA_DET AS AD on AC.ApuCod = AD.ApuCabCod
JOIN CLIENTE AS C ON AC.ApuCliCod = C.CliCod
GROUP BY C.CliNom;