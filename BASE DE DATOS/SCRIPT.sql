
-- CREACION DE LA BD + TABLAS
-- DROP TABLE PARCIAL_LAB_3_Version_4

CREATE DATABASE PARCIAL_LAB_3_Version_7
GO

USE PARCIAL_LAB_3_Version_7
GO

CREATE TABLE Juegos
(
	J_Codigo_Juego varchar(5) not null CONSTRAINT PK_Juegos PRIMARY KEY,
	J_Codigo_Genero varchar(5) not null,
	J_Codigo_PEGI varchar(5) not null,
	J_Nombre varchar(50) not null,
	J_Descripcion varchar(1000) null,
	J_Stock int not null,
	J_PrecioUnitario decimal(18,2) not null
)
GO

CREATE TABLE Marcas
(
	M_Codigo_Marca varchar(5) not null CONSTRAINT PK_Marcas PRIMARY KEY,
	M_Nombre varchar(50) not null
)
GO

CREATE TABLE Perifericos
(
	PE_Codigo_Periferico varchar(5) not null CONSTRAINT PK_Perifericos PRIMARY KEY,
	PE_Codigo_TipoPerif varchar(5) not null,
	PE_Codigo_Marca varchar(5) not null,
	PE_Nombre varchar(50) not null,
	PE_Descripcion varchar(1000) not null,
	PE_Stock int null,
	PE_PrecioUnitario decimal(18,2) not null
)
GO

CREATE TABLE Proveedores
(
	P_Codigo_Proveedor varchar (5) not null CONSTRAINT PK_Proveedores PRIMARY KEY,
	P_RazonSocial varchar(50) null,
	P_Direccion varchar(50) null,
	P_Ciudad varchar(50) null,
	P_Provincia varchar(50) null,
	P_Cuil varchar(25) not null UNIQUE,
	P_Telefono varchar(25) null,
	P_Contacto varchar(50) null,
	P_Web varchar(50) not null,
	P_Email varchar(50) null
)
GO

CREATE TABLE Prov_X_Perif
(
	PP_Codigo_Proveedor varchar(5) not null,
	PP_Codigo_Periferico varchar(5) not null,
	PP_PrecioCompra decimal(18,2) not null,
	CONSTRAINT PK_PxPE PRIMARY KEY(PP_Codigo_Proveedor,PP_Codigo_Periferico)
)
GO

CREATE TABLE Prov_X_Juego
(
	PJ_Codigo_Proveedor varchar(5) not null,
	PJ_Codigo_Juego varchar(5) not null,
	PJ_PrecioCompra decimal(18,2) not null,
	CONSTRAINT PK_PxJ PRIMARY KEY(PJ_Codigo_Proveedor,PJ_Codigo_Juego)
)
GO

CREATE TABLE PEGI
(
	PG_Codigo_PEGI varchar(5) not null CONSTRAINT PK_PEGI PRIMARY KEY,
	PG_Nombre varchar(10) not null,
	PG_Descripcion varchar(1000) null
)
GO

CREATE TABLE Generos
(
	G_Codigo_Genero varchar(5) not null CONSTRAINT PK_Generos PRIMARY KEY,
	G_Nombre varchar(50) not null,
	G_Descripcion varchar(1000) null
)
GO

CREATE TABLE TipoPerif
(
	T_Codigo_TipoPerif varchar(5) not null CONSTRAINT PK_Categorias PRIMARY KEY,
	T_Nombre varchar(50) not null,
	T_Descripcion varchar(1000) null
)
GO

CREATE TABLE DetalleFactura_Juegos
(
	DJ_Codigo_Factura varchar(5) not null,
	DJ_Codigo_Juego varchar(5) not null,
	DJ_Cantidad int not null,
	DJ_PrecioUnitario decimal(18,2) null,
	CONSTRAINT PK_DetalleFactura_Juegos PRIMARY KEY (DJ_Codigo_Factura, DJ_Codigo_Juego)
)
GO

CREATE TABLE DetalleFactura_Perifericos
(
	DP_Codigo_Factura varchar(5) not null,
	DP_Codigo_Juego varchar(5) not null,
	DP_Cantidad int not null,
	DP_PrecioUnitario decimal(18,2) null,
	CONSTRAINT PK_DetalleFactura_Perifericos PRIMARY KEY (DP_Codigo_Factura, DP_Codigo_Juego)
)
GO

