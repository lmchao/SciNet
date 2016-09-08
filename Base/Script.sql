
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 09/27/2013 14:29:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioNombre] [nvarchar](30) NOT NULL,
	[UsuarioApellido] [nvarchar](30) NOT NULL,
	[UsuarioEmail] [nvarchar](100) NOT NULL,
	[UsuarioPassword] [nvarchar](100) NOT NULL,
	[UsuarioFechaNacimiento] [date] NOT NULL,
	[UsuarioSexo] [nchar](1) NOT NULL,
	[UsuarioFoto] [nvarchar](100) NULL,
	[UsuarioFechaRegistracion] [datetime] NOT NULL,
	[UsuarioFechaActualizacion] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 09/27/2013 14:29:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitud](
	[SolicitudID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[UsuarioIDSolicita] [int] NOT NULL,
	[SolicitudEstadoID] [tinyint] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Solicitud] PRIMARY KEY CLUSTERED 
(
	[SolicitudID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Pendiente
2=Aceptada
3=Rechazada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solicitud', @level2type=N'COLUMN',@level2name=N'SolicitudEstadoID'
GO
/****** Object:  Table [dbo].[Amigo]    Script Date: 09/27/2013 14:29:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amigo](
	[UsuarioID] [int] NOT NULL,
	[UsuarioIDAmigo] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
 CONSTRAINT [PK_Amigo] PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC,
	[UsuarioIDAmigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 09/27/2013 14:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioInsert]

@UsuarioNombre nvarchar(30),
@UsuarioApellido nvarchar(30),
@UsuarioEmail nvarchar(100),
@UsuarioPassword nvarchar(100),
@UsuarioFechaNacimiento date,
@UsuarioSexo nchar(1),
@UsuarioFechaRegistracion datetime

AS

INSERT INTO Usuario
(
UsuarioNombre,
UsuarioApellido,
UsuarioEmail,
UsuarioPassword,
UsuarioFechaNacimiento,
UsuarioSexo,
UsuarioFechaRegistracion
)
VALUES
(
@UsuarioNombre,
@UsuarioApellido,
@UsuarioEmail,
@UsuarioPassword,
@UsuarioFechaNacimiento,
@UsuarioSexo,
@UsuarioFechaRegistracion
)

RETURN SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarPorEmailPassword]    Script Date: 09/27/2013 14:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioBuscarPorEmailPassword]

@UsuarioEmail nvarchar(100),
@UsuarioPassword nvarchar(100)

AS

SELECT	*
FROM	Usuario
WHERE	UsuarioEmail = @UsuarioEmail AND
		UsuarioPassword = @UsuarioPassword
GO
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarEmail]    Script Date: 09/27/2013 14:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioBuscarEmail]

@UsuarioEmail nvarchar(100)

AS

IF EXISTS (SELECT * FROM Usuario WHERE UsuarioEmail = @UsuarioEmail)
	SELECT 1
ELSE
	SELECT 0
GO
/****** Object:  StoredProcedure [dbo].[UsuarioActualizarFoto]    Script Date: 09/27/2013 14:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioActualizarFoto]

@UsuarioID int,
@UsuarioFoto nvarchar(100)

AS

UPDATE	Usuario
SET		UsuarioFoto = @UsuarioFoto
WHERE	UsuarioID = @UsuarioID
GO
/****** Object:  Default [DF_Solicitud_FechaAlta]    Script Date: 09/27/2013 14:29:48 ******/
ALTER TABLE [dbo].[Solicitud] ADD  CONSTRAINT [DF_Solicitud_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
/****** Object:  Default [DF_Amigo_FechaAlta]    Script Date: 09/27/2013 14:29:48 ******/
ALTER TABLE [dbo].[Amigo] ADD  CONSTRAINT [DF_Amigo_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
