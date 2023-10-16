/*TRIGGUERS, son similares a los procedimientos almacenados, y estan relaconados
a una tabla o vista de tal manera que solo se activan cuando ocurre una acción sobre
la tabla que puede ser un insert, delete, update.

--AFTER. Ocurren después que haya pasado un insert, pdate, delete, sobre
el objeto, es decir:
sobre la tabla o la bista. Para almacenar el historial
*/

use practica1

--Creamos una tabla que llamaremos, HistoriaActividad

create table historyActivity
(
	fecha date,
	descripcion varchar (500),
	usuario varchar (100)
)

/*crear un trigger que el momeno de eliminar
un registro de la tabla empleado, 
inmediatamente registre historyActivity muestre
en la tabla historial la fecha de descripcion
y usuario que realizo esa eliminación*/

create trigger tr_empleado_eliminado
on empleado
after delete --porque se va a eliminar y after, para que se almacene historial en descripción.
as
insert into historyActivity (fecha,descripcion,usuario)
	   values (GETDATE(),'Eliminacion de Empleado',user)

--Consultar la tanbla historyActivity
select * from historyActivity
select * from empleado

--ahora eliminar un registro de departamento
delete empleado where idDepartamento=33

--se generan dos resultados de la instrucción ina fila afectada
--por eliminar y otra por el trigger

select * from historyActivity--ahora ya tenemos la información de la eliminación en el historial

/*cuando eliminamos datos se crea una tabla temporal llamada
delete que contiende los datos eliminados. Creamos na tabla ifual a empleado*/

create table [dbo].[empleadoEliminado](
	[id_empleado][int] not null,
	[id_departamento][int] not null,
	[nombre] [varchar](20) not null
)

/*ahora modificar el triggers, con el fin de llevar los elementos
borrados y copiarlos en la nueva tabla por
medio de la tabla delete*/

alter trigger tr_empleado_elimimado
	on empleado
	after delete
	as
insert into [empleadoEliminado]
select * from deleted

select * from empleado
--ahora eliminar otro registro de empleado

/*ejemplo de trigger con instead of, esta cancelan la accion descencadenado,
es decir si la invocaciòn del trigger fue hecha por un insert, update o delete
este insert, delete or update es cancelado para hacer una nueva acciòn
establecida en el trigger*/

--Estos trigger surgen a partir de una vista dividida
--Vamos a unir dos tablas Clientes y proveedores como ejemplos
use factura
--unir las tablas
select * from clientes
select * from proveedores

--Ahora hacemos la siguiente vista uniendo dos vistas
create view Directorio
as
select NombreCompañia, NombreContacto, Pais from clientes
union all
select NombreCompañia,NombreContacto,Pais from proveedores

select * from Directorio
--Eliminar la vista
drop view Directorio

--Si queremos insertar un registro a directorio
insert into Directorio (NombreCompañia, NombreContacto, Pais)
values ('TEST,s.s.','Juan Perez', 'Colombia')
/*El no sabra a cual de las dos tablas insertar
debera insertar por lo que devolvera un error, para ello tenemos que modificar
la vista dandole el nombre de las tablas 'Cliente' as Tipo y 'Proveedor' as Tipo.
en un select*/
alter view Directorio
as
select NombreCompañia, NombreContacto, Pais, 'Clientes' as Tipo from clientes
union all
select NombreCompañia, NombreContacto, Pais, 'Proveedores' as Tipo from proveedores

--ahora volvemos a consultar
select * from Directorio

--ahora para insertar debemos decirle hacia quien queremos hacer la inserciòn.
insert into Directorio(NombreCompañia, NombreContacto, Pais)
values ('TEST,s.s.','Juan Perez', 'Colombia','Clientes')
/*Igual a de devolver un error porque requiere un trigger de tipo instead of*/
--Ahora el trigger de tipo instead of

create trigger insert_Directorio
on Directorio
instead of insert
as
--Necesitamos llave primaria de cliente que es idCliente
insert into clientes(idCliente, NombreCompañia, NombreContacto, Pais)
--Usamos las primeras letras de nombreCompañia para usarlo como idCliente
select substring (NombreCompañia,1,5),NombreCompañia, NombreContacto, Pais from inserted
where Tipo ='Clientes'
--No necesita clave primaria porque es automatico
insert into proveedores(NombreCompañia,Nombrecontacto,Pais)
select NombreCompañia, NombreContacto, Pais from inserted
where Tipo='Proveedores'

--Para probarlo haremos la primera inserccion, debe llevar el campo Tipo
insert into Directorio (NombreCompañia, NombreContacto, Pais, Tipo)
values ('TEST,s.s.','Juan Perez', 'Colombia','Clientes')

--ahora si se ejecuta el trigger sobre una vista dividida
--revisar la tabla clientes, y la tabla proveedores donde nombre compañia sea TEXT, s.s.

select * from clientes where NombreCompañia = 'TEXT,s.s.' --aqui se agrupa 
select * from proveedores where nombreCompañia = 'TEXT,s.s.'--aca no se agrega

drop view Directiorio
drop trigger insert_Directorio


/*Crear una base de datos, donde las tiendas tengan una sede que controle los registros de cada tienda
esto lo podemos hacer trigger ( union ) de todas las tablas para almacenar registros, y mostrarlos por
medio de una vista*/

create database inventario
use inventario

create table tienda1
(
	nEnvio int,
	codProd varchar (15),
	nombre varchar (100),
	cantidad int)
go
create table tienda2
(
	nEnvio int,
	codProd varchar (15),
	nombre varchar (100),
	cantidad int)
go
create table tienda3
(
	nEnvio int,
	codProd varchar (15),
	nombre varchar (100),
	cantidad int)
go

--Creando vistas
create view sedeCentral
as
select nEnvio, codProd, nombre, cantidad from  tienda1
union all
select nEnvio, codProd, nombre, cantidad from  tienda2
union all
select nEnvio, codProd, nombre, cantidad from  tienda3

--Alterando vista, para poder insertar datos
alter view sedeCentral
as
select nEnvio, codProd, nombre, cantidad, 'tienda1' as tipo from tienda1
union all
select nEnvio, codProd, nombre, cantidad, 'tienda2' as tipo from tienda2
union all
select nEnvio, codProd, nombre, cantidad, 'tienda3' as tipo from tienda3

--Creando trigger tipo instead of
create trigger insert_sedeCentral
on sedeCentral
instead of insert
as
--Necesitamos llave primaria de tienda
insert into tienda1(nEnvio, codProd, nombre, cantidad)
--Usamos las primeras letras de nombreCompañia para usarlo como idCliente
select nEnvio, codProd, nombre, cantidad from inserted
where tipo ='tienda1'
--No necesita clave primaria porque es automatico
insert into tienda2(nEnvio, codProd, nombre, cantidad)
select nEnvio, codProd, nombre, cantidad from inserted
where tipo ='tienda2'
insert into tienda3(nEnvio, codProd, nombre, cantidad)
select nEnvio, codProd, nombre, cantidad from inserted
where tipo ='tienda3'
--Insertando registros 
insert into sedeCentral(nEnvio, codProd, nombre, cantidad, tipo)
values (1,'AA', 'Arroz',25 , 'tienda3')

select * from tienda3
select * from sedeCentral
use inventario
insert into tienda1(nEnvio, codProd, nombre, cantidad)
values(1,'AA11', 'Arroz', 25)

insert into tienda2(nEnvio, codProd, nombre, cantidad)
values(1,'AA11', 'Arroz', 25)

insert into tienda3(nEnvio, codProd, nombre, cantidad)
values(1,'AA11', 'Arroz', 25)