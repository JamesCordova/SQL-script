/*
Created: 18/7/2023
Modified: 18/7/2023
Model: SQL new 8.0
Database: Oracle 19c
*/


-- Create tables section -------------------------------------------------

-- Table ESTADO_REGISTRO

CREATE TABLE "ESTADO_REGISTRO"(
  "EstReg" Char(1 ) NOT NULL,
  "EstRegDes" Char(32 ),
  "EstRegEstReg" Char(1 ) NOT NULL
)
/

-- Add keys for table ESTADO_REGISTRO

ALTER TABLE "ESTADO_REGISTRO" ADD CONSTRAINT "PK_ESTADO_REGISTRO" PRIMARY KEY ("EstReg")
/

-- Table TORNEO

CREATE TABLE "TORNEO"(
  "TorCod" Integer NOT NULL,
  "TorNom" Char(40 ),
  "TorEstReg" Char(1 ) NOT NULL
)
/

-- Create indexes for table TORNEO

CREATE INDEX "IX_Relationship27" ON "TORNEO" ("TorEstReg")
/

-- Add keys for table TORNEO

ALTER TABLE "TORNEO" ADD CONSTRAINT "PK_TORNEO" PRIMARY KEY ("TorCod")
/

-- Table CLIENTE

CREATE TABLE "CLIENTE"(
  "CliCod" Integer NOT NULL,
  "CliDni" Integer,
  "CliNom" Char(60 ),
  "CliEstReg" Char(1 ) NOT NULL
)
/

-- Create indexes for table CLIENTE

CREATE INDEX "IX_Relationship31" ON "CLIENTE" ("CliEstReg")
/

-- Add keys for table CLIENTE

ALTER TABLE "CLIENTE" ADD CONSTRAINT "PK_CLIENTE" PRIMARY KEY ("CliCod")
/

-- Table EQUIPO_VISITANTE

CREATE TABLE "EQUIPO_VISITANTE"(
  "EquVisCod" Integer NOT NULL,
  "EquCod" Integer,
  "EquVisEstReg" Char(1 ) NOT NULL
)
/

-- Create indexes for table EQUIPO_VISITANTE

CREATE INDEX "IX_Relationship26" ON "EQUIPO_VISITANTE" ("EquVisEstReg")
/

CREATE INDEX "IX_Relationship54" ON "EQUIPO_VISITANTE" ("EquCod")
/

-- Add keys for table EQUIPO_VISITANTE

ALTER TABLE "EQUIPO_VISITANTE" ADD CONSTRAINT "PK_EQUIPO_VISITANTE" PRIMARY KEY ("EquVisCod")
/

-- Table EQUIPO_LOCAL

CREATE TABLE "EQUIPO_LOCAL"(
  "EquLocCod" Integer NOT NULL,
  "EquCod" Integer,
  "EquLocEstReg" Char(1 ) NOT NULL
)
/

-- Create indexes for table EQUIPO_LOCAL

CREATE INDEX "IX_Relationship25" ON "EQUIPO_LOCAL" ("EquLocEstReg")
/

CREATE INDEX "IX_Relationship55" ON "EQUIPO_LOCAL" ("EquCod")
/

-- Add keys for table EQUIPO_LOCAL

ALTER TABLE "EQUIPO_LOCAL" ADD CONSTRAINT "PK_EQUIPO_LOCAL" PRIMARY KEY ("EquLocCod")
/

-- Table APUESTA_CAB

CREATE TABLE "APUESTA_CAB"(
  "ApuCod" Integer NOT NULL,
  "ApuCliCod" Integer NOT NULL,
  "ApuAfiCod" Char(11 ),
  "ApuFecAño" Integer,
  "ApuFecMes" Integer,
  "ApuFecDia" Integer,
  "ApuFecHor" Integer,
  "ApuFecMin" Integer,
  "ApuTip" Char(32 ),
  "ApuValApo" Number(8,2),
  "ApuEstReg" Char(1 ) NOT NULL
)
/

-- Create indexes for table APUESTA_CAB

CREATE INDEX "IX_Relationship39" ON "APUESTA_CAB" ("ApuAfiCod")
/

