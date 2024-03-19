--22--febrero
use NORTHWND
--crear un sp que permita insertar registros en la tabla customers
create proc InsRegistrer
@cID varchar(8), @Cname varchar(20), @country varchar(15), @city varchar(15)
AS
begin --Iniciar untramo de codigo
INSERT INTO Customers(CustomerID,CompanyName, Country, City)
VALUES(@cID, @Cname,@country, @city) 
end
go

exec InsRegistrer 'LMAT','Mamitas Puebla', 'Mexico', 'Puebla'


--crear un sp que permita eliminar registros en la tabla customers por customerid

create proc DelRegistrer
@idtodel varchar(6)
AS
begin --Iniciar untramo de codigo
delete from Customers
where CustomerID = @idtodel
end
go

exec DelRegistrer'LMAT'

--crear un sp que permita eliminar un producto de una orden dada

alter proc Delprodubyorder
@ordiddel int, @prodid int
AS
begin --Iniciar untramo de codigo
delete from [Order Details]
where OrderID = @ordiddel and ProductID = @prodid 
end
go

exec Delprodubyorder 10290, 77


--crear un sp que permita eliminar el producto de una orden y modificar stock del producto

alter proc seldelupprodu
@idord int, @proid int
AS
begin --Iniciar untramo de codigo
declare @sellquantity int
select @sellquantity = Quantity 
from [Order Details]
where OrderID = @idord and ProductID = @proid
delete from [Order Details]
where OrderID = @idord and ProductID = @proid
Update Products
SET UnitsInStock = UnitsInStock + @sellquantity 
where ProductID = @proid
end
go

exec seldelupprodu 11077, 78


select * from [Order Details]
select * from Products
select * from Orders

-- sp para agregar a tablas prueba
--orders 

-- order details
create proc onordet
@orid int, @proid int, @quanti int 
AS
begin --Iniciar untramo de codigo
INSERT INTO [Order Details](OrderID,ProductID, Quantity)
VALUES(@orid, @proid, @quanti) 
end
go

exec onordet 11077, 78, 34

alter proc pinse
@proid int
AS
begin --Iniciar untramo de codigo
Update [Order Details]
SET Quantity = 32
where ProductID = @proid
end
go

exec pinse 78
