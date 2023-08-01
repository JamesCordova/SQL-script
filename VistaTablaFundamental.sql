CREATE OR REPLACE VIEW VISTA_APUESTA_PARTIDO_AFILIADO_CLIENTE_DETALLES AS
SELECT
    ac.apucod       AS apuesta_cabecera,
    c.clinom        AS cliente,
    c.clidni        AS dni,
    a.afinom        AS afiliado,
    ac.apufecaño    AS año,
    ac.apufecmes    AS mes,
    ac.apufecdia    AS dia,
    ac.aputip       AS tipo,
    ad.apudetcod    AS apuesta_detalle,
    t.tornom        AS torneo,
    eloc.equnom     AS equipo_local,
    evis.equnom     AS equipo_visitante,
    p.parfecaño     AS partido_año,
    p.parfecmes     AS partido_mes,
    p.parfecdia     AS partido_dia,
    p.parfechor     AS partido_hora,
    p.parfecmin     AS partido_minuto,
    ad.apudetcuo    AS cuota,
    egan.equnom     AS equipo_ganador,
    ad.apudetestreg AS estado_registro

FROM
         apuesta_cab ac
    INNER JOIN apuesta_det      ad ON ac.apucod = ad.apucabcod
    INNER JOIN cliente          c ON ac.apuclicod = c.clicod
    LEFT JOIN afiliado         a ON ac.apuaficod = a.aficod
    INNER JOIN partido          p ON ad.apudetparcod = p.parcod
    INNER JOIN equipo_local     el ON p.parequloccod = el.equloccod
    INNER JOIN equipo           eloc ON el.equcod = eloc.equcod
    INNER JOIN equipo_visitante ev ON p.parequviscod = ev.equviscod
    INNER JOIN equipo           evis ON ev.equcod = evis.equcod
    INNER JOIN torneo           t ON p.partorcod = t.torcod
    LEFT JOIN equipo           egan ON p.pargancod = egan.equcod