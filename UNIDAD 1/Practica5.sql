-- practica 5
-- crear una tabla que contenga un campo calculado

use Practica4

create table tblpruebacalculado(
id int not null identity(1,1),
nombre varchar(50),
precio decimal(10,2) not null,
existencia int not null,
importe as 
(precio * existencia),
constraint pk_pruebacalculo
primary key (id)
);

select * from tblpruebacalculado

insert into tblpruebacalculado
values ('chanclotas',345,4)