CREATE INDEX "IX_Relationship51" ON "APUESTA_CAB" ("ApuEstReg")
/

-- Add keys for table APUESTA_CAB

ALTER TABLE "APUESTA_CAB" ADD CONSTRAINT "PK_APUESTA_CAB" PRIMARY KEY ("ApuCod")
/

-- Table PARTIDO

CREATE TABLE "PARTIDO"(
  "ParCod" Char(9 ) NOT NULL,
  "ParTorCod" Integer,
  "ParEquLocCod" Integer NOT NULL,
  "ParEquVisCod" Integer NOT NULL,
  "ParFecAño" Integer,
  "ParFecMes" Integer,
  "ParFecDia" Integer,
  "ParFecHor" Integer,
  "ParFecMin" Integer,
  "ParGanCod" Integer,
  "ParEstReg" Char(1 ) NOT NULL
)
/

-- Create indexes for table PARTIDO

CREATE INDEX "IX_Relationship29" ON "PARTIDO" ("ParEstReg")
/

CREATE INDEX "IX_Relationship40" ON "PARTIDO" ("ParTorCod")
/

CREATE INDEX "IX_Relationship42" ON "PARTIDO" ("ParEquLocCod")
/

CREATE INDEX "IX_Relationship43" ON "PARTIDO" ("ParEquVisCod")
/

CREATE INDEX "IX_Relationship56" ON "PARTIDO" ("ParGanCod")
/

-- Add keys for table PARTIDO

ALTER TABLE "PARTIDO" ADD CONSTRAINT "PK_PARTIDO" PRIMARY KEY ("ParCod")
/

-- Table AFILIADO

CREATE TABLE "AFILIADO"(
  "AfiCod" Char(11 ) NOT NULL,
  "AfiNom" Char(32 ),
  "AfiEstReg" Char(1 ) NOT NULL
)
/

-- Create indexes for table AFILIADO

CREATE INDEX "IX_Relationship37" ON "AFILIADO" ("AfiEstReg")
/

-- Add keys for table AFILIADO

ALTER TABLE "AFILIADO" ADD CONSTRAINT "PK_AFILIADO" PRIMARY KEY ("AfiCod")
/

-- Table APUESTA_DET

CREATE TABLE "APUESTA_DET"(
  "ApuDetCod" Integer NOT NULL,
  "ApuCabCod" Integer NOT NULL,
  "ApuDetParCod" Char(9 ),
  "ApuDetCuo" Number(8,2),
  "ApuDetEstReg" Char(1 ) NOT NULL
)
/

-- Create indexes for table APUESTA_DET

CREATE INDEX "IX_Relationship50" ON "APUESTA_DET" ("ApuDetParCod")
/

CREATE INDEX "IX_Relationship52" ON "APUESTA_DET" ("ApuDetEstReg")
/

-- Add keys for table APUESTA_DET

ALTER TABLE "APUESTA_DET" ADD CONSTRAINT "PK_APUESTA_DET" PRIMARY KEY ("ApuDetCod","ApuCabCod")
/

-- Table EQUIPO

CREATE TABLE "EQUIPO"(
  "EquCod" Integer NOT NULL,
  "EquNom" Char(32 ) NOT NULL,
  "EquEstReg" Char(1 ) NOT NULL
)
/

-- Create indexes for table EQUIPO

CREATE INDEX "IX_Relationship53" ON "EQUIPO" ("EquEstReg")
/

-- Add keys for table EQUIPO

ALTER TABLE "EQUIPO" ADD CONSTRAINT "PK_EQUIPO" PRIMARY KEY ("EquCod")
/

ALTER TABLE "EQUIPO" ADD CONSTRAINT "EquNom" UNIQUE ("EquNom")
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "EQUIPO_LOCAL" ADD CONSTRAINT "Int_Estado_Registro_Equipo_Local" FOREIGN KEY ("EquLocEstReg") REFERENCES "ESTADO_REGISTRO" ("EstReg")
/



