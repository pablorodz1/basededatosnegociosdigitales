-- SQL -LDD	

-- Crear la base de datos bdentornosvip

create database bdentornosvip
go 

-- cambiar de base de datos

USE bdentornosvip
go

-- crear tabla categoria

create table tblcategoria (
	categoriaid int not null,
	descripcion varchar(100) not null,
	constraint pk_tblcategoria
	primary key(categoriaid),
	constraint unique_descripcion
	unique(descripcion)

)
go