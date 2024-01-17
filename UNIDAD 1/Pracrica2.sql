--Practica #2

create database practica2
go

CREATE TABLE tblcliente (
    idcliente INT,
    nombre VARCHAR(100) UNIQUE,
    direccion VARCHAR(100),
    tel VARCHAR(15),
    CONSTRAINT pk_idcliente PRIMARY KEY (idcliente)
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
    constraint pk_idventa
	primary key(idventa),
    fecha DATE,
    idcliente INT,
    idempleado INT,
    FOREIGN KEY (idcliente) REFERENCES tblcliente(idcliente),
    FOREIGN KEY (idempleado) REFERENCES tblempleado(idempleado)
);