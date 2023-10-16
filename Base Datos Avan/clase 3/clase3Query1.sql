use master
create database practica1
create table departamento(
	idDepartamento int primary key,
	nombre varchar (30)
)

create table empleado(
	idEmpleado int primary key,
	idDepartamento int,
	nombre varchar (30),
	constraint idDepartamentoFk foreign key (idDepartamento) references departamento (idDepartamento)
)

insert into departamento(idDepartamento,nombre)
values (31,'Ventas'),(32,'Comercio'),(33,'Marketing'),(34,'Finanzas')

insert into empleado(idEmpleado,idDepartamento, nombre)
values (20,31,'Ana'),(21,33,'Juan'),(22,33,'Luis'),(23,34,'Gloria'),(24,34,'William'),(25,null,'Julio')

select E.nombre as 'empleado', D.nombre as 'departamento'
From empleado E
inner join departamento D
on E.idDepartamento = D.idDepartamento

select E.nombre as 'empleado', D.nombre as 'departamento'
From empleado E
left join departamento D
on E.idDepartamento = D.idDepartamento

select E.nombre as 'empleado', D.nombre as 'departamento'
From empleado E
right join departamento D
on E.idDepartamento = D.idDepartamento

select E.nombre as 'empleado', D.nombre as 'departamento'
From empleado E
full outer join departamento D
on E.idDepartamento = D.idDepartamento

select * from empleado