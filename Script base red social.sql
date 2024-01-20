CREATE DATABASE empresaX
GO

USE empresaX
GO

CREATE SCHEMA general;
GO
	
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

CREATE TABLE dbo.Amistades(
IDusuario1 INT,
IDusuario2 INT,
Relación INT

)

--No se creará index para esta tabla

CREATE TABLE dbo.Publicaciones(
SeriePublicacion VARCHAR(5),
IDPublicacion INT,
FechaPublicado DATE,
FechaModificado DATE,
TipoContenido INT

)

CREATE INDEX ConsultaPublicacion ON dbo.Publicaciones (SeriePublicacion, IdPublicacion)


CREATE TABLE dbo.Comentarios(
NumComentario INT,
FechaComentario DATE,
Usuariocomentario VARCHAR(30),
ContenidoComentario VARCHAR(300)
)

--No se creará index para esta tabla

CREATE TABLE dbo.Reacciones(
Usuario Varchar(30) NOT NULL,
HoraReaccion DATE NOT NULL

)
