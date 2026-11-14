INSERT INTO torneo.fichas (id_codigo, programa, jornada) VALUES
(1, 'Análisis y Desarrollo de Software', 'Diurna'),
(2, 'Análisis y Desarrollo de Software', 'Nocturna'),
(3, 'Enfermeria', 'Diurna'),
(4, 'Talento humano', 'Nocturna');

INSERT INTO torneo.canchas (id_cancha, nombre, ubicacion, capacidad) VALUES
(1, 'El estadio Popayan', 'Centro', 200),
(2, 'Transportadora', 'Norte', 100),
(3, 'Popayan fc', 'La arboleda', 500),
(4, 'Terminal', 'Coliseo', 130);

INSERT INTO torneo.arbitros (id_arbitro, documento, nombre, celular) VALUES
(1, '865357964', 'Jose Mera', '3001112233'),
(2, '215847364', 'Marcos Ramires', '3012223344'),
(3, '512569548', 'Abramh Sabaleta', '3023334455'),
(4, '624895152', 'Guillermo Cardona', '3034445566');

INSERT INTO torneo.equipos (id_equipo, nombre, color_camiseta, id_codigo) VALUES
(1, 'Rest', 'Rojo', 1),
(2, 'Sat', 'Azul', 2),
(3, 'Fedes', 'Verde', 3),
(4, 'Tolm', 'Vinotinto', 4);

INSERT INTO torneo.jugadores (id_jugador, documento, nombre, fecha_nacimiento, numero_camiseta, id_equipo, es_capitan) VALUES
(1, '134567898', 'Luis frias', '2004/03/15', 10, 1, TRUE),
(2, '540179324', 'Fabricio Rast', '2003/07/22', 7, 2, TRUE),
(3, '561815623', 'Miguel Quintero', '2002/11/05', 9, 3, TRUE),
(4, '120120544', 'Bober Ortiz', '2005/01/30', 5, 4, TRUE);

INSERT INTO torneo.partidos (id_partido, fecha, hora, fase, id_cancha, id_local, id_visitante, marcador_local, marcador_visitante) VALUES
(1, '2026/11/20', '16:00', 'cuartos', 1, 1, 2, 2, 1),
(2, '2026/11/20', '15:00', 'cuartos', 2, 3, 4, 1, 3),
(3, '2026/11/27', '12:00', 'cuartos', 4, 1, 3, 1, 2),
(4, '2026/12/04', '19:00', 'cuartos', 1, 2, 4, 1, 0);

INSERT INTO torneo.participaciones (id_jugador, id_partido, goles, tarjetas_amarillas, tarjeta_roja, minutos_jugados) VALUES
(1, 1, 2, 0, 0, 15),
(2, 1, 0, 2, 1, 54),
(3, 2, 1, 0, 0, 45),
(4, 2, 0, 2, 1, 20);

INSERT INTO torneo.arbitrajes (id_arbitro, id_partido, rol) VALUES
(1, 1, 'central'),
(2, 1, 'asistente'),
(3, 2, 'central'),
(4, 2, 'anotador');