CREATE TABLE Factura
(
	F_Codigo_Factura varchar(5) not null CONSTRAINT PK_Factura PRIMARY KEY,
	F_Codigo_Usuario varchar(5) not null,
	F_Codigo_CodDescuento varchar(5) not null,
	F_MontoTotal decimal(18,2) null,
	F_Fecha date null
)
GO

CREATE TABLE Usuarios
(
	U_Codigo_Usuario varchar(5) not null CONSTRAINT PK_Usuarios PRIMARY KEY,
	U_Dni_Usuario varchar(25) not null CONSTRAINT UK_Usuarios UNIQUE,
	U_Nombre varchar(50) null,
	U_Apellido varchar(50) null,
	U_Direccion varchar(100) null,
	U_Telefono varchar(25) null,
	U_Admin bit not null
)
GO

CREATE TABLE CodigosDeDescuento
(
	CD_Codigo_CodDescuento varchar(5) not null PRIMARY KEY,
	CD_Descripcion varchar(100) not null,
	CD_Usos int null,
	CD_Habilitado bit not null
)
GO

-- CREACION DE LAS CLAVES FORANEAS

ALTER TABLE Juegos
ADD
	CONSTRAINT FK_Juegos_G FOREIGN KEY (J_Codigo_Genero) REFERENCES Generos (G_Codigo_Genero),
	CONSTRAINT FK_Juegos_PG FOREIGN KEY (J_Codigo_PEGI) REFERENCES PEGI (PG_Codigo_PEGI)
GO 

ALTER TABLE Perifericos
ADD
	CONSTRAINT FK_Perifericos_M FOREIGN KEY (PE_Codigo_Marca) REFERENCES Marcas (M_Codigo_Marca),
	CONSTRAINT FK_Perifericos_CA FOREIGN KEY (PE_Codigo_TipoPerif) REFERENCES TipoPerif (T_Codigo_TipoPerif)
GO 

ALTER TABLE DetalleFactura_Juegos
ADD
	CONSTRAINT FK_DetalleFactura_Juegos_J FOREIGN KEY (DJ_Codigo_Juego) REFERENCES Juegos (J_Codigo_Juego),
	CONSTRAINT FK_DetalleFactura_Juegos_F FOREIGN KEY (DJ_Codigo_Factura) REFERENCES Factura (F_Codigo_Factura)
GO

ALTER TABLE DetalleFactura_Perifericos
ADD
	CONSTRAINT FK_DetalleFactura_Perifericos_J FOREIGN KEY (DP_Codigo_Juego) REFERENCES Perifericos (PE_Codigo_Periferico),
	CONSTRAINT FK_DetalleFactura_Perifericos_F FOREIGN KEY (DP_Codigo_Factura) REFERENCES Factura (F_Codigo_Factura)
GO

ALTER TABLE FACTURA
ADD
	CONSTRAINT FK_Factura_U FOREIGN KEY (F_Codigo_Usuario) REFERENCES Usuarios (U_Codigo_Usuario),
	CONSTRAINT FK_Factura_CD FOREIGN KEY (F_Codigo_CodDescuento) REFERENCES CodigosDeDescuento (CD_Codigo_CodDescuento)
GO

ALTER TABLE Prov_X_Perif
ADD
	CONSTRAINT FK_Prov_X_Perif_PE FOREIGN KEY (PP_Codigo_Periferico) REFERENCES Perifericos (PE_Codigo_Periferico),
	CONSTRAINT FK_Prov_X_Perif_P FOREIGN KEY (PP_Codigo_Proveedor) REFERENCES Proveedores (P_Codigo_Proveedor)
GO

ALTER TABLE Prov_X_Juego
ADD
	CONSTRAINT FK_Prov_X_Perif_PJ FOREIGN KEY (PJ_Codigo_Juego) REFERENCES Juegos (J_Codigo_Juego),
	CONSTRAINT FK_Prov_X_Juegos_P FOREIGN KEY (PJ_Codigo_Proveedor) REFERENCES Proveedores (P_Codigo_Proveedor)
