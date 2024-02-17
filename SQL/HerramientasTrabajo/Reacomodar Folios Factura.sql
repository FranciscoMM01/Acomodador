USE VENT0
GO

				--FUNCIÓN PARA VERIFICAR LA EXISTENCIA DE UNA TABLA
DECLARE @NombreTabla VARCHAR(MAX) = 'Folios';

IF NOT EXISTS( SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @NombreTabla)
BEGIN
	DECLARE @sql NVARCHAR(MAX)
	SET @sql = 'CREATE TABLE '+ @NombreTabla +' ('
		+ 'ID identity, '
		+ 'FolioViejo int, '
		+ 'FolioNuevo int ) ';
	EXEC sp_executesql @sql;

	PRINT 'La tabla se ha creado'

END

ELSE 
	PRINT 'La tabla ya existe';
          -- TERMINA FUNCIÓN DE VERIFICACIÓN DE EXISTENCIA

	  --OBTENER EL FOLIO SIGUIENTE
CREATE TABLE #FiltroFolios(
	Folios int 
)
INSERT INTO #FiltroFolios (Folios)
SELECT FolioFac
FROM VE_Factura;

DELETE #FiltroFolios
FROM #FiltroFolios
INNER JOIN Folios  ON #FiltroFolios.Folios = Folios.Folioviejo

SELECT * FROM #FiltroFolios

--DECLARE @FolioSig INT = MAX(SELECT Folios TOP(1) FROM #FiltroFolios)
DECLARE @FolioSig INT  = (SELECT TOP(1) FOLIOS from #FiltroFolios order by folios desc) + 1;
PRINT ('El próximo folio es : '+ CAST(@FolioSig AS VARCHAR(20)))


					--COMENZAR CON LA CORRECION
DECLARE @i INT = 1
DECLARE @j INT = 1
DECLARE @TotalFilas INT

SELECT @TotalFilas = COUNT(*) FROM Folios

WHILE @i <= @TotalFilas		--Obtener Folios viejos uno por uno
BEGIN
	DECLARE @ValorColumna INT;
	SELECT @ValorColumna = FolioViejo
	FROM Folios
	WHERE ID = @i

	--PRINT @ValorColumna

		--print('VIEJO: ' + CAST(@ValorColumna AS VARCHAR(10)) + ' NUEVO: ' + CAST(@folioSig AS VARCHAR(10)))
		PRINT('UPDATE VE_Factura SET FolioFac = '+ CAST(@folioSig AS VARCHAR(10)) + ' WHERE FolioFac = ' + CAST(@ValorColumna AS VARCHAR(10)) + ' AND SerieFac = ''MM''')
		SET @i = @i + 1;
		SET @FolioSig = @FolioSig +1
END
DROP TABLE #FiltroFolios

