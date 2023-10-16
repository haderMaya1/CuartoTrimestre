use [factura]
go

alter table [dbo].[Pedidos] with check add constraint [fk_6]
foreign key ([IdEmpleado])
references [dbo].[Empleado] ([IdEmpleado])
go

alter table [dbo].[Pedido] CHECK CONSTRAINT [fk_6]
go