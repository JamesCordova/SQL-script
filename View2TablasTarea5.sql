CREATE OR REPLACE VIEW VISTA_APUESTA_DET_PARTIDO_MOSTRAR AS
SELECT
    apuesta_det.apudetcod,
    torneo.tornom,
    partido.parfecaño,
    partido.parfecmes,
    partido.parfecdia,
    equipo.equnom,
    apuesta_det.apudetestreg
FROM
         apuesta_det
    INNER JOIN partido ON apuesta_det.apudetparcod = partido.parcod
    INNER JOIN torneo ON partido.partorcod = torneo.torcod
    INNER JOIN equipo ON partido.pargancod = equipo.equcod
