BEGIN TRY 
	DECLARE @divisor INT, @dividiendo INT, @resultado INT
	SET @dividiendo = 100
	SET @divisor = 50
--Esta linea provoca in error de division por 0
SET @resultado =@dividiendo/@divisor
PRINT 'NO HAY ERRORES'
PRINT @resultado
END TRY
BEGIN CATCH
PRINT 'SE HA PRODUCIDO UN ERROR'
END CATCH;

/*Funciones Especiales de error
las funciones especiales de error, estan disponibles
úicamente en el bloque CATCH para la obteniín de información 
detallada del error

Error				Descripción
ERROR_NUMBER()		Devuelve el número de error
ERROR_SEVERITY()	Devuelve la severidad del error 
ERROR_STATE()		Devuelve el estado de error
ERROR_PROCEDURE()	Devuelve el nombre del procedimiento almacenado
					que ha provocado el error
ERROR_LINE()		Devuelve el numero de linea en que se
					ha producido el error
ERROR_MASSAGE()		Devuelve el mensaje de error

Ejemplo: tomando lo anterior implementar el error
*/

BEGIN TRY 
	DECLARE @divisor1 INT, @dividiendo1 INT, @resultado1 INT
	SET @dividiendo1 = 100
	SET @divisor1 = 0
--Esta linea provoca in error de division por 0
SET @resultado1 =@dividiendo1/@divisor1
PRINT 'NO HAY ERRORES'
PRINT @resultado1
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	PRINT ERROR_STATE()
END CATCH;

Use factura
--Cursores
DECLARE mi_cursor CURSOR
FOR
	SELECT TOP 1 * FROM productos
--Abrir
OPEN mi_cursor
--Imprimir el primer registro-esto para navegar
FETCH NECT FROM mi_cursor
--Cerrar
CLOSE mi_cursor
--Liberar- sacar de memoria ram
DEALLOCATE mi_cursor

--Ejemplo FUNCIONES
use factura

/*1. Extraer los 5 primeros caracteres de nombre compañia de la tabla
clientes*/

select NombreCompañia, SUBSTRING (NombreCompañia,1,5) as primerasLetras
from clientes

--2. Obteer el importe de cada una de las ventas de la base de datos,
--redondeando a dos decimales:

SELECT idpedido, ROUND(preciounidad * cantidad, 2) as Importe 
FROM detallesdepedidos
GO

/*Funcionar escalar implementada dentro de una consulta
3. Calcular el IVA*/

CREATE FUNCTION IVA (@cantidad money)
returns money--Indicamos el tipo de dato que retornara la función
as
begin
	declare @resultado money
	set @resultado=@cantidad*1.19
	return (@resultado)
end

--Ejecutar la función
select nombreProducto, precioUnidad, dbo.iva(precioUnidad)
as IVA
from productos

--Crear una funcion que se le ingrese parametros
--el pais y liste los clientes de ese pais

create function ListadoClientes (@pais varchar(100))
returns @clientes table--se retorna una variable ripo tabla
(
--Aqui se indica los tipos de datos para definir esa variable
idCLiente VARCHAR (5), nombreCompañia (50),
nombreContacto VARCHAR (100), pais VARCHAR(100)
)
as
begin
insert @clientes select idCliente, nombreCompañia, nombreContacto, Pais FROM clientes
where Pais= @pais --le insertamos a la variable todos los campos
return
end

--Ejecutar la funcion
select * from dbo.ListadoCLientes('Reino Unido')

select * From clientes
