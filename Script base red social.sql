-- Se crea la base de datos
CREATE DATABASE empresaX
GO

USE empresaX
GO

CREATE SCHEMA general;
go
CREATE SCHEMA app1;
go
CREATE SCHEMA app2;
go
CREATE SCHEMA app3;
GO

--Schema general para datos meta app
--Schema APP1 tablas que solo se usaran en la primera app
--Schema APP2 tablas que solo se usarán en la segunda app
--Schema APP3 tablas que solo se usarán en la tercera app

	
CREATE TABLE general.Usuarios (
IDUsuario int IDENTITY(1000,10) PRIMARY KEY, 
Tipo INT NOT NULL,
correo VARCHAR(50) NOT NULL UNIQUE,
nombre VARCHAR (30) NOT NULL,
Apellido VARCHAR(30),
NombreUsuario VARCHAR(30) NOT NULL,
edad INT, check (edad > 12), 
cumpleaños DATE,
ciudad VARCHAR,
contraseña INT NOT NULL default 123
)

CREATE UNIQUE INDEX NombreUsuario on General.Usuarios (NombreUsuario)
CREATE UNIQUE INDEX IDUsuario on General.Usuarios (IDUsuario)

CREATE TABLE general.Aplicaciones (
IDAPP INT IDENTITY (1,1) PRIMARY KEY,
NombreApp VARCHAR(30),
Estatus BIT
)

CREATE UNIQUE INDEX IDAPP on general.APlicaciones (IDAPP)

CREATE TABLE app1.Amistades(
IDusuario1 INT NOT NULL FOREIGN KEY REFERENCES general.usuarios(IDUsuario),
IDusuario2 INT NOT NULL FOREIGN KEY REFERENCES general.usuarios(IDUsuario),
Relación INT NOT NULL

)

-- No se creará index para esta tabla

CREATE TABLE app1.Publicaciones(
SeriePublicacion VARCHAR(5) NOT NULL,
IDPublicacion INT NOT NULL ,
FechaPublicado DATE DEFAULT GETDATE(),
FechaModificado DATE DEFAULT NULL,
TipoContenido INT
-- Creamos una llave primaria compuesta
--PRIMARY KEY(IDPublicacion, SeriePublicacion) 
PRIMARY KEY(IDPublicacion)

)

--CREATE INDEX ConsultaPublicacion ON dbo.Publicaciones (SeriePublicacion, IdPublicacion)


CREATE TABLE app1.Comentarios(
IDPublicacion INT,
SeriePublicacion VARCHAR(5),
NumComentario INT,
FechaComentario DATE DEFAULT GETDATE(),
Usuariocomentario VARCHAR(30) FOREIGN KEY REFERENCES general.Usuarios(NombreUsuario),
ContenidoComentario VARCHAR(300)

-- Llave foranea compuesta que referencía a app1.Publicaciones
--FOREIGN KEY (IDPublicacion, SeriePublicacion) REFERENCES app1.Publicaciones (IDPublicacion, SeriePublicacion)
)

--No se creará index para esta tabla

CREATE TABLE app1.Reacciones(
IDReaccion Varchar(10) PRIMARY KEY,
TipoReaccion INT NOT NULL,
Usuario Varchar(30) NOT NULL,
HoraReaccion DATE DEFAULT GETDATE()

)

CREATE UNIQUE INDEX IDReaccion ON app1.Reacciones (IDReaccion)

CREATE TABLE app1.Seguidores(
Usuario1 VARCHAR(30),
Usuario2 VARCHAR(30),
TipoSeguimiento INT

)
-- No se creará index para esta tabla

CREATE TABLE general.Mensajes(
Usuario1 VARCHAR(30) NOT NULL,
Usuario2 VARCHAR(30) NOT NULL,
ContenidoMsj VARCHAR(300),

)
-- No se creará index para esta tabla

CREATE TABLE general.Grupos(
NombreGrupo VARCHAR(20) NOT NULL,
Miembros VARCHAR(20)

)
CREATE UNIQUE INDEX NombreGrupo on general.Grupos (NombreGrupo)


