--6 de marzo 2024
create database pruebatriggers
go

use pruebatriggers

create table productos(
idproducto int not null,
nombreProd varchar(100) not null,
existencia int not null,
preciounitario decimal(10,2) not null,
constraint pk_idproducto
primary key (idproducto),
constraint unique_nombreprd
unique (nombreProd)
)
go


create table ventas (
ventaid int not null,
fecha date not null,
idcliente int not null,
idvendedor int not null,
constraint pk_ventas
primary key(ventaid)
)


create table clientes (
idcliente nchar (5) not null,
nombre varchar(100),
ciudad varchar(20),
pais varchar(20),
constraint pk_cliente
primary key(idcliente)
)



create table vendedor(
idvendedor int not null,
nombre varchar(100) not null,
apellidos varchar(50) not null,
ciudad varchar(20),
pais varchar(20),
constraint pk_vendedor
primary key(idvendedor)
)


create table detalle_venta
(
idventa int not null,
idproducto int not null,
precioVenta decimal(10,2),
cantidad int
constraint pk_detalle_venta
primary key(idventa),
constraint fk_detalle_venta_venta
foreign key (idventa)
references ventas(ventaid),
constraint fk_detalle_venta_producto
foreign key (idproducto)
references productos(idproducto)
)

alter table ventas
add constraint fk_venta_cliente
foreign key (idcliente)
references clientes

alter table ventas
add constraint fk_venta_vendedor
foreign key (idvendedor)
references vendedor

create or alter procedure llenar_tablas_catalogo
@nombreTabla varchar(100)
as
begin
    if @nombreTabla = 'Clientes'
    begin
        insert into clientes
        select CustomerID,CompanyName,city, country
        from NORTHWND.dbo.customers
    end
	else if @nombreTabla = 'Productos'
	begin
	insert into productos
		select ProductID, ProductName, UnitsInStock, UnitPrice
		from NORTHWND.dbo.Products
end
	else if @nombreTabla = 'vendedor'
	begin 
	insert into vendedor
		select EmployeeID, FirstName, LastName, City, Country
		from NORTHWND.dbo.Employees
end
else
	begin
		print ('Nombre de la Tavla no Valido')
end
end



select * from clientes
exec llenar_tablas_catalogo'clientes'


--7 de marzo del 2024

select * from clientes
exec llenar_tablas_catalogo 'cliente'

select * from vendedor
exec llenar_tablas_catalogo 'vendedor'

select * from productos
exec llenar_tablas_catalogo 'productos'

create or alter procedure cargarventa
as
begin
insert into ventas
select OrderID, OrderDate, CustomerID, EmployeeID
from NORTHWND.dbo.orders
end

select * from ventas
exec cargarventa


create or alter procedure cargardetalleventa
as
begin
insert into detalle_venta
select OrderID, ProductID, UnitPrice, Quantity
from NORTHWND.dbo.[Order Details]
end

select * from detalle_venta
exec cargardetalleventa



update NORTHWND.dbo.Products
set UnitsInStock =120
where ProductID=77


--07 de marzo del 2024
--trigger

create trigger VerificarProducto
on clientes
after insert
as
begin
print('Se Disparo en Trigger de Insert')
end


--Insertar (Insert)
insert into clientes
values
('ABC10','Cliente Nuevo', 'Santa Maria', 'Francia')

delete from clientes
where idcliente = 'ABC10'


--Eliminar (delete)

create trigger VerificarDelete
on clientes
after delete
as
begin
print('Se Elimino en Trigger de Insert')
end

--
insert into clientes
values
('ABC10','Cliente Nuevo', 'Santa Maria', 'Francia')


delete from clientes
('ABC10', 'Cliente Nuevo', 'Santa Maria', 'Francia')



--8 de marzo 2024
--Crear un trigger

--
--Sobre detalle de venta


use pruebatriggers
create or alter trigger agregarpreciodetalleventa
on detalle_venta
for insert
as
begin
	declare @idproducto int
	declare @precio decimal (10,2)
	set @idproducto = (select idproducto from inserted)
	set @precio = (select preciounitario from productos where idproducto = @idproducto)

	update detalle_venta
	set precioVenta = @precio
	where idproducto = @idproducto

end

select * from detalle_venta

insert into detalle_venta
(idventa,idproducto, cantidad)
values ('10250', 22, 4)

select preciounitario from productos where idproducto = 22

select * from detalle_venta where idventa = '10250'

--store procidius  --


create or alter trigger agregarpreciodetalleventa
on detalle_venta
for insert
as
begin
	
	update d
	set d.precioVenta = pr.preciounitario
	from detalle_venta as d
	inner join productos as pr
	on d.idproducto = pr.idproducto
	inner join inserted i
	on i.idproducto = d.idproducto
 end


