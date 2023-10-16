create database boletas

use boletas

create table distrito(
	codDistrito int identity (1,1) primary key not null,
	descripcionDistrito varchar (300) not null
)


create table tipoProducto(
	codTipoProducto int identity (1,1) primary key not null,
	descripcionProd varchar (300) not null
)

create table producto(
	codProd int identity (1,1) primary key not null,
	descripcionProd varchar (300) not null,
	precioProd decimal,
	stockActProd decimal,
	stockMinProd decimal,
	codTipoProducto int,
	constraint codTipoProductoFk foreign key (codTipoProducto) references tipoProducto(codTipoProducto)

)

create table cliente(
	codCliente int identity (1,1) primary key not null,
	dirrecionClie varchar (300) not null,
	telefonoClie varchar (50) not null,
	correoClie varchar (100) not null,
	web varchar (500) not null,
	codDistrito int,
	constraint codDistritoFk foreign key (codDistrito) references distrito(codDistrito)
)

create table clientePerJuridica(
	codCliente int,
    codClienteFk1 int unique foreign key (codCliente) references cliente(codCliente),
	razonSocial varchar (300)  not null,
	rutCliente varchar (300) not null,
	contactoCliente varchar (300) not null,
	codCargoCliente varchar (300) not null
)

create table clientePerNatural(
	codCliente int,
	codClienteFk2 int unique foreign key (codCliente) references cliente(codCliente),
	nombreCliente varchar (100) not null,
	apePaterCliente varchar (100) not null,
	apeMaterCliente varchar (100) not null
)

create table empleado(
	codEmpleado int identity (1,1) primary key not null,
	nombre varchar (100) not null,
	apePaterEmpleado varchar (300) not null,
	apeMaterEmpleado varchar (300) not null,
	fechaNacimiento varchar (300) not null,
	direccionEmpleado varchar (300) not null,
	telefono varchar (300) not null,
	correoEmpleado varchar (300) not null,
	fechaIngreso date,
	codSupervisor int not null,
	codDistrito int,
	constraint codDistritoFk1 foreign key (codDistrito) references distrito(codDistrito),
	constraint fk_empleado foreign key (codEmpleado) references empleado(codEmpleado)
)

create table boleta(
	codBoleta int identity (1,1) primary key not null,
	fechaBoleta date,
	estadoBoleta varchar (100) not null,
	codEmpleado int,
	constraint codEmpleadoFk foreign key (codEmpleado) references empleado(codEmpleado),
	codCliente int,
	constraint codClienteFk3 foreign key (codCliente) references cliente(codCliente)
)

create table detalleBoleta(
	cantidad int not null,
	precioVenta decimal,
	codBoleta int,
	codProd int,
	constraint codBoletaFk foreign key (codBoleta) references boleta(codBoleta),
	constraint codProductoFk foreign key(codProd) references producto(codProd)
)
