-------- Consulta combinada ---------
/* Consulta que busca el detalle de una apuesta cabecera con Codigo "1390001230"
 mostrando solo el codigo de detalle, cabcera relacionada, codigo de partido y 
 cuota asociada */
SELECT D.ApuDetCod, ApuCabCod, ApuDetParCod, ApuDetCuo 
FROM APUESTA_DET D WHERE D.ApuCabCod IN (SELECT C.ApuCod 
FROM APUESTA_CAB C WHERE C.ApuCod = 1390001230);