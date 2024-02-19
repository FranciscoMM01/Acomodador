
--Paso1: Usar la base que se quiere corregir
USE VENT0
GO

--Paso2: Correr función para la creación dela tabla de folios incorrectos
				--FUNCIÓN PARA VERIFICAR LA EXISTENCIA DE UNA TABLA
DECLARE @NombreTabla VARCHAR(MAX) = 'ZZ_FoliosSaltos';

IF NOT EXISTS( SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @NombreTabla)
BEGIN

	DECLARE @sql NVARCHAR(MAX)
	SET @sql = 'CREATE TABLE '+ @NombreTabla +' ('
		+ 'ID INT identity, '
		+ 'FolioViejo INT
		); ';
	EXEC sp_executesql @sql;

	PRINT 'La tabla se ha creado'
END

ELSE 
	PRINT 'La tabla ya existe';
          -- TERMINA FUNCIÓN DE VERIFICACIÓN DE EXISTENCIA

GO

--Paso 3: Añadir en la tabla dbo.ZZ_FoliosSaltos los folios incorrectos en la columna FolioViejo


--Paso 4: Obtener el folio siguiente (Correr Paso 4 y 5 a la vez)
--Paso 5: Comenzar la corrección con la ejecución de lo Querys


					--OBTENER EL FOLIO SIGUIENTE
CREATE TABLE #FiltroFolios(
	Folios int 
)
INSERT INTO #FiltroFolios (Folios)
SELECT FolioFac
FROM VE_Factura;

DELETE #FiltroFolios
FROM #FiltroFolios
INNER JOIN ZZ_FoliosSaltos  ON #FiltroFolios.Folios = ZZ_FoliosSaltos.Folioviejo

SELECT * FROM #FiltroFolios

DECLARE @FolioSig INT  = (SELECT TOP(1) folios from #FiltroFolios order by folios desc) + 1;
PRINT ('El próximo folio es : '+ CAST(@FolioSig AS VARCHAR(20)))


--Paso 5: Comenzar la corrección con la ejecución de lo Querys

					--COMENZAR CON LA CORRECION
DECLARE @i INT = 1
DECLARE @j INT = 1
DECLARE @TotalFilas INT

SELECT @TotalFilas = COUNT(*) FROM ZZ_FoliosSaltos

WHILE @i <= @TotalFilas		--Obtener Folios viejos uno por uno
BEGIN
	DECLARE @ValorColumna INT;
	SELECT @ValorColumna = FolioViejo
	FROM ZZ_FoliosSaltos
	WHERE ID = @i

		DECLARE @QueryVe_Factura NVARCHAR(MAX)
		DECLARE @QueryPV_Tickets NVARCHAR(MAX)
		DECLARE @QueryPV_VxP NVARCHAR(MAX)

		SET @QueryVe_Factura = 'UPDATE VE_Factura SET FolioFac = '+ CAST(@folioSig AS VARCHAR(10)) + ' WHERE FolioFac = ' + CAST(@ValorColumna AS VARCHAR(10)) + ' AND SerieFac = ''FA'''
		SET @QueryPV_Tickets = 'UPDATE PV_TicketsFacturados SET FolioFac = '+ CAST(@folioSig AS VARCHAR(10)) + ' WHERE FolioFac = ' + CAST(@ValorColumna AS VARCHAR(10)) + ' AND SerieFac = ''FA'''
		SET @QueryPV_VxP = 'UPDATE PV_Ventas_Por_Producto SET FolioFac = '+ CAST(@folioSig AS VARCHAR(10)) + ' WHERE FolioFac = ' + CAST(@ValorColumna AS VARCHAR(10)) + ' AND SerieFac = ''FA'''
		
		EXEC sp_executesql @queryVe_Factura;
		EXEC sp_executesql @QueryPV_Tickets
		EXEC sp_executesql @QueryPV_VxP

		--PRINT @QueryVE_Factura
		--PRINT @QueryPV_Tickets
		--PRINT @QueryPV_VxP

		SET @i = @i + 1;
		SET @FolioSig = @FolioSig +1
END
DROP TABLE #FiltroFolios

