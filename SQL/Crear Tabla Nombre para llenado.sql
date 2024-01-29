USE [empresaX]
GO

/****** Object:  Table [dbo].[Names]    Script Date: 1/28/2024 9:40:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T-Names](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Apellido] [varchar](30) NULL
) ON [PRIMARY]
GO


