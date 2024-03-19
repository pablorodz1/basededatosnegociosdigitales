-- Consultas simples con select - SQL LMD
use NORTHWND
-- Seleccionar todos los clientes
-- * significa seleccionar todos los campos

select * from Customers

-- seleccionar el nombre del cliente,nombre del contacto y  ciudad

select CompanyName, ContactName, City from Customers

-- Seleccionar todos los paises de los clientes

Use NORTHWND

select country from Customers

-- distinguir en un campo.

select distinct country from Customers

-- seleccionar el numero de paises de donde son mis clientes (Cont)
-- count te da valores especificos numericos.

select count(*) from customers

select count(country) from customers

select count(distinct country) from customers

-- Uso del where, seleccionar el cliente que tenga un id Anton

select * from customers
where CustomerID = 'ANTON'

-- Seleccionar todos los clientes de mexico
select * from Customers
where Country = 'Mexico'

--Seleccionar todos los registros de los clientes de berlin
select * from Customers
where City = 'Berlin'

-- Order by
-- Seleccionar todos los prodructos ordenados por precio

select * from Products
order by UnitPrice

-- Seleccionar todos los productos ordenados por el precio de mayor a menor

select * from Products
order by UnitPrice DESC

-- Seleccionar todos los productos alfabeticamente
select * from Products
order by ProductName ASC

-- seleccionar todos los clientes por pais y dentro por nombre de forma ascendente

select country,CompanyName, city from Customers
order by country DESC, CompanyName asc

-- seleccionar todos los clientes de españa y que su nombre comience con G
use NORTHWND
select * from Customers
where Country = 'Spain' and CompanyName like 'G%'

-- Seleccionar todos los clientes de berlin alemania con un codigo postal mayor a > 1200

select * from Customers
where city ='Berlin' and Country = 'Germany' and PostalCode > 1200

-- seleccinar todos los clientes de españa y que su nombre comience con G o con R

select * from Customers
where Country = 'Spain' and (CompanyName like 'G%' OR CompanyName like 'R%');

-- Clausula OR
-- seleccionar todos los clientes de alemania o españa
-- Al ponerle el OR va mostrar los que sean alemania o españa
-- si pusieramos and va buscar que sean de los dos paises a la vez.

select * from Customers
where Country = 'Germany' OR Country = 'Spain'

-- seleccionar todos los clientes de berlin o de noruega que comience su nombre con g

select * from Customers
where Country = 'Norway' or City = 'Berlin' or CompanyName like 'G%'

-- seleccionar solo los clientes que no son de españa
use NORTHWND
select * from Customers
where not country = 'Spain'

-- Seleccionar todos los productos que no tengan un precio entre 
-- 18 y 20 DSL

select * from Products
where not (UnitPrice>=18 and UnitPrice<= 20)


-- con el between

select * from Products
where UnitPrice not between 18 and 20

-- Seleccionar todos los clientes que no son de paris o de londres

Select * from Customers
where not (city = 'Paris' or City='London')

select * from customers
where city in('Paris', 'london')

select * from customers
where city not in('Paris', 'london')

-- Seleccionar todos los productos que no tienen precios mayores a 30
-- Seleccionar todos los productos que no tienen precios menores a 30

select * from Products
where not UnitPrice>30

select * from Products
where not UnitPrice<30

-- Operador LIKE

-- seleccionar todos los clientes que comienzan con la letra A

select * from Customers
where CompanyName like 'A%'

-- seleccionar todos los clientes que finalizan con la palabra es

select * from Customers
where CompanyName like '%es'

-- seleccionar todos los clientes que contengan la palabra mer

select * from Customers
where CompanyName like '%mer%'

-- Operador Wildcard_
-- Seleccionar todos los clientes con una ciuadad que comience con cualquier caracter seguido
-- de la palabra ondon

select * from Customers
where City like '_ondon%'

-- Seleccionar todos los clientes con una ciudad que comience con L y 
-- seguido de tres caracteres y que termine con la palabra on

select * from Customers
where City like '[L___on'

-- seleccionar todos los productos que comiencen con la letra a_ e_ o t

select * from Products
where ProductName like '[act]%'

-- seleccionar todos los productos que comiencen con la letra b a la g

select * from Products
where ProductName like '[b-g]'

-- seleccionar todos los clientes de alemania, españa y reino unido

select * from Customers 
where Country in ('Germany', 'Spain', 'UK')

-- seleccionar todos los clientes que no son de alemania, españa, reino unido

select * from Customers
where Country not in ('Germany', 'Spain','UK')

-- Instruccion between
-- seleccionar todos los productos con nu precio, entre 10 y 20 dolares

select * from Products
where UnitPrice between 10 and 20

-- other from

select * from Products
where UnitPrice>=10 and UnitPrice<=20

-- Alias de columnas y alias de tablas
-- seleccionar el nombre del producto, su stock y su precio

select ProductName as 'Nombre del Producto',
unitsInStock as existencia, UnitPrice precio from Products

-- Alias de tablas

select ProductName as 'Nombre del Producto',
UnitsInStock as Existencia, UnitPrice as 'Precio' from Products as P
inner join [Order Details] as od
on p.ProductID = od.ProductID

-- seleccionar el total en dinero que ha vendido la empresa

select sum(UnitPrice*Quantity) as 'Total' from [Order Details]

-- seleccionar el total de venta del producto chang

select sum(UnitPrice * Quantity) as Total
from [Order Details]
where ProductID = 2

-- Seleccionar el promedio de los precios de los productos

use NORTHWND

select AVG(UnitPrice) as 'Promedio Productos'
from products

-- seleccionar el promedio total y el total de venta de prodcuctos 41, 60 y 31
select sum(UnitPrice*Quantity) as 'total', 
avg(UnitPrice*Quantity)
from [Order Details]
where ProductID in (41,60,31)

select sum(UnitPrice*Quantity) as 'Total', avg(UnitPrice*Quantity)
from [Order Details]
where ProductID = 41 or ProductID=60 or ProductID=31

--	Consultas de BD del dia 09 de febrero 2024.

-- selecciona el numero de clientes por cada pais, en donde solo sean
-- incluidos los que tengan mas de 5 clientes y ordenados de forma descendente
-- por el numero de clientes

SELECT country, COUNT(*) AS numero_clientes
FROM Customers
GROUP BY Country
HAVING COUNT(*) > 5
ORDER BY numero_clientes DESC;










