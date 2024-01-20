-- #PRACTICA 4

create database Practica4

create table tblcategoria(
categoriaid int not null,
numero int not null,
descripcion varchar(100) not null,
constraint pk_categoria
primary key (categoriaid, numero),
);

create table producto(
productoid int not null,
descripcion varchar(100) not null,
precio decimal(10,2) not null,
stock int not null,
categoriaid int not null,
numeroinventario int not null,
constraint pk_producto
primary key(productoid),
constraint fk_producto_categoria
foreign key(categoriaid,numeroinventario)
references tblcategoria(categoriaid,numero)
);
