use NORTHWND

--Realizar un SP que calcule las ventas totales hechas por cada empleado por año 
-- el sp debe solicitar el nombre del empleado, ademas de un año inicial y un año final
create proc Ventapclieteaño
@emploname varchar (50), @añoincial int, @añofinal int 
AS
begin
select em.FirstName + ' ' + em.LastName as 'Nombre del empleado' , year(o.OrderDate) as 'año', sum(od.Quantity * od.UnitPrice) as 'total de Ventas'
from Orders as o
inner join Employees as em
on em.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on od.ProductID = p.ProductID
where year(o.OrderDate) between @añoincial and @añofinal and em.FirstName + ' ' + em.LastName = @emploname
group by em.FirstName, em.LastName, YEAR(o.OrderDate)
order by em. FirstName, em.LastName, YEAR(o.OrderDate)
end
go

exec Ventapclieteaño 'Andrew Fuller', 1995, 2000

--sp que Muestre el precio
--promedio de los productos dentro de cada categoría, incluyendo solo aquellas
--categorías cuyo precio promedio de producto supere el precio enviado en el store procedure

create proc totalventassiesmayor
@precioin int 
AS
begin
select em.FirstName + ' ' + em.LastName as 'Nombre del empleado' , year(o.OrderDate) as 'año', sum(od.Quantity * od.UnitPrice) as 'total de Ventas'
from Orders as o
inner join Employees as em
on em.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on od.ProductID = p.ProductID
where year(o.OrderDate) between @añoincial and @añofinal and em.FirstName + ' ' + em.LastName = @emploname
group by em.FirstName, em.LastName, YEAR(o.OrderDate)
order by em. FirstName, em.LastName, YEAR(o.OrderDate)
end
go

select * from Employees
