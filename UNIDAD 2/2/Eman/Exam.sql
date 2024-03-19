 use NORTHWND

 --2
 select p.ProductName, p.UnitsInStock, (od.) from
 Products as p
 inner join as od
 on od.ProductID = p.ProductID

 

 --3 

 --seleccionar el total de ordenes realizadas por empleados
 --mostrando solamente los que han vendido mas de 50m prdenes
select concat(e.FirstName, ' ', e.LastName) as fullname,
count(o.OrderID) as 'Total'
from Orders as o
inner join Employees as e
on e.EmployeeID = o.EmployeeID
group by CONCAT (e.FirstName, ' ', e.LastName)
having count (o.OrderID) > 50

--otro

select concat(e.FirstName, ' ', e.LastName) as fullname,
count(o.OrderID) as 'Total'
from Orders as o
inner join Employees as e
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = od.OrderID
group by CONCAT (e.FirstName, ' ', e.LastName)
having count (o.OrderID) > 50


---

select count(distinct od.ProductID) as 'Total',
from Orders as o
inner join Employees as e
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = od.OrderID
group by CONCAT (e.FirstName, ' ', e.LastName)
having count (o.OrderID) > 50

--4

select p.ProductName, count (od.OrderID)
from [Order Details] as od
right join
Products as p
on od.ProductID = p.ProductID
group by p.ProductName
having count (od.ProductID) >=1
order by 2 desc

alter view vistaconsulta1
as
select c.CompanyName as 'Nombre Cliente'
,min(o.OrderDate) as 'Fecha Primera compra',
sum(od.Quantity * od.UnitPrice) as 'Total de compras del cliente'
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Customers as c
on c.CustomerID = o.CustomerID
group by c.CompanyName
having sum(od.Quantity * od.UnitPrice) >1000

select * from vistaconsulta1
where[Nombre Cliente] = 'Vaffeljernet'

select sum([Total de compras del cliente]) as Totalcom
from vistaconsulta1
where year([Fecha Primera compra]) = '1997'