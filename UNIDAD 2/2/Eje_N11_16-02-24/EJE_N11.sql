--16-02-24

use NORTHWND

--Sintaxis:
/*
	CASE
		WHEN condición1 THEN resultado1
		WHEN condición1 THEN resultado1
		WHEN condición1 THEN resultado1
		ELSE result
	END;

*/

select *,
	CASE
	WHEN Quantity > 30 THEN 'La cantidad es mayor a 30'
	WHEN Quantity = 30 THEN 'La cantidad es 30'
	ELSE 'La cantidad esta por debajo de 30'
	END AS CantidadTexto
from [Order Details]

--

select *,
	case
	when UnitsInStock = 0 then 'Sin Stock'
	when UnitsInStock between 1 and 20 then 'Stock Bajo'
	when UnitsInStock between 21 and 50 then 'Stock Medio'
	when UnitsInStock >= 51 and UnitsInStock <= 90 then 'Stock Alto'
	else 'Stock Maximo'
	end as 'Tipo de stock'
from NORTHWND.dbo.Products

------------
create database pruebacase

use pruebacase

create table nuevatabla(
id int not null,
nombre nvarchar(40) not null,
unitprice money,
UnitsInStock smallint,
constraint pk_nuevatabla
primary key(id)
)


--Crear la estructura de una tabla en base a una consulta

select top 0 ProductID as numeroproducto,
ProductName as Descripcion, UnitPrice as PrecioUnitario,
UnitsInStock as existencia
into nuevatabla3
from NORTHWND.dbo.Products

select * from nuevatabla3

--''

select * from nuevatabla2

alter table nuevatabla2
add constraint pk_nuevatabla2
primary key(numeroproducto)

select ProductoID as numeroproducto,
ProductName as descripcion, UnitPrice as precio unitario,
UnitInStock as existencia
from NORTHWND.dbo.Products



---


select * from nuevatabla2
select ProductoID as numeroproducto,
ProductName as descripcion, UnitPrice as precio unitario,
UnitInStock as existencia
from NORTHWND.dbo.Products


select p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock
	case
	when UnitsInStock = 0 then 'Sin Stock'
	when UnitsInStock between 1 and 20 then 'Stock Bajo'
	when UnitsInStock between 21 and 50 then 'Stock Medio'
	when UnitsInStock >= 51 and UnitsInStock <= 90 then 'Stock Alto'
	else 'Stock Maximo'
	end as 'Tipo de stock'
into tablaconcase
from NORTHWND.dbo.Products as´p


--20 de febrero


