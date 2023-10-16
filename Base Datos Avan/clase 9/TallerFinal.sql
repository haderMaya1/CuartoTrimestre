/*1. Listar el nombre de los productos con su id de categoría 
cuyos precios sean superior al 
promedio productos (escalonada)*/
use factura

select p.idproducto, p.nombreProducto, p.idCategoria, p.precioUnidad 
from productos p
where p.precioUnidad > ( select Avg(precioUnidad) from productos)

/*2. listar nombre y precio de producto donde las cantidades sean mayores a 110*/

select p.idpedido,pr.nombreProducto, p.preciounidad, p.cantidad
from detallesdepedidos p
inner join productos pr
on p.idproducto=pr.idproducto
where p.cantidad> 110

/*3. Usando nombre tabla. Liste nombre compañía, nombre producto, fecha pedido, precio unitario cuyos precios
se encuentren entre 90 y 100*/
use factura

select * from productos
select * from proveedores
select * from detallesdepedidos
select * from Pedidos

select Tabla.nombreCompañia, Tabla.nombreProducto, Tabla.FechaPedido, Tabla.precioUnidad
from (select pr.nombreCompañia, pro.nombreProducto, pe.FechaPedido, pro.precioUnidad
from productos pro
inner join proveedores pr
on pro.idProveedor = pr.idProveedor
inner join detallesdepedidos dp
on pro.idproducto = dp.idproducto
inner join Pedidos pe
on dp.idpedido = pe.IdPedido
where pro.precioUnidad between 90 and 100)
as Tabla



/*4. Calcular el total (Teniendo en cuenta el punto anterior)*/



/*5. Calcular la suma de totales agrupados por nombre de compañía*/