use NORTHWND

Declare @Numero int
Set @Numero = 10
if @Numero>5
begin
Print ('El numero es mayor a 5')
end
else
begin
Print('El numero es menor a 5')
end
go


--Realizar codigo transact para determinar si una persona tiene la edad para beber alcohol.
--El codigo debe tener una variable que determine la edad minima permitida y otra variable con la edad de la persona.

Declare @AgePeo int
Set @AgePeo = 12
if @AgePeo >=18
begin
Print ('Es mayor de edad, puede vever alcohol')
end
else
begin
Print('Es menor de edad')
end
go


--Seleccionar una evaluación
--Si es mayor igual (>=) a 90 imprimir el A
--Si es mayor igual (>=) a 80 imprimir el B
--Si es mayor igual (>=) a 70 imprimir el C
--Si es mayor igual (<=) a 69 imprimir el d

declare @IntePers float
set @IntePers = 79.5
if @IntePers <= 100 and @IntePers >= 90.0
	begin
	print ('Imprimiendo una A')
end

else if @IntePers >= 80.0 and @IntePers < 90.0
	begin
	print ('La calificacion es una B')
end

else if @IntePers >= 70.0 and @IntePers < 80.0
	begin
	print ('La calificacion es una C')
end
else 
	begin
	print ('La calificacion es Reprobaria')
end


--Solicitar un salario

--Si es mayor (>) a 4000, Calcular incremento 20%
--Si es mayor (>) a 5000, Calcular incremento 30%
--Si es mayor (>) a 0000, Calcular incremento 0%
--Print (Aumento)

declare @salary float
set @salary = 5689
declare @bono float
declare @salaryfin float
if @salary >= 5000 
begin 
	set	@bono = @salary * 0.30
	set @salaryfin = @salary + @bono
	print ('el bono de salario del empleado es de 30%  ' + cast(@bono as varchar(20)) + ' ' + 'el salario completo es de: ' + cast(@salaryfin as varchar(20))) 
end
else if @salary >= 4000 
begin 
	set	@bono = @salary * 0.20
	set @salaryfin = @salary + @bono
	print ('el bono de salario del empleado es de 20%  ' + cast(@bono as varchar(20)) + 'el salario completo es de: ' + cast(@salaryfin as varchar(20))) 
end
else 
begin
	print('El empleado no tiene ningun tipo de bono, su salario sigue siendo de: ' + cast(@salary as varchar(20)))
end

--Generar un SP donde se compare si un producto tiene mas de 100 unidades en stock
-- incrementar su precio en un 10% de lo contrario incrementarlo en 20%

use NORTHWND

alter proc incrementproduct
@idtoproduct int 
AS 
begin --Iniciar untramo de codigo
declare @prodstock int
declare @incremento int
declare @prodincre int
select @prodstock = UnitsInStock
from Products
where ProductID = @idtoproduct
if @prodstock >= 100
	begin
	set @incremento = @prodstock * 0.10
	set @prodincre = @prodstock + @incremento
	Update Products
	SET UnitsInStock = UnitsInStock + @incremento  
	where ProductID = @idtoproduct
	end
else 
	begin
	set @incremento = @prodstock * 0.20
	set @prodincre = @prodstock + @incremento
	Update Products
	SET UnitsInStock = UnitsInStock + @incremento  
	where ProductID = @idtoproduct
	end
end
go

exec incrementproduct 78

select * from Products

--sp con parametros de salida
use NORTHWND

declare @resultad int = 0
declare @valor int = 10

set @resultad = @valor + 10

print('El resultado es: ' + cast(@resultad as varchar(20)))

-- Sp
--01-marzo

alter proc sumad10
@valor int,
@val2s int
AS
declare @resultlet int -- declaracion de variables
begin
set @resultlet = @valor + @val2s -- suma dentro de la declaracion

print('El resultado es: ' + cast(@resultlet as varchar(20)))
end

exec sumad10 75, 50


-- version 2 SPv2
create proc sumad10v2
@valor int, @resultad int output
AS
	set @resultad = @valor + 10 -- suma dentro de la declaracion

declare @result int
exec sumad10v2 @valor = 50, @resultad = @result output
print('El resultado es: ' + cast(@result as varchar(20)))

-- hacer una suma y una resta

alter proc sumandrest
@valorsum int, @resultsum int output, @valorrest int, @resultrest int output   
AS
	set @resultsum = @valorsum + 10 -- suma dentro de la declaracion
	set @resultrest = @valorrest - 35

declare @resultsuma int
declare @resultresta int
exec sumandrest @valorsum = 50, @valorrest = 89, @resultsum = @resultsuma output, @resultrest = @resultresta output
print('El resultado de la suma es: ' + cast(@resultsuma as varchar(20)) + ' ' + 'Y el resultado de la resta es: ' + cast(@resultresta as varchar(20)))

