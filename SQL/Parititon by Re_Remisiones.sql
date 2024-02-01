-- Total de ventas por producto
USE FREST
select 
cod,
cant,
PU,
Fecha,
SUM(Cant * PU) OVER (PARTITION BY COD ) AS TotalVent
from RE_RemisionesLinea
where fecha > '2022-01-01 00:00:00'
order by TotalVent


-- Productos mas caros vendidos
select 
cod,
cant,
PU,
Fecha,
ROW_NUMBER() OVER (PARTITION BY COD ORDER BY PU) AS MasCaros
from RE_RemisionesLinea
where fecha > '2022-01-01 00:00:00'
