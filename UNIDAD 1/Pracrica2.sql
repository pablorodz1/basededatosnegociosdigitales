--Practica #2

create database practica2
go
use practica2
-- Crear tabla cliente
CREATE TABLE tblcliente (
    idcliente INT not null,
    nombre VARCHAR(100) UNIQUE,
    direccion VARCHAR(100),
    tel VARCHAR(15),
   constraint pk_cliente
	primary key(idcliente),
);

-- Crear tabla Empleado
CREATE TABLE tblempleado (
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
CREATE TABLE tblventa (
    idventa int not null,
    fecha DATE,
    idcliente INT,
    idempleado INT,
	constraint pk_venta
	primary key(idventa),
    FOREIGN KEY (idcliente) REFERENCES tblcliente(idcliente),
    FOREIGN KEY (idempleado) REFERENCES tblempleado(idempleado)
);