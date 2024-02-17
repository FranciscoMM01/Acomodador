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
PRINT @FolioSig
DROP TABLE #FiltroFolios

