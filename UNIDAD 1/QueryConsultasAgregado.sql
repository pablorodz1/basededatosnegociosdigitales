-- Consultas de agregado.
-- Caracteristicas principales es que devuelven un solo registro.


-- Top y Percent

-- slecciona las primeras 10 ordenes de compra

use NORTHWND

select top 10 * from orders
order by orderID DESC

select top 10 CustomerID as 'Numero de cliente',
OrderDate as 'Fecha de Orden', ShipCountry as 'Pais de Entrega'
from Orders
order by OrderID desc

-- seleccionar el 50% de los registros

select top 50 percent * from Orders

select top 25 percent * from Orders

-- seleciconar los primeros tres clientes de alemania


select top 3 * from Customers
where Country = 'Germany'

select top 3 CompanyName as 'Cliente',
country as pais, address as direccion
from Customers
where Country = 'Germany'

-- seleccionar el producto con el predio mayor

select * from Products
order by UnitPrice Desc

-- Muestra el precio mas alto de los productos (max)

select max(UnitPrice) as 'Precio Maximo' from Products


-- mostrar el precio minimo de los productos

select min(UnitPrice) as 'Precio Minimo' from Products

-- seleccionar todas las ordenes de compra

select * from orders

-- seleccionar el numero total de ordenes

select count(*) as 'total de ordenes' from orders

select count(ShipRegion) as 'total de ordenes' from orders

-- seleccionar todas aquellas ordenes donde la region de envio
-- no sea null

select count(*) as 'envios' from Orders
where ShipRegion is not null

-- seleccionar de forma ascendente los productos por precio

select * from Products
order by UnitPrice

-- seleccionar el numero de precios de los productos

select count(DISTINCT UnitPrice) as 'Precio Productos' from Products

-- seleccionar todos los diferentes paises de los clientes

select count(distinct country) as 'numero de paises' from Customers

-- seleccionar la suma totoal de cantidades de las ordenes de compra

select sum(quantity) from [Order Details]

select * from [Order Details]
-
-- seleccionar todos los registros de orders details calculando su importe
-- (campo calculado)

SELECT *, (quantity * UnitPrice) AS 'importe'
FROM [Order Details]

-- seleccionar el total en dunero que ha vendido la empresa

select sum(UnitPrice) as 'total de venta' from [Order Details]



