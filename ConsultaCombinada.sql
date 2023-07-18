-------- Consulta combinada ---------
/* Consulta que busca muestra la cabecera y sus detalles relacionados, mostrnado
el codigo del partido y la cuota */
SELECT C.*, D.ApuDetParCod, D.ApuDetCuo FROM APUESTA_CAB C INNER 
JOIN APUESTA_DET D ON C.ApuCod = 1390001230 WHERE D.ApuCabCod = C.ApuCod;