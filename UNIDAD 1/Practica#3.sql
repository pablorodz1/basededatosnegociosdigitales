create database practica#3
go

use practica#3
go

create table cliente(
	idcliente int not null,
	nombre varchar (50) not null,
	direccion varchar (100) not null,
	telefono varchar (20) not null,
	constraint pk_cliente
	primary key (idcliente),
	constraint unique_nombre
	unique (nombre),
	constraint unique_direccion
	unique (direccion),
	constraint unique_telefono
	unique (telefono)
)
go

create table empleado(
	idempleado int ,
	nombre varchar (50) not null,
	apellidos varchar (80) not null,
	sexo char (1),
	salario decimal (10,2),
	constraint pk_empleado
	primary key (idempleado),
	constraint chk_sexo
	check (sexo='h' or sexo ='m'),
	constraint chk_salario
	check (salario>=400 and salario <=50000)
)
go

create table venta(
	idventa int not null,
	fecha date not null,
	idcliente int not null,
	idempleado int not null,
	constraint pk_idventa
	primary key (idventa),
	constraint fk_idventa_idcliente
	foreign key (idcliente)
	references cliente(idcliente),
	constraint fk_idventa_idempleado
	foreign key (idempleado)
	references empleado (idempleado)
)
go

create table producto(
	idproducto int not null,
	descripcion varchar (50),
	existencia int not null,
	precio decimal (10,2) not null,
	constraint pk_producto
	primary key (idproducto),
	constraint unique_descripcion
	unique (descripcion),
	constraint unique_existencia
	unique (existencia),
	constraint unique_precio
	unique (precio)
)
go

create table detalleventa(
	idventa int not null,
	idproducto int not null,
	cantidad int not null,
	precio decimal (10,2),
	constraint pk_detalleventa
	primary key (idventa,idproducto),
	constraint fk_detalleventa_venta
	foreign key (idventa)
	references venta (idventa),
	constraint fk_detalleventa_producto
	foreign key (idproducto)
	references producto (idproducto),
)
go
