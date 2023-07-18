-------- Consultas con funciones --------
/* Consulta que muestra la cuota promedio 
en apuestas según la cabecera */
SELECT
  AD.ApuCabCod AS ApuestaCabecera,
  AVG(AD.ApuDetCuo) AS CuotaPromedio
FROM APUESTA_DET AS AD
GROUP BY AD.ApuCabCod;
