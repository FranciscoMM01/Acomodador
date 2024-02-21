-- Declaracion de variables para ciclos y constantes
DECLARE @i INT = 1
DECLARE @name VARCHAR(30)
DECLARE @apell VARCHAR(30)


	-- Mientras el contador sea menor del numero de datos en la tabla Names
WHILE @i <= (SELECT MAX(ID) FROM dbo.Names) -- WHILE 1
DECLARE @Fecha DATE = DATEFROMPARTS(1900 + (@i * 30), @i * 2, @i * 8);
BEGIN

	--Obtener el valor del nombre en la posición @i
	SELECT @name = nombre FROM dbo.Names WHERE ID = @i;
	SELECT @apell = apellido FROM dbo.Names WHERE ID = @i
	
	-- Insertar dentro de la tabla General.Usuario
	INSERT INTO General.Usuarios(Tipo, Correo, Nombre, Apellido, NombreUsuario, Edad, Cumpleaños, Ciudad, Contraseña)
	VALUES(1, --TIPO
		LEFT(@name,3)+'@'+LEFT(@apell,3)+'.com', --CORREO
		@name, --NOMBRE
		@apell,  -- APELLIDO
		LEFT(@name,3)+LEFT(@apell, 3)+ CONVERT(VARCHAR(3),@i), --NOMBRE USUARIO
		@i*20-0.5*@i, --EDAD
		@Fecha, --FECHA
		'CIUDAD'+CONVERT(VARCHAR(3),@i),  --CIUDAD
		@i*123 --CONTRASEÑA
		)

	SET @i = @i +1 -- Incrementar WHILE 1
END -- Fin WHILE 1

		
SELECT * FROM general.Usuarios
