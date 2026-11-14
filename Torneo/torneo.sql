CREATE SCHEMA IF NOT EXISTS torneo;

CREATE TABLE torneo.canchas (
id_cancha INT UNIQUE NOT NULL PRIMARY KEY,
nombre VARCHAR(60) UNIQUE NOT NULL,
ubicacion VARCHAR(50) NOT NULL,
capacidad INT NOT NULL
);

-- Fichas participantes
CREATE TABLE torneo.fichas (
id_codigo INT UNIQUE NOT NULL PRIMARY KEY,
programa VARCHAR(50) NOT NULL,
jornada VARCHAR(15)  NOT NULL
);

-- Equipos inscritos
CREATE TABLE torneo.equipos (
id_equipo INT UNIQUE NOT NULL PRIMARY KEY,
nombre VARCHAR(60) NOT NULL UNIQUE,
color_camiseta VARCHAR(30) NOT NULL,
id_codigo INT NOT NULL UNIQUE,
CONSTRAINT fk_codigo FOREIGN KEY (id_codigo) REFERENCES torneo.fichas (id_codigo)
);

-- Jugadores convocados
CREATE TABLE torneo.jugadores (
id_jugador INT UNIQUE NOT NULL PRIMARY KEY,
documento VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(50) NOT NULL,
fecha_nacimiento DATE NOT NULL,
numero_camiseta INT NOT NULL,
id_equipo INT NOT NULL,
es_capitan BOOLEAN NOT NULL DEFAULT FALSE,
CONSTRAINT fk_equipo FOREIGN KEY (id_equipo) REFERENCES torneo.equipos (id_equipo)
);

--Partidos
CREATE TABLE torneo.partidos (
id_partido INT UNIQUE NOT NULL PRIMARY KEY,
fecha DATE NOT NULL,
hora TIME NOT NULL,
fase VARCHAR(10) NOT NULL CHECK (fase IN ('grupos','cuartos','semifinal','final')),
id_cancha INT NOT NULL,
id_local INT NOT NULL,
id_visitante INT NOT NULL,
marcador_local INT NOT NULL DEFAULT 0 CHECK (marcador_local >= 0), 
marcador_visitante INT NOT NULL DEFAULT 0 CHECK (marcador_visitante >= 0),
CONSTRAINT fk_cancha FOREIGN KEY (id_cancha) REFERENCES torneo.canchas (id_cancha),
CONSTRAINT fk_local FOREIGN KEY (id_local)REFERENCES torneo.equipos (id_equipo),
CONSTRAINT fk_visitante FOREIGN KEY (id_visitante)REFERENCES torneo.equipos (id_equipo),
CHECK (id_local <> id_visitante)
);

CREATE TABLE torneo.arbitros (
id_arbitro INT UNIQUE NOT NULL PRIMARY KEY,
documento VARCHAR(20) NOT NULL UNIQUE,
nombre VARCHAR(80) NOT NULL,
celular VARCHAR(15) NOT NULL
);

--Participaciones
CREATE TABLE torneo.participaciones (
id_jugador INT NOT NULL,
id_partido INT NOT NULL,
goles INT NOT NULL DEFAULT 0 CHECK (goles >= 0),
tarjetas_amarillas INT NOT NULL DEFAULT 0 CHECK (tarjetas_amarillas >= 0),
tarjeta_roja INT NOT NULL DEFAULT 0 CHECK (tarjeta_roja >= 0),
minutos_jugados INT NOT NULL DEFAULT 0 CHECK (minutos_jugados >= 0),
PRIMARY KEY (id_jugador, id_partido),
CONSTRAINT fk_jugador FOREIGN KEY (id_jugador) REFERENCES torneo.jugadores (id_jugador),
CONSTRAINT fk_partido FOREIGN KEY (id_partido)REFERENCES torneo.partidos (id_partido)
);

CREATE TABLE torneo.arbitrajes (
id_arbitro INT NOT NULL,
id_partido INT NOT NULL,
rol VARCHAR(10) NOT NULL
CHECK (rol IN ('central', 'asistente', 'anotador')),
PRIMARY KEY (id_arbitro, id_partido),
CONSTRAINT fk_arbitro FOREIGN KEY (id_arbitro) REFERENCES torneo.arbitros (id_arbitro),
CONSTRAINT fk_partido FOREIGN KEY (id_partido) REFERENCES torneo.partidos (id_partido)
);