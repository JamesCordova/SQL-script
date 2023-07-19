-------- Vista tablas relacionadas --------
/* Tabla EQUIPO_LOCAL relacionada a tabla EQUIPO mostrando
 enves de clave foranea el nombre asociado al equipo que 
 es Local*/
CREATE VIEW `VISTA_EQUIPO_LOCAL_NOMBRES` AS
SELECT 
 ELoc.EquLocCod,
 E.EquNom,
 ELoc.EquLocEstReg
FROM EQUIPO AS E INNER 
JOIN EQUIPO_LOCAL AS ELoc ON E.EquCod = ELoc.EquCod;
