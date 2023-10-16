create database cineUno

Use cineUno

create table tarifa(
	idTarifa int identity (1,1) primary key not null,
	nombreCine varchar (100) not null,
	valor decimal,
	valorProm double
)

create table pelicula(
	idPelicula int identity (1,1) primary key not null,
	titulo varchar (100) not null,
	elenco varchar (100) not null,
	clasificacion varchar (100) not null,
	genero varchar (100) not null
	)

create table cine(
	idCine int identity (1,1) primary key not null,
	sala varchar (100) not null,
	telefono varchar (100) not null,
	horario varchar (100) not null,
	direccion varchar (100) not null
	)

create table cineP(
	idPelicula int not null,
	idCine int not null
	)

alter table cine 
add constraint idTarifaFK foreign key (