GO

-- REGISTROS

INSERT INTO Proveedores(P_Codigo_Proveedor,P_RazonSocial,P_Direccion,P_Ciudad,P_Provincia,P_Cuil,P_Telefono,P_Contacto,P_Web,P_Email)
	SELECT '1','RazonS1','Calle100','Tigre','Buenos Aires','20.00000001.0','12123434','Luis Garcia','www.InfoGaming.com','InfoGaming@live.com' UNION
	SELECT '2','RazonS2','Calle200','San Fernando','Buenos Aires','20.00000002.0','34341212','Carolina Mendez','www.RealGames.com','RealGames@live.com' UNION
	SELECT '3','RazonS3','Calle300','Garin','Buenos Aires','20.00000003.0','13132424','Alfredo Rodriguez','www.ZonaGaming.com','ZonaGaming@live.com' UNION
	SELECT '4','RazonS4','Calle400','Rosario','Buenos Aires','20.00000004.0','24243131','Hernan Cabezas','www.zGames.com','zGames@live.com' UNION
	SELECT '5','RazonS5','Calle500','Palermo','Buenos Aires','20.00000005.0','44332211','Lucia Montenegro','www.Playings.com','Playings@live.com'
GO

INSERT INTO PEGI (PG_Codigo_PEGI,PG_Nombre,PG_Descripcion)
	SELECT '1','PEGI 3','Es la etiqueta que se utiliza en los juegos adecuados para todas las edades. Estos no deben contener palabras malsonantes, contenido que pueda asustar a los pequeños ni personajes que puedan ser identificables en la vida real.' UNION
	SELECT '2','PEGI 7','Indica que el juego sigue siendo apto para todos los públicos, pero puede contener imágenes o sonidos que asusten a parte de los espectadores.' UNION
	SELECT '3','PEGI 12','Los juegos con esta etiqueta presentan un lenguaje más adulto y escenas de violencia gráfica en contextos de fantasía. Se contempla la desnudez parcial y la violencia menos explícita contra personas y/o animales.' UNION
	SELECT '4','PEGI 16','Se utiliza en los juegos que representan situaciones violentas y delictivas propias de la vida real. Incluyen lenguaje soez, representaciones sexuales y el uso de drogas en muchos casos.' UNION
	SELECT '5','PEGI 18','Es la etiqueta que representa un contenido totalmente adulto. Los juegos incluyen escenas brutales de violencia y representaciones que pueden ser consideradas obscenas o repugnantes para parte de los espectadores.' UNION
	SELECT '6','PEGI OK','Se trata de una etiqueta diseñada específicamente para portales web o juegos en línea. Indica que estos sitios son aptos para todas las edades y que no contienen ninguno de los descriptores relacionados con los demas PEGI.'
GO

