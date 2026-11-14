
INSERT INTO restaurante.categorias (Id_categoria, entradas, platos_fuertes, bebidas) VALUES
(1, 'Empanadas de pipián', 'Bandeja paisa', 'jugo de lulo'),
(2, 'Patacones con hogao', 'Sancocho de gallina', 'Limonada de coco'),
(3, 'Arepas con queso', 'Lomo al horno', 'Gaseosa'),
(4, 'Ensalada fresca', 'Pechuga a la plancha', 'Agua con gas');

INSERT INTO restaurante.clientes (Id_cedula, nombre, celular, direccion, barrio) VALUES
(12348567, 'Palo Mora', '1234567', 'Calle 5 # 8-20', 'Centro'),
(23945678, 'Laura Gimenez', '2345678', 'Calle 13 # 12-35', 'Belen'),
(34856789, 'Andrea Rios', '3456789', 'Calle 2 # 6-14', 'La Esmeralda'),
(57678960, 'Mauro Domiguez', '4567890', 'Calle 4 # 15-08', 'La Ladera');

INSERT INTO restaurante.motos (Id_placa, modelo, vencimiento, SOAT) VALUES
(101, 'Honda CB 125', '2027/03/15', 'SO0012345'),
(102, 'Yamaha FZ 150', '2026/12/30', 'SOA0023456'),
(103, 'Suzuki Gixxer 155', '2026/12/20', 'SO0034567'),
(104, 'BajPulsar 180', '2027/09/10', 'SO0045678');

INSERT INTO restaurante.domiciliarios (Id_domiciliario, nombre, Id_placa) VALUES
(1, 'Juan Pérez', 101),
(2, 'Camilo Rojas', 102),
(3, 'Sebastián Díaz', 103),
(4, 'Felipe Ortiz', 104);

INSERT INTO restaurante.platos (Id_plato, nombre, precio_actual, Id_categoria) VALUES
(1, 'Empanadas de pipián', 6000, 1),
(2, 'Bandeja paisa', 28000, 2),
(3, 'Jugo de mora', 5000, 3),
(4, 'Sancocho de gallina', 22000, 2);

INSERT INTO restaurante.pedidos (Id_pedido, cantida, precio_uni, Id_domiciliario, Id_plato, Id_cedula) VALUES
(1, 2, 6000, 1, 1, 1061234567),
(2, 1, 28000, 2, 2, 1062345678),
(3, 3, 5000, 3, 3, 1063456789),
(4, 2, 22000, 4, 4, 1064567890);

INSERT INTO restaurante.solicitud (Id_solicitud, Id_plato, Id_pedido) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);


