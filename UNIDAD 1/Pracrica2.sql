--Practica #2

create database practica2
go
use practica2
-- Crear tabla cliente
CREATE TABLE tbl_cliente (
    idcliente INT not null,
    nombre VARCHAR(100) UNIQUE,
    direccion VARCHAR(100),
    tel VARCHAR(15),
   constraint pk_cliente
	primary key(idcliente),
);

-- Crear tabla Empleado
CREATE TABLE tbl_empleado (
    idempleado int not null,
	nombre varchar(100) not null,
	apellidos varchar(100) not null,
	sexo char(1) not null,
	salario decimal(10,2) not null,
	constraint pk_empleado
	primary key(idempleado),
	constraint chk_sexo
	check(sexo='H' or sexo = 'M'),
	constraint chk_salario
	check(salario>=400 and salario<=50000)
	);

-- Crear tabla Venta
CREATE TABLE tbl_venta (
    idventa int not null,
    fecha DATE,
    idcliente INT,
    idempleado INT,
	constraint pk_venta
	primary key(idventa),
    FOREIGN KEY (idcliente) REFERENCES tblcliente(idcliente),
);
drop table tbl_venta
);

CREATE TABLE tbldetalleventa (
idventa int not null,
idempleado int not null,
cantidad int not null,
precio decimal (10,2) not null,
constraint pk_detallesventa
primary key (idventa, idempleado),
foreign key (idventa) references tblventa(idventa),
foreign key (idempleado) references tblempleado(idempleado)
);

CREATE TABLE tbl_producto
idproducto int not null,
descripcion varchar(200) not null,
existencia int not null,
precio unitario decimal (10,2) not null,
idventa int not null,
idempleado int not null,
constraint pk_producto
primary key (idproducto),
foreign key (idventa) references tblventa(idventa),
foreign key (idempleado) references tblempleado(idempleado)
);