INSERT INTO Generos (G_Codigo_Genero,G_Nombre,G_Descripcion)
	SELECT '1','Accion','Los videojuegos de acción requieren que el jugador haga uso de sus reflejos, puntería y habilidad, a menudo en un contexto de combate o de superación de obstáculos y peligros. Dentro de este amplio género se encuadran varios subgéneros de gran popularidad, como los juegos de disparos, los de lucha, los arcades y los de plataformas, entre otros.' UNION
	SELECT '2','Disparos','Considerados a menudo como una gran subcategoría dentro del género de acción, en los videojuegos de disparos -también conocidos como shooters- el protagonista hace un uso continuado de armas de fuego para abrirse paso en el juego.' UNION
	SELECT '3','Estrategia','Se caracterizan por la necesidad de manipular a un numeroso grupo de personajes, objetos o datos, haciendo uso de la inteligencia y la planificación, para lograr los objetivos. Aunque la mayoría de estos juegos son fundamentalmente de temática bélica, los hay también de estrategia económica, empresarial o social.' UNION
	SELECT '4','Simulacion','Este género se caracteriza por recrear situaciones o actividades del mundo real, dejando al jugador tomar el control de lo que ocurre. En ocasiones la simulación pretende un alto grado de verosimilitud, lo que le otorga una componente didáctica. Los tipos de simulación más populares son los de manejo de vehículos, los de construcción, o los de vida.' UNION
	SELECT '5','Deporte','Los videojuegos de deportes son aquellos que simulan deportes del mundo real. Entre ellos encontramos golf, tenis, fútbol, hockey, juegos olímpicos, etc. La mecánica del juego es la misma que en el deporte original, aunque a veces incorpora algunos añadidos.' UNION																																																																																																																																												
	SELECT '6','Carreras','A veces considerados como una subcategoría dentro de los videojuegos de deportes o los de simulación, los videojuegos de carreras o de conducción sitúan al jugador en un recorrido en el que debe llegar a una meta antes que sus contrincantes o dentro de un tiempo límite. Habitualmente el jugador maneja un vehículo a motor, como un coche, aunque existen otras posibilidades.' UNION
	SELECT '7','Aventura','Son videojuegos en los que el protagonista debe avanzar en la trama interactuando con diversos personajes y objetos.' UNION
	SELECT '8','Rol','Emparentados con los de aventura, los videojuegos de rol, o RPG, se caracterizan por la interacción con el personaje, una historia profunda y una evolución del personaje a medida que la historia avanza. Para lograr la evolución generalmente se hace que el jugador se enfrasque en una aventura donde irá conociendo nuevos personajes, explorando el mundo para ir juntando armas, experiencia, aliados e incluso magia. Es habitual, desde la aparición del CD-ROM, la inclusión de videos (cinemáticas) durante el juego, que complementan la narración de la historia y hacen que el jugador se sienta como dentro de una película.'
GO

INSERT INTO Juegos (J_Codigo_Juego,J_Codigo_Genero,J_Codigo_PEGI,J_Nombre,J_Descripcion,J_Stock,J_PrecioUnitario)
	SELECT '1','2','5','Metro Exodus','Un poderoso videojuego basado en las novelas superventas de Dmitri Glujovski. El shooter en primera persona vuelve a apostar por una ambientación postapocalítica muy cuidada, y por mezclar lugares angustiosos, claustrofóbicos y lúgubres con secciones mucho más abiertas.',100,2000 UNION
	SELECT '2','1','5','Mafia 3','un juego de mundo abierto y acción en tercera persona, El juego está ambientado en la ciudad ficticia de New Bordeaux, basada en la Nueva Orleans de 1968, con un diseño de mundo abierto que permite explorar a los jugadores libremente en el juego.',80,3100 UNION
	SELECT '3','7','2','Ori and the Will of the Wisps','Embárcate en una aventura totalmente nueva dentro de un inmenso mundo repleto de nuevos amigos y enemigos que cobran vida gracias a un impecable trabajo de diseño artesanal.',40,150 UNION
	SELECT '4','2','5','Call of Duty Modern Warfare 2 Remaster','Es una edición remasterizada sobre el modo historia del exitoso FPS que garantiza texturas y animaciones mejoradas, renderizado físico, iluminación HDR y otras mejoras gráficas.',105,2800 UNION
	SELECT '5','8','3','Dragon Ball Z Kakarot','Es un juego de acción y rol y acción a cargo de Cyberconnect y Bandai Namco basado en la conocida marca Dragon Ball, que nos propone revivir los mejores momentos de la serie de Akira Toriyama con una gran aventura de rol que incluye, claro, emocionantes combates contra personajes tan icónicos como Vegeta, Raditz o Freezer. De hecho, el arco de Buu se incluirá en el juego.',55,7000
GO

INSERT INTO TipoPerif(T_Codigo_TipoPerif,T_Nombre,T_Descripcion)
	SELECT '1','Teclado','Es un dispositivo o periférico de entrada, en parte inspirado en el teclado de las máquinas de escribir, que utiliza un sistema de botones o teclas, para que actúen como palancas mecánicas o interruptores electrónicos que envían toda la información a la computadora.' UNION
	SELECT '2','Raton','Es un dispositivo apuntador utilizado para facilitar el manejo de un entorno gráfico en una computadora.' UNION
	SELECT '3','Cámara web','Es una pequeña cámara digital conectada a una computadora la cual puede capturar imágenes y transmitirlas a través de Internet, ya sea a una página web u otras computadoras de forma privada.' UNION
	SELECT '4','Micrófono','Es un dispositivo de entrada de audio. Se pueden conectar a la computadora para grabar sonido o para comunicarse por internet con otras personas.' UNION
	SELECT '5','Monitor','Es el principal dispositivo de salida (interfaz), que muestra datos o información al usuario.' UNION
	SELECT '6','Altavoz','Son dispositivos que permiten la amplificación del sonido. ' UNION
	SELECT '7','Auriculares','Son transductores que reciben una señal eléctrica de un tocador de medios de comunicación o el receptor y usan altavoces colocados en la proximidad cercana a los oídos para convertir la señal en ondas sonoras audibles.'
