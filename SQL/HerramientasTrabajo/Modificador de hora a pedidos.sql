
UPDATE PR_productos	
SET fechacambiostatus = REPLACE(FechaCambioStatus, '00:00:00.001', '00:00:00.000')

UPDATE PR_Productos
SET FechaCambioStatus = '11:23:21.000' + SUBSTRING(FechaCambioStatus, 23, len(FechaCambioStatus))
WHERE SUBSTRING(FechaCambioStatus, 23, 23) = '1'


UPDATE PR_productos	 SET Nombre = REPLACE(Nombre, 'lapicer', 'lapice')


CREATE TYPE [dbo].[MyTableType] AS TABLE
(
    Id INT, Name VARCHAR(128)
)


Select Fechacambiostatus from PR_productos where Codigo= 2
declare @newhora  datetime  
declare @oldhora datetime = fechaCambioStats where codigo = 1
Select DATEADD(HOUR,1,'2022-07-26 00:00:00.000')as newdatatime;

INSERT INTO VE_LineaPedido
(cantidad, claveimpto, CodigoProd, Comentario, Descripcion, DescripcionCorta, Descuento,
fecha, Folio, Impuesto, Nolinea, 
PorcentCom, PorcentDscto, preciounitario, Serie, tipo, Unidad, ClaveImpto2, ClaveImpto3,
ClaveImptoRet1, ClaveImptoRet2, curDescLinea, curImp1, curImp2,curImp3,
curRet1, curRet2, curCar1, curcar2, Curcar3, curDes1, curDes2, curDes3, curSubTotal, curTotal, PorcentComTecnico, PorcentComPromotor, TipoDscto, ListaPrecios, IDInmueble,
ValorAvaluo, Colonia, Calle, NumExt, NumInt, cp, FolioReal, AgregadoEnPreSurtido, sAlmacen)
VALUES(


1.00, 'IVA16', '03802', '', 'FG-60F-BDL-950-60, N/S: FGT60FTK22099AE4' , 
'FGT60FTK22099AE4', 0, '2019-05-29 00:00:00.000',
1904, 1600, 1, 0, 0, 2899.79, 'P', 1, 'PZA', '', '', '', '',
0, 0, 0, 0, 0.00, 463.97, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00,
2899.79, 3363.76, 0, 0,
'', '<Ninguna>', 0, 0.00, '', '', '', '', 0, 0, ''
);


insert into VE_LineaPedido (Serie, Fecha)
values ('00', '2019-05-29 00:00:00.000')

update PR_Productos set FechaCambioStatus = @newhora where codigo = 1