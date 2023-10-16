create database practica1

use practica1

-- CREAR TABLAS

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

-- INSERTAR DATOS

insert into departamento(idDepartamento,nombre)
values (31,'Ventas'),(32,'Comercio'),(33,'Marketing'),(34,'Finanzas')

insert into empleado(idEmpleado, idDepartamento, nombre)
values (20,31,'Ana'),(21,33,'Juan'),(22,33,'Luis'),(23,34,'Gloria'),(24,34,'William'),(25,null,'Julio')

/*Escalonadas
Listar el promedio de todos los precios de la tabla producto por nombre 
de productos*/
use factura

select nombreProducto, precioUnidad,
(select avg (precioUnidad) from productos)
from productos


/*Listas
Listar los productos cuyos precios es superior que todos los idcategorias 6
*/
select precioUnidad, idCategoria from productos where idCategoria=6

select precioUnidad, idCategoria from productos where precioUnidad>124

select precioUnidad, idCategoria from productos where
precioUnidad>all(select precioUnidad from productos where idCategoria=6)

/*Correlacionada- hacen referencia a columnas de la consulta padre.
Listar nombre del producto y precioUnidad de aquellos productos
cuyo preciounidad sea menor a 20 e el que se hicieron pedidos*/

select nombreProducto, precioUnidad from productos
where idproducto in
(select idproducto from detallesdepedidos where precioUnidad<20)

select NombreContacto, Telefono from clientes
where idCliente in
(select idCliente from clientes where idCliente>5)

--Otro ejemplo 

--Listar todos los clientes que han efectuado una orden
select NombreCompañia from clientes
--Los clientes unicos registrados en pedidos
select distinct idCliente from Pedidos

select NombreCompañia from clientes as c
where exists
(select * from Pedidos as p
where c.idCliente=p.IdCliente)

--Subconsultas como tablas derivadas
/*se trata de dar nombre a una consulta, usar una consulta para hacer consultas
y quedaria como una tabla */

/*Listar nombre de compañia de la tabla clientes, nombre del producto
de la tabla producto, dcha de pedido de la tabla
pedidos, precio unitario y cantidad de la tabla detallespedido*/

select * from clientes
select * from productos
select * from Pedidos
select * from detallesdepedidos

--JOIN
 
select c.NombreCompañia, pro.nombreProducto, p.FechaPedido,
d.preciounidad, d.cantidad
from clientes c inner join Pedidos p
on c.idCliente = p.IdCliente
inner join detallesdepedidos d
on d.idpedido=p.IdPedido
inner join productos pro
on d.idproducto = pro.idproducto

--Segundo colocar la consultar anterior como interna

select T.NombreCompañia, T.nombreProducto, T.preciounidad from
(select c.NombreCompañia, pro.nombreProducto, p.FechaPedido,
d.preciounidad, d.cantidad
from clientes c inner join Pedidos p
on c.idCLiente = p.IdCliente
inner join detallesdepedidos d
on d.idpedido=p.IdPedido
inner join productos pro
on d.idproducto=pro.idproducto)
as T


/*De esta consulta se requiere otra consulta como: listar 
nombrecompañia, nombreproducto y precio unidad. Se requiere dar nombre a la consulta*/

SELECT T.NombreCompañia, T.nombreProducto, T.preciounidad FROM
(select c.NombreCompañia, pro.nombreProducto, p.FechaPedido,
d.preciounidad, d.cantidad
from clientes c inner join Pedidos p
on c.idCliente=p.IdCliente
inner join detallesdepedidos d
on p.IdPedido=d.idpedido
inner join productos pro
on d.idproducto=pro.idproducto)
as T

/* Utilizando esta consulta calcule el total*/

Select T.NombreCompañia, T.nombreProducto,(T.preciounidad*T.cantidad)
as Total from
(select c.NombreCompañia, pro.nombreProducto,p.FechaPedido,
d.preciounidad, d.cantidad
from clientes c inner join Pedidos p
on c.idCliente=p.IdCliente
inner join detallesdepedidos d
on p.IdPedido=d.idpedido
inner join productos pro
on d.idproducto=pro.idproducto)
as T

--Calcular las suma de totales por nombre de compañia
Select T.NombreCompañia, SUM(T.preciounidad*T.cantidad)
as Total from
(select c.NombreCompañia, pro.nombreProducto,p.FechaPedido,
d.preciounidad, d.cantidad
from clientes c inner join Pedidos p
on c.idCliente=p.IdCliente
inner join detallesdepedidos d
on p.IdPedido=d.idpedido
inner join productos pro
on d.idproducto=pro.idproducto)
as T group by T.NombreCompañia

/*Solo mostrar valores mayores a 20000*/
Select T.NombreCompañia, SUM(T.preciounidad*T.cantidad)
as Total from
(select c.NombreCompañia, pro.nombreProducto,p.FechaPedido,
d.preciounidad, d.cantidad
from clientes c inner join Pedidos p
on c.idCliente=p.IdCliente
inner join detallesdepedidos d
on p.IdPedido=d.idpedido
inner join productos pro
on d.idproducto=pro.idproducto)
as T group by T.NombreCompañia having sum(T.preciounidad*T.cantidad) > 20000 order by T.NombreCompañia

--Declarar y almacenar en una variable
declare @variable int --declarando variables
set @varibale=25 -- almacenar valor a una variable
print @variable

declare @variable1 int=200 --declarando y almacenando valor
print @variable1

--Mostrar en una variable el numero de clientes
use factura
declare  @cliente int
set @cliente=(select count(*) from clientes)
print @cliente

--Mostrar de otra forma
declare @cliente1 int
select @cliente1=count(*) from clientes
print @cliente1
go

/*Implementar un script que permita ingresar un nuevo departamento en caso de registrar duplicidad en el nombre del
departamento o id duplicado mostrar un mensaje que diga:
Departamento ya registrado, en caso contrario insertar el registro*/
use practica1
select * from departamento
declare @id int = 35
declare @nombre varchar (20)='Comercial'
if exists (select * from departamento where nombre=@nombre)
begin 
	print 'Departamento Ya esta registrado'
end
else
begin
	insert into departamento(idDepartamento,nombre)
	values (@id,@nombre)
	print 'Departamento registrado correctamente'
end

/*Para realizar el taller hay que consultar, estructuras, casos, subconsultas*/