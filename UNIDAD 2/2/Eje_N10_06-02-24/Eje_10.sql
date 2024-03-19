--Consultas con Joins
--inner join

--Seleccionar el numero de orden, nombre del cliente y la fecha de la orden

use NORTHWND

select OrderID, CompanyName, OrderDate
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID


--Mostrar el numero de ordenes de cada cliente mostrando el nombre de la compañia

select CompanyName, count (*) as 'Total de Pedido'
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID
group by CompanyName

--

select CompanyName, count (*) as 'Total de Pedido'
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID
group by CompanyName
order by 2 desc

--Seleccionar el numero de producto, nombre del producto y nombre categoria
--ordenados de forma ascendente con respecto al nombre de la categoria

select ProductID, ProductName, CategoryID as 'Pedidos'
from Products
inner join Products as o