GO

INSERT INTO Marcas (M_Codigo_Marca,M_Nombre)
	SELECT '1','Logitech' UNION
	SELECT '2','Razer' UNION
	SELECT '3','Asus' UNION
	SELECT '4','Acer' UNION
	SELECT '5','LG'
GO

INSERT INTO Perifericos(PE_Codigo_Periferico,PE_Codigo_TipoPerif,PE_Nombre,PE_Codigo_Marca,PE_Descripcion,PE_Stock,PE_PrecioUnitario)
	SELECT '1','1','G Series G413 Romer-G','1','',100,12000 UNION
	SELECT '2','2','G Series G502 Black','1','',100,6300 UNION
	SELECT '3','7','G Series G432 Black','1','',100,11500 UNION
	SELECT '4','1','Orbweave Chroma Green Black','2','',60,14000 UNION
	SELECT '5','2','Krait Black','2','',90,11000 UNION
	SELECT '6','7','Mano War, Tournament Edition','2','',100,7000 UNION
	SELECT '7','1','Xa02 Rog Strix Scope Cherry Rgb','3','',70,23900 UNION
	SELECT '8','2','Rog Gladius li Aura Sync','3','',100,10300 UNION
	SELECT '9','5','KG1 KG241 led 24" Black','4','',100,48500 UNION
	SELECT '10','5','Full HD led 22"','5','',100,31000 
GO

INSERT INTO Prov_X_Perif(PP_Codigo_Proveedor,PP_Codigo_Periferico,PP_PrecioCompra)
	SELECT '1','1',1000 UNION
	SELECT '1','2',5000 UNION
	SELECT '1','3',1000 UNION
	SELECT '2','4',12000 UNION
	SELECT '2','5',9000 UNION
	SELECT '2','6',5000 UNION
	SELECT '3','7',20000 UNION
	SELECT '3','8',8000 UNION
	SELECT '4','9',40000 UNION
	SELECT '5','10',25000 UNION
	SELECT '1','4',11000 UNION
	SELECT '1','5',9500 UNION
	SELECT '1','6',5900 UNION
	SELECT '2','9',45000 UNION
	SELECT '2','10',28000
GO

INSERT INTO Prov_X_Juego (PJ_Codigo_Proveedor,PJ_Codigo_Juego,PJ_PrecioCompra)
	SELECT '1','1',1500 UNION
	SELECT '1','2',2500 UNION
	SELECT '1','3',100 UNION
	SELECT '2','2',2300 UNION
	SELECT '2','3',80 UNION
	SELECT '2','4',2000 UNION
	SELECT '3','5',6000 
GO

INSERT INTO Usuarios (U_Codigo_Usuario,U_Dni_Usuario,U_Nombre,U_Apellido,U_Admin)
	SELECT '1','1000','Nicolas','Rodriguez',1 UNION
	SELECT '2','1001','Mateo','De Benedictis Maza',1 UNION
	SELECT '3','1002','Ezequiel','Rickert',1
GO

INSERT INTO CodigosDeDescuento (CD_Codigo_CodDescuento,CD_Descripcion,CD_Habilitado,CD_Usos)
	SELECT '1','Descuento del 20% en Perifericos',0,0 UNION
	SELECT '2','Descuento del 20% en Juegos',0,0 UNION
	SELECT '3','Descuento del 15% en todos nuestros productos',0,0 
GO

-- PROCEDIMIENTOS ALMACENADOS

-- Insertar registro

-- Eliminar registro

-- Modificar registro

-- SCRIPTS