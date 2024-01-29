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
	VALUES(1, 
		LEFT(@name,3)+'@'+LEFT(@apell,3)+'.com', 
		@name,
		@apell, 
		LEFT(@name,3)+LEFT(@apell, 3)+ CONVERT(VARCHAR(3),@i),
		@i*20-0.5*@i, 
		@Fecha, 
		'CIUDAD'+CONVERT(VARCHAR(3),@i), 
		@i*123 
		)

	SET @i = @i +1 -- Incrementar WHILE 1
END -- Fin WHILE 1

SELECT * FROM general.Usuarios