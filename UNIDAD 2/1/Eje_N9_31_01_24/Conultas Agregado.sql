use NORTHWND

--31 de enero

--Consultas de agregado
--Caracteristicas principales es que devuelven un solo registro

--Top y Percent

--Selecciona las primeras 10 ordenes de compra
--Top sirve para seleccionar unos cuantos

--Primeros 10 registors
select top 10 * from Orders

--Ultimos 10 registors
select top 10 * from Orders
order by OrderID desc

--Primeros 10 registros con alias (utiliza el AS despues las comillas con el nombre'es de las comillas simples')
select top 10 CustomerID as'Numero de Cliente',
OrderDate as 'Fecha de Order', ShipCountry as 'Pais de Entrega'
from Orders
order by OrderID desc

--Seleccionar el 50% de los registros
select top 50 percent * from Orders

--Seleccionar el 25% de los registros
select top 25 percent * from Orders

--EJERCICIO:
--Seleccionar los primeros 3 clientes de alemania
select top 3 * from Customers
where Country ='Germany'

select top 3 CompanyName as 'Cliente', country as pais, address as direccion
from Customers
where Country ='Germany'

--Seleccionar el producto con el mayor precio
select * from Products
order by UnitPrice desc

--Muestra el precio más alto de los productos (max)
select max (unitprice) as 'Precio Maximo'  from Products

--Muestra el precio más bajo de los productos (max)
select min (unitprice) as 'Precio Maximo'  from Products

--Seleccionar todas las ordenes de compra
select * from Orders

--Seleccionar el numero total de ordenes (count) (funciones de agragasdo)
select count (*) as 'Total de Ordenes' from Orders

select count (ShipRegion) as 'Total de Ordenes' from Orders

--Seleccionar todas aquellas ordenes donde la region de envio no sea null
select * from Orders
where ShipRegion is not null

select count (*) from Orders
where ShipRegion is not null

--Seleccionar de forma ascendente los productos por precio
select * from Products
order by UnitPrice

--Seleccionar el numero de precio de los productos sin que se repitan
select count (distinct UnitPrice) as 'precios' from Products

--Contar todos los diferentes paises de los clientes
select count (distinct Country) as 'Numero de Paises' from Customers

--count cuenta
--sum suma

--Seleccionar la suma total de cantidades de las ordenes de compra
select sum (Quantity) from [Order Details]

select * from [Order Details]

--Seleccionar todos los registros de order detail calculando su im´porte
--Campo Calculado

select *,(UnitPrice*Quantity) as 'importe' from [Order Details]

--Seleccionar el total en dinero que ha vendido la empresa utilizando el sum()
select sum (UnitPrice*Quantity) as 'Ventas Total' from [Order Details]

--Seleccionar el total del producto Chang
Select sum(UnitPrice * Quantity) as total
from [Order Details]
where ProductID = 2

--Seleccionar el promedio de los precios de los productos (avg)
select avg (UnitPrice) from Products

--Seleccionar el promedio y el total de los productos 41, 60 y 31
select * from [Order Details]

select sum(UnitPrice * Quantity) as total,
avg (UnitPrice * Quantity) from [Order Details]
where ProductID in (31, 41, 60)

--Lo mismo pero más largo
select sum(UnitPrice * Quantity) as total
from [Order Details]
where ProductID = 41 or ProductID = 60 or ProductID = 31

--Seleccionar el numero de ordenes realizadas entre 1996 y 1997
select count (*) from Orders
where OrderDate between '1996-01-01' and OrderDate <='1997-01-01'

select year (OrderDate) from Orders


select count (*) from Orders
where YEAR (OrderDate)>='1996' and OrderDate<='1997'

select count (*) from Orders
where YEAR (OrderDate) in ('1996', '1997')

select count (*) from Orders
where YEAR (OrderDate) between '1996' and '1997'

--02-02-24
--Instrucción grup by
--Seleccionar el numero de clientes agrupados por pais

select Country, count (*) as 'Total de Clientes' from Customers
group by Country
order by 1 desc

--Seleccionar el numero de ordenes enviados por el shippervia

