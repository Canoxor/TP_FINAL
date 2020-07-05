
-- CREACION DE LA BD + TABLAS
-- DROP TABLE PARCIAL_LAB_3_Version_4

CREATE DATABASE PARCIAL_LAB_3_Version_10
GO

USE PARCIAL_LAB_3_Version_10
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Juegos')
PRINT '* Ya existe la tabla Juegos'
ELSE
CREATE TABLE Juegos
(
	J_Codigo_Juego varchar(5) not null CONSTRAINT PK_Juegos PRIMARY KEY,
	J_Codigo_Genero varchar(5) not null,
	J_Codigo_PEGI varchar(5) not null,
	J_Nombre varchar(50) not null,
	J_Descripcion varchar(1000) null,
	J_Stock int not null,
	J_PrecioUnitario decimal(18,2) not null,
	J_Imagen varchar(200) not null,
	J_Estado bit default '1'
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Noticias')
PRINT '* Ya existe la tabla Noticias'
ELSE
CREATE TABLE Noticias
(
	N_Codigo_Noticia varchar(5) not null CONSTRAINT PK_Noticias PRIMARY KEY,
	N_Codigo_Juego varchar(5) not null,
	N_Nombre varchar(200) not null,
	N_Descripcion varchar(1000) null,
	N_Imagen varchar(200) not null,
	N_Estado bit default '1'
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Marcas')
PRINT '* Ya existe la tabla Marcas'
ELSE
CREATE TABLE Marcas
(
	M_Codigo_Marca varchar(5) not null CONSTRAINT PK_Marcas PRIMARY KEY,
	M_Nombre varchar(50) not null
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Perifericos')
PRINT '* Ya existe la tabla Perifericos'
ELSE
CREATE TABLE Perifericos
(
	PE_Codigo_Periferico varchar(5) not null CONSTRAINT PK_Perifericos PRIMARY KEY,
	PE_Codigo_TipoPerif varchar(5) not null,
	PE_Codigo_Marca varchar(5) not null,
	PE_Nombre varchar(50) not null,
	PE_Descripcion varchar(1000) not null,
	PE_Stock int null,
	PE_PrecioUnitario decimal(18,2) not null,
	PE_Imagen varchar(200) not null,
	PE_Estado bit default '1'
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')
PRINT '* Ya existe la tabla Proveedores'
ELSE
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
	P_Email varchar(50) null,
	P_Estado bit default '1'
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Prov_X_Perif')
PRINT '* Ya existe la tabla Prov_X_Perif'
ELSE
CREATE TABLE Prov_X_Perif
(
	PP_Codigo_Proveedor varchar(5) not null,
	PP_Codigo_Periferico varchar(5) not null,
	PP_PrecioCompra decimal(18,2) not null,
	CONSTRAINT PK_PxPE PRIMARY KEY(PP_Codigo_Proveedor,PP_Codigo_Periferico)
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Prov_X_Juego')
PRINT '* Ya existe la tabla Prov_X_Juego'
ELSE
CREATE TABLE Prov_X_Juego
(
	PJ_Codigo_Proveedor varchar(5) not null,
	PJ_Codigo_Juego varchar(5) not null,
	PJ_PrecioCompra decimal(18,2) not null,
	CONSTRAINT PK_PxJ PRIMARY KEY(PJ_Codigo_Proveedor,PJ_Codigo_Juego)
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PEGI')
PRINT '* Ya existe la tabla PEGI'
ELSE
CREATE TABLE PEGI
(
	PG_Codigo_PEGI varchar(5) not null CONSTRAINT PK_PEGI PRIMARY KEY,
	PG_Nombre varchar(10) not null,
	PG_Descripcion varchar(1000) null
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Generos')
PRINT '* Ya existe la tabla Generos'
ELSE
CREATE TABLE Generos
(
	G_Codigo_Genero varchar(5) not null CONSTRAINT PK_Generos PRIMARY KEY,
	G_Nombre varchar(50) not null,
	G_Descripcion varchar(1000) null
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TipoPerif')
PRINT '* Ya existe la tabla TipoPerif'
ELSE
CREATE TABLE TipoPerif
(
	T_Codigo_TipoPerif varchar(5) not null CONSTRAINT PK_Categorias PRIMARY KEY,
	T_Nombre varchar(50) not null,
	T_Descripcion varchar(1000) null
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DetalleFactura_Juegos')
PRINT '* Ya existe la tabla DetalleFactura_Juegos'
ELSE
CREATE TABLE DetalleFactura_Juegos
(
	DJ_Codigo_Factura varchar(5) not null,
	DJ_Codigo_Juego varchar(5) not null,
	DJ_Cantidad int not null,
	DJ_PrecioUnitario decimal(18,2) null,
	CONSTRAINT PK_DetalleFactura_Juegos PRIMARY KEY (DJ_Codigo_Factura, DJ_Codigo_Juego)
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DetalleFactura_Perifericos')
PRINT '* Ya existe la tabla DetalleFactura_Perifericos'
ELSE
CREATE TABLE DetalleFactura_Perifericos
(
	DP_Codigo_Factura varchar(5) not null,
	DP_Codigo_Periferico varchar(5) not null,
	DP_Cantidad int not null,
	DP_PrecioUnitario decimal(18,2) null,
	CONSTRAINT PK_DetalleFactura_Perifericos PRIMARY KEY (DP_Codigo_Factura, DP_Codigo_Periferico)
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Factura')
PRINT '* Ya existe la tabla Factura'
ELSE
CREATE TABLE Factura
(
	F_Codigo_Factura varchar(5) not null CONSTRAINT PK_Factura PRIMARY KEY,
	F_Codigo_Usuario varchar(5) not null,
	F_Codigo_CodDescuento varchar(5) not null,
	F_MontoTotal decimal(18,2) null,
	F_Fecha date null
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Usuarios')
PRINT '* Ya existe la tabla Usuarios'
ELSE
CREATE TABLE Usuarios
(
	U_Codigo_Usuario varchar(5) not null CONSTRAINT PK_Usuarios PRIMARY KEY,
	U_Dni_Usuario varchar(25) not null CONSTRAINT UK_Usuarios UNIQUE,
	U_Nombre varchar(50) null,
	U_Apellido varchar(50) null,
	U_Direccion varchar(100) null default 'Agregar',
	U_Telefono varchar(25) null default '0',
	U_Admin bit not null,
	U_Email varchar(100) not null,
	U_Contrasenia varchar(20) not null,
	U_Estado bit default '1'
)
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CodigosDeDescuento')
PRINT '* Ya existe la tabla CodigosDeDescuento'
ELSE
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

ALTER TABLE Noticias
ADD
	CONSTRAINT FK_Noticias_J FOREIGN KEY (N_Codigo_Juego) REFERENCES Juegos (J_Codigo_Juego)
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
	CONSTRAINT FK_DetalleFactura_Perifericos_J FOREIGN KEY (DP_Codigo_Periferico) REFERENCES Perifericos (PE_Codigo_Periferico),
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

INSERT INTO Proveedores(P_Codigo_Proveedor,P_RazonSocial,P_Direccion,P_Ciudad,P_Provincia,P_Cuil,P_Telefono,P_Contacto,P_Web,P_Email,P_Estado)
	SELECT '1','RazonS1','Calle100','Tigre','Buenos Aires','20.00000001.0','12123434','Luis Garcia','www.InfoGaming.com','InfoGaming@live.com','1' UNION
	SELECT '2','RazonS2','Calle200','San Fernando','Buenos Aires','20.00000002.0','34341212','Carolina Mendez','www.RealGames.com','RealGames@live.com','1' UNION
	SELECT '3','RazonS3','Calle300','Garin','Buenos Aires','20.00000003.0','13132424','Alfredo Rodriguez','www.ZonaGaming.com','ZonaGaming@live.com','1' UNION
	SELECT '4','RazonS4','Calle400','Rosario','Buenos Aires','20.00000004.0','24243131','Hernan Cabezas','www.zGames.com','zGames@live.com','1' UNION
	SELECT '5','RazonS5','Calle500','Palermo','Buenos Aires','20.00000005.0','44332211','Lucia Montenegro','www.Playings.com','Playings@live.com','1'
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

INSERT INTO Juegos (J_Imagen,J_Codigo_Juego,J_Codigo_Genero,J_Codigo_PEGI,J_Nombre,J_Descripcion,J_Stock,J_PrecioUnitario,J_Estado)
	SELECT 'https://cdn-products.eneba.com/resized-products/PHQ5ei2mYthRdM-FhrUqQkUIcKOxYNP6sN_-BSfxp5A_390x400_1x-0.jpeg','1','2','5','Metro Exodus','Un poderoso videojuego basado en las novelas superventas de Dmitri Glujovski. El shooter en primera persona vuelve a apostar por una ambientación postapocalítica muy cuidada, y por mezclar lugares angustiosos, claustrofóbicos y lúgubres con secciones mucho más abiertas.',100,2000,'1' UNION
	SELECT 'https://http2.mlstatic.com/mafia-3-ps4-fisico-nuevo-sellado-original-D_NQ_NP_764140-MLA31041880928_062019-F.jpg','2','1','5','Mafia 3','un juego de mundo abierto y acción en tercera persona, El juego está ambientado en la ciudad ficticia de New Bordeaux, basada en la Nueva Orleans de 1968, con un diseño de mundo abierto que permite explorar a los jugadores libremente en el juego.',80,3100,'1' UNION
	SELECT 'https://store-images.s-microsoft.com/image/apps.18799.14047496556148589.9fda5cef-7995-4dbb-a626-66d2ab3feb4f.1e167626-8b7d-47b4-9fe5-d06a43ac6677','3','7','2','Ori and the Will of the Wisps','Embárcate en una aventura totalmente nueva dentro de un inmenso mundo repleto de nuevos amigos y enemigos que cobran vida gracias a un impecable trabajo de diseño artesanal.',40,150,'1' UNION
	SELECT 'https://hipertextual.com/files/2020/03/hipertextual-call-of-duty-modern-warfare-2-remastered-es-real-se-filtra-su-primera-imagen-2020296416.jpg','4','2','5','Call of Duty Modern Warfare 2 Remaster','Es una edición remasterizada sobre el modo historia del exitoso FPS que garantiza texturas y animaciones mejoradas, renderizado físico, iluminación HDR y otras mejoras gráficas.',105,2800,'1' UNION
	SELECT 'https://cdn-cms.bnea.io/sites/default/files/games/boxart/196040508899500.jpg','5','8','3','Dragon Ball Z Kakarot','Es un juego de acción y rol y acción a cargo de Cyberconnect y Bandai Namco basado en la conocida marca Dragon Ball, que nos propone revivir los mejores momentos de la serie de Akira Toriyama con una gran aventura de rol que incluye, claro, emocionantes combates contra personajes tan icónicos como Vegeta, Raditz o Freezer. De hecho, el arco de Buu se incluirá en el juego.',55,7000,'1'
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

INSERT INTO Perifericos(PE_Imagen,PE_Codigo_Periferico,PE_Codigo_TipoPerif,PE_Nombre,PE_Codigo_Marca,PE_Descripcion,PE_Stock,PE_PrecioUnitario,PE_Estado)
	SELECT 'https://pampahogar.com.ar/media/catalog/product/cache/1/thumbnail/600x/17f82f742ffe127f42dca9de82fb58b1/t/e/teclado-logitech-g413-gamming-carbon-2.jpg','1','1','G Series G413 Romer-G','1','',100,12000,'1' UNION
	SELECT 'https://d34zlyc2cp9zm7.cloudfront.net/products/2ae26b68321c607bb07097001e56eb92b26a11ac35698e7b70f10461e189a340.jpg_500','2','2','G Series G502 Black','1','',100,6300,'1' UNION
	SELECT 'https://http2.mlstatic.com/auriculares-gamer-logitech-g-series-g432-black-D_Q_NP_861149-MLA41107813935_032020-F.webp','3','7','G Series G432 Black','1','',100,11500,'1' UNION
	SELECT 'https://http2.mlstatic.com/D_NQ_NP_671235-MLA32722390894_102019-O.jpg','4','1','Orbweaver Chroma Green Black','2','',60,14000,'1' UNION
	SELECT 'https://http2.mlstatic.com/mouse-gamer-razer-krait-4g-6400-dpi-3-bot-ambidiestro-pc-D_Q_NP_433625-MLA25482744873_042017-F.webp','5','2','Krait Black','2','',90,11000,'1' UNION
	SELECT 'https://http2.mlstatic.com/auriculares-gamer-razer-manowar-tournament-edition-overwatch-D_NQ_NP_641836-MLA26238153076_102017-F.jpg','6','7','Mano War, Tournament Edition','2','',100,31000,'1' UNION
	SELECT 'https://http2.mlstatic.com/teclado-asus-xa02-rog-strix-scope-cherry-rgb-D_NQ_NP_821109-MLA40024192180_122019-F.jpg','7','1','Xa02 Rog Strix Scope Cherry Rgb','3','',70,23900,'1' UNION
	SELECT 'https://www.excaliberpc.com/images/685630_2/large.jpg','8','2','Rog Gladius li Aura Sync','3','',100,10300,'1' UNION
	SELECT 'https://http2.mlstatic.com/monitor-acer-kg241q-pbiip-236-fhd-tn-144hz-1ms-freesync-D_NQ_NP_802255-MLA31790837645_082019-F.jpg','9','5','KG1 KG241 led 24" Black','4','',100,48500,'1' UNION
	SELECT 'https://http2.mlstatic.com/camara-web-cam-logitech-c270-720p-hd-twitch-skype-D_NQ_NP_787523-MLA31118123381_062019-F.webp','10','3','Logitech C270 720p Hd','1','',20,16000,'1' UNION
	SELECT 'https://http2.mlstatic.com/camara-web-webcam-logitech-c922-stream-1080p-tripode-oficial-D_NQ_NP_622987-MLA31695418229_082019-F.webp','11','3','Logitech C922 Stream 1080p','1','',100,10300,'1' 
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
	SELECT '1','4',11000 UNION
	SELECT '1','5',9500 UNION
	SELECT '1','6',5900 UNION
	SELECT '2','9',45000
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

INSERT INTO Usuarios (U_Codigo_Usuario,U_Dni_Usuario,U_Nombre,U_Apellido,U_Admin, U_Email,U_Contrasenia,U_Estado)
	SELECT '1','1000','Nicolas','Rodriguez','1','Nico@gmail.com','1111','1' UNION
	SELECT '2','1001','Mateo','De Benedictis Maza','1','Mateo@gmail.com','2222','1' UNION
	SELECT '3','1002','Fernando','Lozas','0','Fernando@gmail.com','fernando','1'
GO

INSERT INTO CodigosDeDescuento (CD_Codigo_CodDescuento,CD_Descripcion,CD_Habilitado,CD_Usos)
	SELECT '0','Sin Descuento',0,0 UNION
	SELECT '1','Descuento del 20% en Perifericos',0,0 UNION
	SELECT '2','Descuento del 20% en Juegos',0,0 UNION
	SELECT '3','Descuento del 15% en todos nuestros productos',0,0 
GO

INSERT INTO Noticias (N_Imagen,N_Codigo_Noticia,N_Codigo_Juego,N_Nombre,N_Descripcion,N_Estado)
	SELECT 'https://as.com/meristation/imagenes/2018/12/28/noticias/1545998865_939497_1545998958_noticia_normal.jpg','1','1','Metro Exodus y las aterradoras criaturas de su mundo','El capítulo ¿final? de la saga Metro cada día luce mejor, mostrando nuevas imágenes que le hacen postularse como uno de los grandes shooters de 2019.
Metro Exodus tiene tantas ganas de mostrarse al mundo que lo último que hemos sabido del juego es que ha adelantado su fecha de lanzamiento. El tercer y presumiblemente último juego de la saga se ha mostrado en cinco nuevas imágenes sobre los habitantes humanos —y los "no tan humanos"— que nos aguardarán (y acompañarán) en nuestro regreso a la Rusia post-nuclear.','1' UNION
	SELECT 'https://as01.epimg.net/meristation/imagenes/2019/03/01/noticias/1551419963_392862_1551420039_noticia_normal.jpg','2','4','Call of Duty: Modern Warfare 2 Remastered debuta con cifras millonarias','El modo campaña relanzado del segundo Modern Warfare pone de manifiesto que sigue habiendo interés en experiencias single player.
La saga Call of Duty se encuentra en su mejor momento de los últimos diez años. Tras el éxito cosechado por Call of Duty: Modern Warfare y su vertiente battle royale comercializada de forma independiente y gratuita (free to play), Warzone, desde SuperData reflejan ahora el exitoso debut que ha tenido Call of Duty: Modern Warfare 2 Remastered, el relanzamiento remasterizado de la campaña para un solo jugador de dicha entrega, que ha sumado solo en abril 3.4 millones de copias en formato digital en todo el mundo; 4 millones en total si sumamos las del último día de marzo.','1' UNION
	SELECT 'https://media.vandal.net/i/1024x576/5-2020/2020541224503_1.jpg','3','5','Desafía al Dios de la destrucción en Dragon Ball Z Kakarot','Dragon Ball Z Kakarot presenta con El despertar de un nuevo poder - Parte 1 su primer DLC de historia. En él, conoceremos a Whis y Bills (Beerus en el original), y tendremos que despertar un nuevo nivel de poder saiyan para poder afrontar el desafío. Para llegar a ello, Whis nos propondrá una serie de misiones que sirven de entrenamiento.','1' 
GO

INSERT INTO Factura (F_Codigo_Factura, F_Codigo_Usuario, F_Codigo_CodDescuento, F_MontoTotal, F_Fecha)
	SELECT '1', '3', '1', '9600', '2020-4-5' UNION
	SELECT '2', '3', '0', '12000', '2020-4-17' UNION
	SELECT '3', '2', '0', '23000', '2020-5-22' UNION
	SELECT '4', '1', '0', '5100', '2020-6-3' UNION
	SELECT '5', '3', '0', '12900', '2020-6-15' UNION
	SELECT '6', '2', '0', '89800', '2020-6-29'
GO

INSERT INTO DetalleFactura_Juegos (DJ_Codigo_Factura, DJ_Codigo_Juego, DJ_Cantidad, DJ_PrecioUnitario)
	SELECT '4', '1', '1', '2000' UNION
	SELECT '4', '2', '1', '3100' UNION
	SELECT '5', '2', '1', '3100' UNION
	SELECT '5', '4', '1', '2800' UNION
	SELECT '5', '5', '1', '7000'
GO

INSERT INTO DetalleFactura_Perifericos (DP_Codigo_Factura, DP_Codigo_Periferico, DP_Cantidad, DP_PrecioUnitario)
	SELECT '1', '1', '1', '12000' UNION
	SELECT '2', '1', '1', '12000' UNION
	SELECT '3', '3', '1', '11500' UNION
	SELECT '4', '5', '1', '11000' UNION
	SELECT '5', '8', '1', '10300' UNION
	SELECT '6', '9', '1', '48500' UNION
	SELECT '6', '6', '1', '31000' 
	GO

-- PROCEDIMIENTOS ALMACENADOS

-- JUEGOS

CREATE PROCEDURE SP_Insert_Juegos
(
	@J_Codigo_Genero varchar(5),
	@J_Codigo_PEGI varchar(5),
	@J_Nombre varchar(50),
	@J_Descripcion varchar(1000),
	@J_Stock int,
	@J_PrecioUnitario decimal(18,2),
	@J_Imagen varchar(200)
)
AS

DECLARE @J_Codigo_Juego varchar(5)
SET @J_Codigo_Juego = (select top 1 (J_Codigo_Juego)+1
from Juegos
ORDER BY
  CASE 
    WHEN ISNUMERIC(J_Codigo_Juego) = 1 THEN CONVERT(INT, J_Codigo_Juego) 
    ELSE 9999999
  END
  DESC)

INSERT INTO Juegos 
(
	J_Codigo_Juego,
	J_Codigo_Genero,
	J_Codigo_PEGI,
	J_Nombre,
	J_Descripcion,
	J_Stock,
	J_PrecioUnitario,
	J_Imagen
)
	SELECT 
	@J_Codigo_Juego,
	@J_Codigo_Genero,
	@J_Codigo_PEGI,
	@J_Nombre,
	@J_Descripcion,
	@J_Stock,
	@J_PrecioUnitario,
	@J_Imagen
GO

CREATE PROCEDURE SP_Delete_Juegos
(
	@J_Codigo_Juego varchar(5)
)
AS
UPDATE Juegos
SET J_Estado = '0'
WHERE J_Codigo_Juego = @J_Codigo_Juego
GO

CREATE PROCEDURE SP_Activate_Juegos
(
	@J_Codigo_Juego varchar(5)
)
AS
UPDATE Juegos
SET J_Estado = '1'
WHERE J_Codigo_Juego = @J_Codigo_Juego
GO

CREATE PROCEDURE SP_Update_Juegos
(
	@J_Codigo_Juego varchar(5),
	@J_PrecioNuevo decimal(18,2),
	@J_Stock int
)
AS
UPDATE Juegos
SET J_PrecioUnitario = @J_PrecioNuevo
WHERE J_Codigo_Juego = @J_Codigo_Juego

IF(@J_Stock!=-1)
UPDATE Juegos
SET J_Stock = @J_Stock
WHERE J_Codigo_Juego = @J_Codigo_Juego
GO

-- PERIFERICOS

CREATE PROCEDURE SP_Insert_Perifericos
(
	@PE_Codigo_TipoPerif varchar(5),
	@PE_Codigo_Marca varchar(5),
	@PE_Nombre varchar(50),
	@PE_Descripcion varchar(1000),
	@PE_Stock int,
	@PE_PrecioUnitario decimal(18,2),
	@PE_Imagen varchar(200)
)
AS

DECLARE @PE_Codigo_Periferico varchar(5)
SET @PE_Codigo_Periferico = (select top 1 (PE_Codigo_Periferico)+1
from Perifericos
ORDER BY
  CASE 
    WHEN ISNUMERIC(PE_Codigo_Periferico) = 1 THEN CONVERT(INT, PE_Codigo_Periferico) 
    ELSE 9999999
  END
  DESC)

INSERT INTO Perifericos
(
	PE_Codigo_Periferico,
	PE_Codigo_TipoPerif,
	PE_Codigo_Marca,
	PE_Nombre,
	PE_Descripcion,
	PE_Stock,
	PE_PrecioUnitario,
	PE_Imagen
)
	SELECT 
	@PE_Codigo_Periferico,
	@PE_Codigo_TipoPerif,
	@PE_Codigo_Marca,
	@PE_Nombre,
	@PE_Descripcion,
	@PE_Stock,
	@PE_PrecioUnitario,
	@PE_Imagen
GO

CREATE PROCEDURE SP_Delete_Perifericos
(
	@PE_Codigo_Periferico varchar(5)
)
AS
UPDATE Perifericos
SET PE_Estado = '0'
WHERE PE_Codigo_Periferico = @PE_Codigo_Periferico
GO

CREATE PROCEDURE SP_Activate_Perifericos
(
	@PE_Codigo_Periferico varchar(5)
)
AS
UPDATE Perifericos
SET PE_Estado = '1'
WHERE PE_Codigo_Periferico = @PE_Codigo_Periferico
GO

CREATE PROCEDURE SP_Update_Perifericos
(
	@PE_Codigo_Periferico varchar(5),
	@PE_StockNuevo int,
	@PE_PrecioNuevo decimal(18,2)
)
AS
IF(@PE_PrecioNuevo!=-1)
UPDATE Perifericos
SET PE_PrecioUnitario = @PE_PrecioNuevo
WHERE PE_Codigo_Periferico = @PE_Codigo_Periferico

IF(@PE_StockNuevo!=-1)
UPDATE Perifericos
SET PE_Stock = @PE_StockNuevo
WHERE PE_Codigo_Periferico = @PE_Codigo_Periferico
GO

-- PROVEEDORES

CREATE PROCEDURE SP_Insert_Proveedores
(
	@P_RazonSocial varchar(50),
	@P_Direccion varchar(50),
	@P_Ciudad varchar(50),
	@P_Provincia varchar(50),
	@P_Cuil varchar(25),
	@P_Telefono varchar(25),
	@P_Contacto varchar(50),
	@P_Web varchar(50),
	@P_Email varchar(50)
)
AS

DECLARE @P_Codigo_Proveedor varchar(5)
SET @P_Codigo_Proveedor = (select top 1 (P_Codigo_Proveedor)+1
from Proveedores
ORDER BY
  CASE 
    WHEN ISNUMERIC(P_Codigo_Proveedor) = 1 THEN CONVERT(INT, P_Codigo_Proveedor) 
    ELSE 9999999
  END
  DESC)

INSERT INTO Proveedores
(
	P_Codigo_Proveedor,
	P_RazonSocial,
	P_Direccion,
	P_Ciudad,
	P_Provincia,
	P_Cuil,
	P_Telefono,
	P_Contacto,
	P_Web,
	P_Email
)
	SELECT 
	@P_Codigo_Proveedor,
	@P_RazonSocial,
	@P_Direccion,
	@P_Ciudad,
	@P_Provincia,
	@P_Cuil,
	@P_Telefono,
	@P_Contacto,
	@P_Web,
	@P_Email
GO

CREATE PROCEDURE SP_Delete_Proveedores
(
	@P_Codigo_Proveedor varchar(5)
)
AS
UPDATE Proveedores
SET P_Estado = '0'
WHERE P_Codigo_Proveedor = @P_Codigo_Proveedor
GO

CREATE PROCEDURE SP_Activate_Proveedores
(
	@P_Codigo_Proveedor varchar(5)
)
AS
UPDATE Proveedores
SET P_Estado = '1'
WHERE P_Codigo_Proveedor = @P_Codigo_Proveedor
GO

CREATE PROCEDURE SP_Update_Proveedores
(
	@P_Codigo_Proveedor varchar(5),
	@P_WebNueva decimal(18,2)
)
AS
UPDATE Proveedores
SET P_Web = @P_WebNueva
WHERE P_Codigo_Proveedor = @P_Codigo_Proveedor
GO

-- MARCAS

CREATE PROCEDURE SP_Insert_Marcas
(
	@M_Nombre varchar(50)
)
AS

DECLARE @M_Codigo_Marca varchar(5)
SET @M_Codigo_Marca = (select top 1 (M_Codigo_Marca)+1
from Marcas
ORDER BY
  CASE 
    WHEN ISNUMERIC(M_Codigo_Marca) = 1 THEN CONVERT(INT, M_Codigo_Marca) 
    ELSE 9999999
  END
  DESC)

INSERT INTO Marcas
(
	M_Codigo_Marca,
	M_Nombre
)
	SELECT
	@M_Codigo_Marca,
	@M_Nombre
GO

-- USUARIOS

CREATE PROCEDURE SP_Insert_Usuarios
(
	@U_Dni_Usuario varchar(25),
	@U_Nombre varchar(50),
	@U_Apellido varchar(50),
	@U_Direccion varchar(100),
	@U_Telefono varchar(25),
	@U_Admin bit,
	@U_Email varchar (100),
	@U_Contrasenia varchar(20)
)
AS

DECLARE @U_Codigo_Usuario varchar(5)
SET @U_Codigo_Usuario = (select top 1 (U_Codigo_Usuario)+1
from Usuarios
ORDER BY
  CASE 
    WHEN ISNUMERIC(U_Codigo_Usuario) = 1 THEN CONVERT(INT, U_Codigo_Usuario) 
    ELSE 9999999
  END
  DESC)

INSERT INTO Usuarios
(
	U_Codigo_Usuario,
	U_Dni_Usuario,
	U_Nombre,
	U_Apellido,
	U_Direccion,
	U_Telefono,
	U_Admin,
	U_Email,
	U_Contrasenia
)
SELECT 
	@U_Codigo_Usuario,
	@U_Dni_Usuario,
	@U_Nombre,
	@U_Apellido,
	@U_Direccion,
	@U_Telefono,
	@U_Admin,
	@U_Email,
	@U_Contrasenia
GO

CREATE PROCEDURE SP_Delete_Usuarios
(
	@U_Codigo_Usuario varchar(5)
)
AS
UPDATE Usuarios
SET U_Estado = '0'
WHERE U_Codigo_Usuario = @U_Codigo_Usuario
GO

CREATE PROCEDURE SP_Activate_Usuarios
(
	@U_Codigo_Usuario varchar(5)
)
AS
UPDATE Usuarios
SET U_Estado = '1'
WHERE U_Codigo_Usuario = @U_Codigo_Usuario
GO

CREATE PROCEDURE SP_Update_Usuarios
(
	@U_Codigo_Usuario varchar(5),
	@U_Nombre varchar(50),
	@U_Apellido varchar(50),
	@U_Direccion varchar(100),
	@U_Telefono varchar(25),
	@U_Admin bit,
	@U_Email varchar (100),
	@U_Contrasenia varchar(20)
)
AS
UPDATE Usuarios
SET 
U_Nombre = @U_Nombre,
U_Apellido = @U_Apellido,
U_Direccion = @U_Direccion,
U_Telefono = @U_Telefono,
U_Admin = @U_Admin,
U_Email = @U_Email,
U_Contrasenia = @U_Contrasenia
WHERE U_Codigo_Usuario = @U_Codigo_Usuario
GO

--NOTICIAS

CREATE PROCEDURE SP_Insert_Noticias
(
	@N_Codigo_Juego varchar(5),
	@N_Nombre varchar(200),
	@N_Descripcion varchar(1000),
	@N_Imagen varchar(200)
) 
AS

DECLARE @N_Codigo_Noticia varchar(5)
SET @N_Codigo_Noticia = (select top 1 (N_Codigo_Noticia)+1
from Noticias
ORDER BY
  CASE 
    WHEN ISNUMERIC(N_Codigo_Noticia) = 1 THEN CONVERT(INT, N_Codigo_Noticia) 
    ELSE 9999999
  END
  DESC)

INSERT INTO Noticias
(
	N_Codigo_Noticia,
	N_Codigo_Juego,
	N_Nombre,
	N_Descripcion,
	N_Imagen
)
SELECT
	@N_Codigo_Noticia,
	@N_Codigo_Juego,
	@N_Nombre,
	@N_Descripcion,
	@N_Imagen
GO

CREATE PROCEDURE SP_Delete_Noticias
(
	@N_Codigo_Noticia varchar(5)
)
AS
UPDATE Noticias
SET N_Estado = '0'
WHERE N_Codigo_Noticia = @N_Codigo_Noticia
GO

CREATE PROCEDURE SP_Activate_Noticias
(
	@N_Codigo_Noticia varchar(5)
)
AS
UPDATE Noticias
SET N_Estado = '1'
WHERE N_Codigo_Noticia = @N_Codigo_Noticia
GO

-- CONSULTAS 

-- Verificar STOCK escaso
SELECT PE_Codigo_Periferico AS [Codigo], 
	   PE_Nombre AS [Nombre], 
	   [Estado del Stock] =
	CASE
	WHEN PE_Stock <= 10 THEN 'Escaso'
	WHEN PE_Stock > 10 AND
		 PE_Stock <= 20 THEN 'Por escasear'
	ELSE 'En condición'
	END
FROM Perifericos
GO

-- Verificar STOCK = 0
IF EXISTS (SELECT * FROM Perifericos
		   WHERE PE_Stock = 0)
   (SELECT PE_Codigo_Periferico AS [Codigo], 
	       PE_Nombre AS [Nombre]
	FROM Perifericos
	WHERE PE_Stock = 0)
ELSE
	SELECT 'Ningun periferico esta sin stock' AS [Mensaje]
GO

-- Retorna la fecha actual
SELECT CAST(DAY(GETDATE()) AS VARCHAR(3)) +'/'+ CAST(MONTH(GETDATE()) AS VARCHAR(3)) +'/'+ CAST(YEAR(GETDATE()) AS VARCHAR(5));

/*
-- Suma la recaudacion total de todos los años
SELECT SUM(F_MontoTotal) AS [Total Recaudado], DATEPART(YEAR,F_Fecha) AS [Año]
FROM Factura
ORDER BY DATEPART(YEAR,F_Fecha) ASC
GO
*/