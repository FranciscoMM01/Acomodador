BEGIN TRANSACTION;
IF OBJECT_ID('tempdb..#test') IS NOT NULL
	DROP TABLE #TEST;

CREATE TABLE #TEST(
	campoA int,
	campoB decimal (4,2) --(Izquierda Pdecimal, derecha Pdecimal)
	);

DECLARE @num int = 12
DECLARE @i int = 1
DECLARE @Producto int = 3
DECLARE @PrecioProducto decimal(4,4) = 
		(Select TOP(1) Precio FROM TablaProductos WHERE Producto = @Producto)

WHILE(@I < @num)
BEGIN

	INSERT INTO #TEST(campoA,campoB)
	VALUES (@i, (15*(@i * 0.01)))

	SET @i = @i + 1
END

SELECT * FROM #TEST
