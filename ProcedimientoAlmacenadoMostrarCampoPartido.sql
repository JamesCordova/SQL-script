CREATE OR REPLACE PROCEDURE PR_MOSTRAR_PARTIDO_ESPECIFICO_EQUIPOS IS
  -- Declarar variables
  TYPE PartidoList IS TABLE OF PARTIDO.ParCod%TYPE;
  TYPE TorneoList IS TABLE OF TORNEO.TorNom%TYPE;
  TYPE EquipoLocalList IS TABLE OF EQUIPO.EquNom%TYPE;
  TYPE EquipoVisitanteList IS TABLE OF EQUIPO.EquNom%TYPE;
  TYPE AñoList IS TABLE OF PARTIDO.ParFecAño%TYPE;
  TYPE MesList IS TABLE OF PARTIDO.ParFecMes%TYPE;
  TYPE DiaList IS TABLE OF PARTIDO.ParFecDia%TYPE;
  TYPE HoraList IS TABLE OF PARTIDO.ParFecHor%TYPE;
  TYPE MinutoList IS TABLE OF PARTIDO.ParFecMin%TYPE;
  TYPE EquipoGanadorList IS TABLE OF EQUIPO.EquNom%TYPE;

  v_Partido PartidoList;
  v_Torneo TorneoList;
  v_Equipo_Local EquipoLocalList;
  v_Equipo_Visitante EquipoVisitanteList;
  v_Año AñoList;
  v_Mes MesList;
  v_Dia DiaList;
  v_Hora HoraList;
  v_Minuto MinutoList;
  v_Equipo_Ganador EquipoGanadorList;
BEGIN
 -- Consulta
  SELECT
    P.ParCod,
    T.TorNom,
    ELoc.EquNom,
    EVis.EquNom,
    P.ParFecAño,
    P.ParFecMes,
    P.ParFecDia,
    P.ParFecHor,
    P.ParFecMin,
    EGan.EquNom
  BULK COLLECT INTO
    v_Partido,
    v_Torneo,
    v_Equipo_Local,
    v_Equipo_Visitante,
    v_Año,
    v_Mes,
    v_Dia,
    v_Hora,
    v_Minuto,
    v_Equipo_Ganador
  FROM PARTIDO P
  JOIN TORNEO T ON P.ParTorCod = T.TorCod
  JOIN EQUIPO_LOCAL EL ON P.ParEquLocCod = EL.EquLocCod
  JOIN EQUIPO ELoc ON EL.EquCod = ELoc.EquCod
  JOIN EQUIPO_VISITANTE EV ON P.ParEquVisCod = EV.EquVisCod
  JOIN EQUIPO EVis ON EV.EquCod = EVis.EquCod
  LEFT JOIN EQUIPO EGan ON P.ParGanCod = EGan.EquCod;

END;
/