ALTER TABLE "EQUIPO_VISITANTE" ADD CONSTRAINT "Int_Estado_Registro_Equipo_Visitante" FOREIGN KEY ("EquVisEstReg") REFERENCES "ESTADO_REGISTRO" ("EstReg")
/



ALTER TABLE "TORNEO" ADD CONSTRAINT "Int_Estado_Registro_Torneo" FOREIGN KEY ("TorEstReg") REFERENCES "ESTADO_REGISTRO" ("EstReg")
/



ALTER TABLE "PARTIDO" ADD CONSTRAINT "Int_Estado_Registro_Partido" FOREIGN KEY ("ParEstReg") REFERENCES "ESTADO_REGISTRO" ("EstReg")
/



ALTER TABLE "CLIENTE" ADD CONSTRAINT "Int_Estado_Registro_Cliente" FOREIGN KEY ("CliEstReg") REFERENCES "ESTADO_REGISTRO" ("EstReg")
/



ALTER TABLE "APUESTA_CAB" ADD CONSTRAINT "Int_Cliente_Apuesta_Cab" FOREIGN KEY ("ApuCliCod") REFERENCES "CLIENTE" ("CliCod")
/



ALTER TABLE "AFILIADO" ADD CONSTRAINT "Int_Estado_Registro_Afiliado" FOREIGN KEY ("AfiEstReg") REFERENCES "ESTADO_REGISTRO" ("EstReg")
/



ALTER TABLE "APUESTA_CAB" ADD CONSTRAINT "Int_Afiliado_Apuesta_Cab" FOREIGN KEY ("ApuAfiCod") REFERENCES "AFILIADO" ("AfiCod")
/



ALTER TABLE "PARTIDO" ADD CONSTRAINT "Int_Torneo_Partido" FOREIGN KEY ("ParTorCod") REFERENCES "TORNEO" ("TorCod")
/



ALTER TABLE "PARTIDO" ADD CONSTRAINT "Int_Equipo_Local_Partido" FOREIGN KEY ("ParEquLocCod") REFERENCES "EQUIPO_LOCAL" ("EquLocCod")
/



ALTER TABLE "PARTIDO" ADD CONSTRAINT "Int_Equipo_Visitante_Partido" FOREIGN KEY ("ParEquVisCod") REFERENCES "EQUIPO_VISITANTE" ("EquVisCod")
/



ALTER TABLE "APUESTA_DET" ADD CONSTRAINT "Int_Apuesta_Cab_Apuesta_Det" FOREIGN KEY ("ApuCabCod") REFERENCES "APUESTA_CAB" ("ApuCod")
/



ALTER TABLE "APUESTA_DET" ADD CONSTRAINT "Int_Partido_Apuesta_Det" FOREIGN KEY ("ApuDetParCod") REFERENCES "PARTIDO" ("ParCod")
/



ALTER TABLE "APUESTA_CAB" ADD CONSTRAINT "Int_Estado_Registro_Apuesta_Cab" FOREIGN KEY ("ApuEstReg") REFERENCES "ESTADO_REGISTRO" ("EstReg")
/



ALTER TABLE "APUESTA_DET" ADD CONSTRAINT "Int_Estado_Registro_Apuesta_Det" FOREIGN KEY ("ApuDetEstReg") REFERENCES "ESTADO_REGISTRO" ("EstReg")
/



ALTER TABLE "EQUIPO" ADD CONSTRAINT "Int_Estado_Registro_Equipo" FOREIGN KEY ("EquEstReg") REFERENCES "ESTADO_REGISTRO" ("EstReg")
/



ALTER TABLE "EQUIPO_VISITANTE" ADD CONSTRAINT "Int_Equipo_Equipo_Visitante" FOREIGN KEY ("EquCod") REFERENCES "EQUIPO" ("EquCod")
/



ALTER TABLE "EQUIPO_LOCAL" ADD CONSTRAINT "Int_Equipo_Equipo_Local" FOREIGN KEY ("EquCod") REFERENCES "EQUIPO" ("EquCod")
/



ALTER TABLE "PARTIDO" ADD CONSTRAINT "Int_Equipo_Partido" FOREIGN KEY ("ParGanCod") REFERENCES "EQUIPO" ("EquCod")
/





