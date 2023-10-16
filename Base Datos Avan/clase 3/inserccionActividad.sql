/*1) se desea conocer todos los productos que se encuentren en una orden*/
use factura
select D.idpedido as 'detallespedidos', P.nombreProducto, P.cantidadPorUnidad
From detallesdepedidos D
inner join productos P
on D.idproducto = P.idproducto ORDER BY idpedido

/*2) Se desea conocer que empleados que han atentido una orden y en que fecha lo hicieron, los registros se 
deben ordenar por el campo IdEmpleado*/

select E.IdEmpleado, E.Nombre, E.Apellidos, P.FechaPedido, P.FechaEntrega
From Pedidos P
inner join Empleados E
on E.IdEmpleado = P.IdEmpleado ORDER BY E.IdEmpleado asc, P.FechaPedido asc, P.FechaEntrega asc

/*3)Se desea conocer los empleados que han atendido un pedido independientemente
si este lo ha realizado o no*/

select E.IdEmpleado, E.Nombre, E.Apellidos, P.FechaPedido, P.FechaEnvio
From Pedidos P
Full outer join Empleados E
on E.IdEmpleado = P.IdEmpleado ORDER BY E.IdEmpleado asc, P.FechaPedido asc, P.FechaEnvio asc

/*4)Se desea conocer los empleados que no han atendido ningun pedido*/

select E.IdEmpleado, E.Nombre, E.Apellidos, DP.IdPedido, DP.FechaEntrega, DP.FechaEnvio
From Empleados E
Full join Pedidos DP
on E.IdEmpleado = DP.IdEmpleado ORDER BY IdEmpleado asc

/*5)Mostrar que productos ofrece cada proveedor independientemente si este lo hace o no*/

select Pr.nombreCompañia as 'nombreProveedor', pro.nombreProducto 'nombreProducto'
From proveedores Pr
inner join productos pro
on pro.idProveedor = Pr.idProveedor

/*6) Mostrar que proveedor no ha ofrecido Porductos*/



/*7)muestre los productos que tengan o no asignado un proveedor y los proveedores
independientemente si estos han ofrecido o no un producto*/

select Pr.nombreCompañia as 'nombreProveedor', pro.nombreProducto 'nombreProducto'
From proveedores Pr
FULL join productos pro
on Pr.idProveedor = pro.idProveedor


/*
5.Copia masiva BULK
	El archivo TXT o CSV que se va a llevar a una tabla de sql
	debe coincidir
*/
BULK INSERT datos
			From
				'C:\carga\datos.txt'
			with (
				firstrow=2,
				Fieldterminator = ';',
				Rowterminator = '\n'
				);

use DB_complete

create table datos(
nombre varchar (200),
apellido varchar (200),
tel varchar (200)
)


BULK INSERT beneficiarios
			From
				'C:\carga\beneficiarios.csv'
			with (
				firstrow=2,
				Fieldterminator = ',',
				Rowterminator = '\n'
				);

				select * from beneficiarios
create table beneficiarios
(
	cedula int,
	primernombre varchar (200),
	segundonombre varchar (200),
	primerapellido varchar (200),
	segundoapellido varchar (200)
)

create table salud(
COD_EVE int,
Nombre varchar (200),
ANO int,
SEMANA date,
COD_DPTO_O int,
nom_mun varchar (200),
COD_NUM_0 int
)

BULK INSERT salud
			From
				'C:\carga\svg.csv'
			with (
				firstrow=2,
				Fieldterminator = ',',
				Rowterminator = '\n'
				);
select * from beneficiarios

/*bcp factura.dbo.clientes out C:\carga\prueba1.txt -c -T 1266679167 (5380)*/