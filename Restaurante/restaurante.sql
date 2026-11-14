-- restaurante
CREATE TABLE IF NOT EXISTS restaurante.categorias(
Id_categoria INT UNIQUE NOT NULL PRIMARY KEY,
entradas VARCHAR (70) NOT NULL,
platos_fuertes VARCHAR (70) NOT NULL,
bebidas VARCHAR (70) NOT NULL
);

CREATE TABLE IF NOT EXISTS restaurante.clientes(
Id_cedula INT UNIQUE NOT NULL PRIMARY KEY,
nombre VARCHAR (50) NOT NULL,
celular VARCHAR (10) NOT NULL,
direccion VARCHAR (30) NOT NULL,
barrio VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS restaurante.motos(
Id_placa INT UNIQUE NOT NULL PRIMARY KEY,
modelo VARCHAR (70) NOT NULL,
vencimiento DATE NOT NULL,
SOAT VARCHAR (50) NOT NULL
);
CREATE TABLE IF NOT EXISTS restaurante.domiciliarios(
Id_domiciliario INT UNIQUE NOT NULL PRIMARY KEY,
nombre VARCHAR (50) NOT NULL,
Id_placa INT UNIQUE NOT NULL,
CONSTRAINT FK_placa FOREIGN KEY (Id_placa) REFERENCES restaurante.motos (Id_placa)
);
CREATE TABLE IF NOT EXISTS restaurante.platos(
Id_plato INT UNIQUE NOT NULL PRIMARY KEY,
nombre VARCHAR (50) NOT NULL,
precio_actual DECIMAL (10,0) NOT NULL,
Id_categoria INT NOT NULL,
CONSTRAINT FK_categoria FOREIGN KEY (Id_categoria) REFERENCES restaurante.categorias (Id_categoria)
);

CREATE TABLE IF NOT EXISTS restaurante.pedidos(
Id_pedido INT UNIQUE NOT NULL PRIMARY KEY,
cantidad INT NOT NULL,
precio_uni DECIMAL (10,0) NOT NULL,
Id_domiciliario INT NOT NULL,
Id_plato INT NOT NULL,
Id_cedula INT NOT NULL,

CONSTRAINT FK_domiciliario FOREIGN KEY (Id_domiciliario) REFERENCES restaurante.domiciliarios (Id_domiciliario),
CONSTRAINT FK_plato FOREIGN KEY (Id_plato) REFERENCES restaurante.platos (Id_plato),
CONSTRAINT FK_cedula FOREIGN KEY (Id_cedula) REFERENCES restaurante.clientes (Id_cedula)
);

CREATE TABLE IF NOT EXISTS restaurante.solicitud(
Id_solicitud INT UNIQUE NOT NULL PRIMARY KEY,
Id_plato INT NOT NULL,
Id_pedido INT NOT NULL,

CONSTRAINT FK_pedido FOREIGN KEY (Id_pedido) REFERENCES restaurante.pedidos (Id_pedido),
CONSTRAINT FK_plato FOREIGN KEY (Id_plato) REFERENCES restaurante.platos (Id_plato)
);

