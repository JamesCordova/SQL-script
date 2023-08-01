CREATE OR REPLACE PROCEDURE PR_MOSTRAR_VISTAS_CREADAS IS
  CURSOR c_apuesta_det_partido IS
    SELECT * FROM VISTA_APUESTA_DET_PARTIDO_MOSTRAR;
  CURSOR c_apuesta_partido_afiliado IS
    SELECT * FROM VISTA_APUESTA_PARTIDO_AFILIADO_CLIENTE_DETALLES;
  v_apuesta_det_partido VISTA_APUESTA_DET_PARTIDO_MOSTRAR%ROWTYPE;
  v_apuesta_partido_afiliado VISTA_APUESTA_PARTIDO_AFILIADO_CLIENTE_DETALLES%ROWTYPE;
BEGIN
  -- Ejecutar vistas
  OPEN c_apuesta_det_partido;
  LOOP
    FETCH c_apuesta_det_partido INTO v_apuesta_det_partido;
    EXIT WHEN c_apuesta_det_partido%NOTFOUND;
    -- Procesar fila
  END LOOP;
  CLOSE c_apuesta_det_partido;

  OPEN c_apuesta_partido_afiliado;
  LOOP
    FETCH c_apuesta_partido_afiliado INTO v_apuesta_partido_afiliado;
    EXIT WHEN c_apuesta_partido_afiliado%NOTFOUND;
    -- Procesar fila
  END LOOP;
  CLOSE c_apuesta_partido_afiliado;
END;
/
