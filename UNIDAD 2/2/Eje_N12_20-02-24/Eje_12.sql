
--Procedimientos Almacenados

use NORTHWND

select * from Customers
go

--SP para visualizar los clientes

create proc visualizarClientes
AS
begin
select * from Customers
end
go

--Cambiar SP

Alter proc visualizarClientes
AS
begin
select CompanyName, ContactName from Customers
end
go

--Eliminar SP

drop procedure visualizarClientes
go

--Ejecutar SP

exec visualizarClientes
execute visualizarClientes
go

--

create procedure listarClientesciudad
@ciudad nvarchar(15) /*el @ es para seleccionar el parametro*/
AS
begin
select * from Customers
where city = @ciudad
end
go


--

exec listarClientesciudad 'Berlin'


--

create proc listarClientesnombre
@nombre nvarchar(40) /*el @ es para seleccionar el parametro*/
AS
begin
select * from Customers
where CompanyName like @nombre + '%'
end
go

exec listarClientesnombre 'Laz'

--Realizar un SP que obtenga las ventas totales
-- realizadas a los clientes por año elegido

--21-febrero

--SP para calcular el total de una Orden

create proc CalcularTotalOrden
@idorder int
AS
begin --Iniciar untramo de codigo
select o.OrderID as 'numero de la orden' ,sum(od.Quantity * od.UnitPrice) as 'Total de la orden'
from Orders as o
inner join [Order Details] as od
on od.OrderID = o.OrderID
where o.OrderID = @idorder
group by o.OrderID
end
go
 
exec CalcularTotalOrden '10273'


--Realizar un sp para actualizar la cantidad de productos en stock
create proc ActualizarnumProductos
@nameproduct varchar(50), @numstock int
AS
begin --Iniciar untramo de codigo
UPDATE Products
SET UnitsInStock = @numstock
WHERE ProductName = @nameproduct
end
go

exec ActualizarnumProductos 'Alice Mutton', 0


-- Realizar un sp para calcular el total de ventas de un empleado
create proc CalcularVentastotalesempleado
@nameemplo varchar(50)
AS
begin --Iniciar untramo de codigo
select concat(em.FirstName, ' ', em.LastName) as 'Nombre del empleado',
sum(od.Quantity * od.UnitPrice) as 'Total de la ventas'
from Employees as em
inner join Orders as o
on o.EmployeeID = em.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
where em.FirstName = @nameemplo
group by concat(em.FirstName, ' ', em.LastName)
end
go

exec CalcularVentastotalesempleado 'Nancy'

--Realizar un sp para actualizar la cantidad de productos en stock
create proc Actualizarnombre
@idemplo int, @firstname varchar(20)
AS
begin --Iniciar untramo de codigo
UPDATE Employees
SET FirstName = @firstname
WHERE EmployeeID = @idemplo
end
go

exec Actualizarnombre 1, 'Nancy'

--Realizar un SP para obtener el total de ventas por pais
--Realizar un sp para actualizar la cantidad de productos en stock
create proc Ventasporpais
AS
begin --Iniciar untramo de codigo
select cus.Country as 'Pais',
sum(od.Quantity * od.UnitPrice) as 'Total de la ventas'
from Customers as cus
inner join Orders as o
on o.CustomerID = cus.CustomerID
inner join [Order Details] as od
on od.OrderID = o.OrderID
group by cus.Country
end
go

exec Ventasporpais


-- Realizar un SP para obtener el numero de ordenes por cliente
create proc OrdensbyClient
AS
begin --Iniciar untramo de codigo
select cus.CompanyName as 'cliente',
sum(od.Quantity) as 'Total de Ordenes'
from Customers as cus
inner join Orders as o
on o.CustomerID = cus.CustomerID
inner join [Order Details] as od
on od.OrderID = o.OrderID
group by cus.CompanyName
end
go

exec OrdensbyClient


--realizar un SP para calcular el total de productos vendidos por categoria
create proc TotalPbyCategory
AS
begin --Iniciar untramo de codigo
select cat.CategoryName as 'Categoria del producto',
sum(od.Quantity) as 'Productos Vendidos'
from Categories as cat
inner join Products as p
on p.CategoryID = cat.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by cat.CategoryName
end
go

exec TotalPbyCategory

--realizar un SP para calcular el total de ventas por año
create proc Totalventasbyyear
@anio char(4)
AS
begin --Iniciar untramo de codigo
select 
sum(od.Quantity * od.UnitPrice) as 'total de Ventas'
from Orders as o
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on od.ProductID = p.ProductID
where year(o.OrderDate) = @anio
order by count(o.ShippedDate)
end
go

exec Totalventasbyyear '1996'

select * from Orders

--22--febrero


