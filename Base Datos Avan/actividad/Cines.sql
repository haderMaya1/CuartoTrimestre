create database [CineCo]
USE [CineCo]
GO
/****** Object:  Table [dbo].[Cines]    Script Date: 1/08/2022 2:48:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cines](
	[Nom_Cine_id] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [int] NULL,
	[Direccion] [varchar](30) NULL,
	[Telefono] [int] NULL,
	[Idtarifa] [int] NULL,
	[IdPeliculas] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Nom_Cine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 1/08/2022 2:48:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[Titulo_id] [int] IDENTITY(1,1) NOT NULL,
	[Director] [varchar](30) NULL,
	[Protagonistas] [varchar](30) NULL,
	[Genero] [varchar](30) NULL,
	[Clasificacion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Titulo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarifa]    Script Date: 1/08/2022 2:48:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarifa](
	[Tarifa_id] [int] IDENTITY(1,1) NOT NULL,
	[Dia] [varchar](15) NULL,
	[Precio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Tarifa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cines]  WITH CHECK ADD FOREIGN KEY([IdPeliculas])
REFERENCES [dbo].[Peliculas] ([Titulo_id])
GO
ALTER TABLE [dbo].[Cines]  WITH CHECK ADD FOREIGN KEY([Idtarifa])
REFERENCES [dbo].[Tarifa] ([Tarifa_id])
GO


CREATE PROC CINE_INSERT(
	@Nom_Cine_Id VARCHAR(50),
	@numero VARCHAR(50),
	@direccion VARCHAR(50),
	@telefono VARCHAR(50)
)
AS
BEGIN 
INSERT INTO Cines (Nom_Cine_id, Numero,Direccion, Telefono) VALUES ('PROCINAL', '834832472', '98 STREET', '9453615')
END
GO


CREATE PROC CINE_SELECT (
	@Nom_Cine_Id varchar (50),
	@numero varchar (50),
	@direccion varchar (50),
	@telefono varchar (50)
 )

 AS 
 BEGIN 
 SELECT * FROM Cines 
 END 
 GO 


CREATE PROC CINE_DELETE (
	@Nom_cine_Id varchar(50),
	@numero varchar(50),
	@direccion varchar (50),
	@telefono varchar (50)
)

AS 
BEGIN
DELETE FROM Cines
END
GO 

CREATE PROC CINE_UPDATE (
	@Nom_cine_Id varchar (50),
	@numero varchar (50),
	@direccion varchar (50),
	@telefono varchar (50)
)

AS
BEGIN
UPDATE Cines 
SET Nom_cine_Id = @Nom_cine_Id,
	numero= @numero,
	Direccion=@direccion,
	Telefono=@telefono

END
GO

CREATE PROC PELICULA_CREATE (
	@TITULO_ID INT,
	@DIRECTOR VARCHAR (30),
	@PROTAGONISTAS VARCHAR (30),
	@GENERO VARCHAR(30),
	@CLASIFICACION INT
)
AS
BEGIN
INSERT INTO Peliculas (Titulo_id,Director,Protagonistas,Genero,Clasificacion) VALUES (@TITULO_ID,@DIRECTOR,@PROTAGONISTAS,@GENERO,@CLASIFICACION)
END
GO

CREATE PROC PELICULA_SELECT (
	@TITULO_ID INT,
	@DIRECTOR VARCHAR (30),
	@PROTAGONISTAS VARCHAR (30),
	@GENERO VARCHAR(30),
	@CLASIFICACION INT
)
AS
BEGIN
SELECT * FROM Peliculas
END
GO

CREATE PROC PELICULA_DELETE(
	@TITULO_ID INT,
	@DIRECTOR VARCHAR (30),
	@PROTAGONISTAS VARCHAR (30),
	@GENERO VARCHAR(30),
	@CLASIFICACION INT
)
AS
BEGIN
DELETE FROM Peliculas WHERE Titulo_id = @TITULO_ID
END
GO

CREATE PROC PELICULA_UPDATE(
	@TITULO_ID INT,
	@DIRECTOR VARCHAR (30),
	@PROTAGONISTAS VARCHAR (30),
	@GENERO VARCHAR(30),
	@CLASIFICACION INT
)
AS
BEGIN
UPDATE Peliculas
SET Titulo_id = @TITULO_ID,
	Director = @DIRECTOR,
	Protagonistas = @PROTAGONISTAS,
	Genero = @GENERO,
	Clasificacion = @CLASIFICACION
END
GO

CREATE PROC TARIFA_CREATE (
	@TARIFA_ID INT,
	@DIA VARCHAR (15),
	@PRECIO INT
)
AS
BEGIN
INSERT INTO Tarifa (Tarifa_id, Dia, Precio) VALUES (@TARIFA_ID, @DIA, @PRECIO)
END
GO

CREATE PROC TARIFA_SELECT (
	@TARIFA_ID INT,
	@DIA VARCHAR (15),
	@PRECIO INT
)
AS
BEGIN
SELECT * FROM Tarifa
END
GO

CREATE PROC TARIFA_DELETE (
	@TARIFA_ID INT,
	@DIA VARCHAR (15),
	@PRECIO INT
)
AS
BEGIN
DELETE FROM Tarifa
WHERE Tarifa_id = @TARIFA_ID
END
GO

CREATE PROC TARIFA_UPDATE (
	@TARIFA_ID INT,
	@DIA VARCHAR (15),
	@PRECIO INT
)
AS
BEGIN
UPDATE Tarifa
SET Tarifa_id = @TARIFA_ID,
	Dia = @DIA,
	Precio = @PRECIO
END
GO