select * from Orders

select shipvia, count (*) as 'Total ShiperVia' from Orders
group by shipvia
order by 1 desc

select count (*) as 'Nombre Compania', count (*) as total
from Orders as o
inner join Shippers as s
on o.ShipVia = s.ShipperID
group by s.companyname

--07-02
--Seleccionar todas las ordenes de compra mostrando las fechas ordenadas de compra
--nombre del shipper y el nombre al cliente al que se le vendio (inner join)

select c.CompanyName as 'Cliente', 
o.OrderDate as 'Fecha Orden',
s.CompanyName as 'Nombre Flete'
from
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join Shippers as s
on o.ShipVia = s.ShipperID

--Seleccionar el nombre del producto y su categoria

select productName from
Categories as c
inner join
Products as p
on c.CategoryID = p.CategoryID

--Listar el nombre del cliente, la fecha de la orden y los nombres de los productos que fueron vendidos

select c.CompanyName, o.OrderDate, p.ProductName
from
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID

--Seleccionar el nombre completo de los empleados, los mombres de los productos
--que vendio y la cantidad de ellos y calculas el importe

select CONCAT(e.FirstName, '', e.LastName)
as 'Nombre Comleto', p.ProductName as 'Descripción'
od.Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe'
from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID


--Seleccionar el nombre completo de los empleados, los mombres de los productos
--que vendio y la cantidad de ellos y calculas el importe
--pero solo los enviados a suiza, alemania y francia

select CONCAT(e.FirstName, '', e.LastName)
as 'Nombre Comleto', p.ProductName as 'Descripción'
od.Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe'
from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.shipcountry in ('france','germany','switzerland')

--Seleccionar el nombre completo de los empleados, los mombres de los productos
--que vendio y la cantidad de ellos y calculas el importe
--pero solo los enviados a suiza, alemania y francia
--agrupados por la cantidad total de ordenes hechas por los empleados

select CONCAT(e.FirstName, '', e.LastName)
as 'Nombre Comleto', count (*) as 'total ordenes'
od.Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe'
from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.shipcountry in ('france','germany','switzerland')
group by CONCAT(e.FirstName, '', e.LastName)

--Seleccionar el total de dinero que se le han vendido a cada
--uno de los clientes de 1996

select companyName as 'Cliente',
sum(UnitPrice * Quantity) as 'Total de venta'
from
[Order Details] as od
inner join
Orders as o
on od.OrderID = o.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID
where year(o.OrderDate) = '1996'
group by companyName
order by 2 desc

--Seleccionar el total de dinero que se le han vendido a cada
--uno de los clientes de cada año

select c.CompanyName as 'Cliente', o.OrderDate as 'Años Transcurridos',
sum(od.UnitPrice * od.Quantity) as 'Total de ventas'
from
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on od.OrderID = o.OrderID
where year (o.OrderDate) = '1996'
group by CompanyName, o.OrderDate 
Order by 2 desc

--Seleccionar el importe total vendido por categoria
--de producto

select c.CategoryName as 'Categoria', p.ProductName as 'Nombre producto',
sum(od.UnitPrice * od.Quantity) as 'Total de ventas'
from
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on od.OrderID = o.OrderID
where year (o.OrderDate) = '1996'
group by c.CategoryName , p.ProductName
Order by 2 desc

--09-02
--De la consulta anterior, solamente mostrar aquello totales
--que son mayores a 20,000

select c.CategoryName,p.ProductName,
sum(od.Quantity * od.UnitPrice) as 'total'
from Categories as c
inner join Products as p
on p.CategoryID = c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName, p.ProductName
having sum(od.Quantity * od.UnitPrice)
order by 2 Desc

--Seleccionar el numero de clientes por cada pais, en donde solo sean
--incluidos los que tengan más de 5 clientes y ordenados de forma descendente
--por el numero de clientes

select country, count (*) from Customers
where country not in ('Brazil')
group by country
having count (*) > 5

--Seleccionar los clientes que han realizado pedidos en más de un país
--customerID, nombre cliente, shipcountry, suma total de las ordenes

