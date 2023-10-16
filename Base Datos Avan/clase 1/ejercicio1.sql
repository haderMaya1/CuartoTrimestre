/*ACTIVIDAD: Crear una base de datos espcificando dos archivos, archivo de datos y archivo de transacciones

Esta actividad crea una base de datos llamada DB_completa en la carpeta C:\Data\, su archivo principal
contará con un tamaño inicial de 40 megabytes, un tamaño maximo de 100 megabytes y un crecimiento de 1 megabytes.

Su archivo de resgistro contara con un tamaño inicial de 5 megabytes, un tamaño maximo de 40 megabytes y un crecimiento de 10%
*/

use master

CREATE DATABASE DB_complete

ON
(NAME = DB_complete_data,
FILENAME = 'C:\data\DB_complete_data.mdf',

SIZE = 40,
MAXSIZE = 100,
FILEGROWTH = 1
)
LOG ON
(NAME = DB_complete_log,
FILENAME = 'C:\data\DB_complete_log.ldf',

SIZE = 5,
MAXSIZE = 40,
FILEGROWTH = 10%
)
GO

use DB_complete
Create table empleado
(
 codEmpleado char (6) not null primary key,
 nombre varchar (30) not null,
 apellido varchar (30) not null,
 fechaIngreso date,
 codJefe char (6) not null,
 foreign key ( codJefe) references empleado (codEmpleado)
 )

 Create table empleado1
(
 codEmpleado1 char (6) not null,
 nombre1 varchar (30) not null,
 apellido1 varchar (30) not null,
 fechaIngreso1 date,
 codJefe1 char (6) not null,
 )

 ALTER TABLE empleado1
 add constraint empleado1_pk primary key (codEmpleado1)

 alter table empleado1
 add constraint empleado1_fk foreign key(codJefe1)
 references empleado1 (codEmpleado1)


create table continente
(
	codContinente char (6) not null,
	nombreContinente varchar(60) not null,
)

create table continente1
(
	codContinente1 char (6) not null,
	nombreContinente1 varchar(60) not null,
)

create table pais
(
	codPais char (6) not null,
	nombreContinente varchar(60) not null,
	codContinente char (6) not null
)

alter table continente 
add constraint continentePk primary key (codContinente)

alter table pais
add constraint paisPk primary key (codPais)

alter table pais
add constraint paisFk foreign key(codContinente)
references continente (codContinente)