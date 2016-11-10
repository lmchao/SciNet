USE [RedSocialORT22AGrupo02]
GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Solicitud', N'COLUMN',N'SolicitudEstadoID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solicitud', @level2type=N'COLUMN',@level2name=N'SolicitudEstadoID'

GO
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UsuarioInsert]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarPorEmailPassword]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioBuscarPorEmailPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UsuarioBuscarPorEmailPassword]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarEmail]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioBuscarEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UsuarioBuscarEmail]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioActualizarFoto]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioActualizarFoto]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UsuarioActualizarFoto]
GO
/****** Object:  StoredProcedure [dbo].[SolicitudInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitudInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SolicitudInsert]
GO
/****** Object:  StoredProcedure [dbo].[SolicitudBuscarPorUsuarioIDSolicita]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitudBuscarPorUsuarioIDSolicita]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SolicitudBuscarPorUsuarioIDSolicita]
GO
/****** Object:  StoredProcedure [dbo].[SolicitudBuscarPorUsuarioID]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitudBuscarPorUsuarioID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SolicitudBuscarPorUsuarioID]
GO
/****** Object:  StoredProcedure [dbo].[PublicacionInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicacionInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PublicacionInsert]
GO
/****** Object:  StoredProcedure [dbo].[PublicacionActualizarFoto]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicacionActualizarFoto]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PublicacionActualizarFoto]
GO
/****** Object:  StoredProcedure [dbo].[MensajeInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MensajeInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MensajeInsert]
GO
/****** Object:  StoredProcedure [dbo].[GrupoUsuarioInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GrupoUsuarioInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GrupoUsuarioInsert]
GO
/****** Object:  StoredProcedure [dbo].[GrupoInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GrupoInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GrupoInsert]
GO
/****** Object:  StoredProcedure [dbo].[ComentarioInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ComentarioInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ComentarioInsert]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Solicitud_Usuario1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Solicitud]'))
ALTER TABLE [dbo].[Solicitud] DROP CONSTRAINT [FK_Solicitud_Usuario1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Solicitud_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Solicitud]'))
ALTER TABLE [dbo].[Solicitud] DROP CONSTRAINT [FK_Solicitud_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Publicacion_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Publicacion]'))
ALTER TABLE [dbo].[Publicacion] DROP CONSTRAINT [FK_Publicacion_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Publicacion_Grupo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Publicacion]'))
ALTER TABLE [dbo].[Publicacion] DROP CONSTRAINT [FK_Publicacion_Grupo]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GrupoUsuario_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[GrupoUsuario]'))
ALTER TABLE [dbo].[GrupoUsuario] DROP CONSTRAINT [FK_GrupoUsuario_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GrupoUsuario_Grupo]') AND parent_object_id = OBJECT_ID(N'[dbo].[GrupoUsuario]'))
ALTER TABLE [dbo].[GrupoUsuario] DROP CONSTRAINT [FK_GrupoUsuario_Grupo]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [FK_Comentario_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Publicacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [FK_Comentario_Publicacion]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
DROP TABLE [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Solicitud]') AND type in (N'U'))
DROP TABLE [dbo].[Solicitud]
GO
/****** Object:  Table [dbo].[Publicacion]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Publicacion]') AND type in (N'U'))
DROP TABLE [dbo].[Publicacion]
GO
/****** Object:  Table [dbo].[Mensaje]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mensaje]') AND type in (N'U'))
DROP TABLE [dbo].[Mensaje]
GO
/****** Object:  Table [dbo].[GrupoUsuario]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GrupoUsuario]') AND type in (N'U'))
DROP TABLE [dbo].[GrupoUsuario]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Grupo]') AND type in (N'U'))
DROP TABLE [dbo].[Grupo]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comentario]') AND type in (N'U'))
DROP TABLE [dbo].[Comentario]
GO
/****** Object:  Table [dbo].[Amigo]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Amigo]') AND type in (N'U'))
DROP TABLE [dbo].[Amigo]
GO
/****** Object:  User [RedSocialORT]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'RedSocialORT')
DROP USER [RedSocialORT]
GO
USE [master]
GO
/****** Object:  Database [RedSocialORT22AGrupo02]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'RedSocialORT22AGrupo02')
DROP DATABASE [RedSocialORT22AGrupo02]
GO
/****** Object:  Database [RedSocialORT22AGrupo02]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'RedSocialORT22AGrupo02')
BEGIN
CREATE DATABASE [RedSocialORT22AGrupo02] ON  PRIMARY 
( NAME = N'RedSocialORT22AGrupo02', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RedSocialORT22AGrupo02.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RedSocialORT22AGrupo02_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RedSocialORT22AGrupo02_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RedSocialORT22AGrupo02].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET ARITHABORT OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET RECOVERY FULL 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET  MULTI_USER 
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RedSocialORT22AGrupo02', N'ON'
GO
ALTER AUTHORIZATION ON DATABASE::[RedSocialORT22AGrupo02] TO [ALMAGRO\ALEJANDRO.JAIT]
GO
USE [RedSocialORT22AGrupo02]
GO
/****** Object:  User [RedSocialORT]    Script Date: 9/11/2016 10:37:18 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'RedSocialORT')
CREATE USER [RedSocialORT] FOR LOGIN [RedSocialORT] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [RedSocialORT]
GO
/****** Object:  Table [dbo].[Amigo]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Amigo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Amigo](
	[UsuarioID] [int] NOT NULL,
	[UsuarioIDAmigo] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL CONSTRAINT [DF_Amigo_FechaAlta]  DEFAULT (getdate()),
 CONSTRAINT [PK_Amigo] PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC,
	[UsuarioIDAmigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Amigo] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comentario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Comentario](
	[ComentarioID] [int] NOT NULL,
	[PublicacionID] [int] NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[ComentarioTexto] [nchar](144) NOT NULL,
	[ComentarioCalificacion] [int] NOT NULL,
	[ComentarioFechaActualizacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[ComentarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Comentario] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Grupo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Grupo](
	[GrupoID] [int] IDENTITY(1,1) NOT NULL,
	[GrupoNombre] [nchar](30) NOT NULL,
	[GrupoDescripcion] [nchar](100) NULL,
	[GrupoFechaCreacion] [datetime] NOT NULL,
	[GrupoFechaActualizacion] [datetime] NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[GrupoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Grupo] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[GrupoUsuario]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GrupoUsuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GrupoUsuario](
	[GrupoID] [int] NOT NULL,
	[UsuarioID] [int] NOT NULL,
 CONSTRAINT [PK_GrupoUsuario] PRIMARY KEY CLUSTERED 
(
	[GrupoID] ASC,
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[GrupoUsuario] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Mensaje]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mensaje]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mensaje](
	[MensajeID] [int] IDENTITY(1,1) NOT NULL,
	[PublicacionID] [int] NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[MensajeFecha] [datetime] NOT NULL,
	[MensajeTexto] [varchar](max) NULL,
 CONSTRAINT [PK_Mensaje] PRIMARY KEY CLUSTERED 
(
	[MensajeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Mensaje] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Publicacion]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Publicacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Publicacion](
	[PublicacionID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[GrupoID] [int] NULL,
	[Descripcion] [nchar](144) NOT NULL,
	[PublicacionActualizacion] [datetime] NOT NULL,
	[PublicacionCalificacion] [int] NULL,
	[PublicacionImagen] [varbinary](max) NULL,
 CONSTRAINT [PK_Publicacion] PRIMARY KEY CLUSTERED 
(
	[PublicacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Publicacion] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Solicitud]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Solicitud](
	[SolicitudID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[UsuarioIDSolicita] [int] NOT NULL,
	[SolicitudEstadoID] [tinyint] NOT NULL,
	[FechaAlta] [datetime] NOT NULL CONSTRAINT [DF_Solicitud_FechaAlta]  DEFAULT (getdate()),
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Solicitud] PRIMARY KEY CLUSTERED 
(
	[SolicitudID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Solicitud] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usuario](
	[UsuarioID] [int] IDENTITY(1000,1) NOT NULL,
	[UsuarioNombre] [nvarchar](30) NOT NULL,
	[UsuarioApellido] [nvarchar](30) NOT NULL,
	[UsuarioEmail] [nvarchar](100) NOT NULL,
	[UsuarioPassword] [nvarchar](100) NOT NULL,
	[UsuarioFechaNacimiento] [date] NOT NULL,
	[UsuarioSexo] [nchar](1) NOT NULL,
	[UsuarioFoto] [nvarchar](100) NULL,
	[UsuarioFechaRegistracion] [datetime] NOT NULL,
	[UsuarioFechaActualizacion] [datetime] NULL,
	[UsuarioFotoActual] [varbinary](max) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Usuario] TO  SCHEMA OWNER 
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Publicacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Publicacion] FOREIGN KEY([PublicacionID])
REFERENCES [dbo].[Publicacion] ([PublicacionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Publicacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Publicacion]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comentario_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comentario]'))
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Usuario]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GrupoUsuario_Grupo]') AND parent_object_id = OBJECT_ID(N'[dbo].[GrupoUsuario]'))
ALTER TABLE [dbo].[GrupoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_GrupoUsuario_Grupo] FOREIGN KEY([GrupoID])
REFERENCES [dbo].[Grupo] ([GrupoID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GrupoUsuario_Grupo]') AND parent_object_id = OBJECT_ID(N'[dbo].[GrupoUsuario]'))
ALTER TABLE [dbo].[GrupoUsuario] CHECK CONSTRAINT [FK_GrupoUsuario_Grupo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GrupoUsuario_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[GrupoUsuario]'))
ALTER TABLE [dbo].[GrupoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_GrupoUsuario_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GrupoUsuario_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[GrupoUsuario]'))
ALTER TABLE [dbo].[GrupoUsuario] CHECK CONSTRAINT [FK_GrupoUsuario_Usuario]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Publicacion_Grupo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Publicacion]'))
ALTER TABLE [dbo].[Publicacion]  WITH CHECK ADD  CONSTRAINT [FK_Publicacion_Grupo] FOREIGN KEY([GrupoID])
REFERENCES [dbo].[Grupo] ([GrupoID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Publicacion_Grupo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Publicacion]'))
ALTER TABLE [dbo].[Publicacion] CHECK CONSTRAINT [FK_Publicacion_Grupo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Publicacion_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Publicacion]'))
ALTER TABLE [dbo].[Publicacion]  WITH CHECK ADD  CONSTRAINT [FK_Publicacion_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Publicacion_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Publicacion]'))
ALTER TABLE [dbo].[Publicacion] CHECK CONSTRAINT [FK_Publicacion_Usuario]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Solicitud_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Solicitud]'))
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Solicitud_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Solicitud]'))
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Usuario]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Solicitud_Usuario1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Solicitud]'))
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Usuario1] FOREIGN KEY([UsuarioIDSolicita])
REFERENCES [dbo].[Usuario] ([UsuarioID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Solicitud_Usuario1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Solicitud]'))
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Usuario1]
GO
/****** Object:  StoredProcedure [dbo].[ComentarioInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ComentarioInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ComentarioInsert] AS' 
END
GO
ALTER PROCEDURE [dbo].[ComentarioInsert]

@PublicacionID int,
@UsuarioID int,
@ComentarioTexto nvarchar(144),
@ComentarioCalificacion int,
@ComentarioFechaActualizacion datetime

AS

INSERT INTO dbo.Comentario
(
PublicacionID,
UsuarioID,
ComentarioTexto,
ComentarioCalificacion,
ComentarioFechaActualizacion

)
VALUES
(
@PublicacionID,
@UsuarioID,
@ComentarioTexto,
@ComentarioCalificacion,
@ComentarioFechaActualizacion
)

RETURN SCOPE_IDENTITY()

GO
ALTER AUTHORIZATION ON [dbo].[ComentarioInsert] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[ComentarioInsert] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[GrupoInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GrupoInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GrupoInsert] AS' 
END
GO
ALTER PROCEDURE [dbo].[GrupoInsert]

@GrupoNombre nvarchar(30),
@GrupoDescripcion nvarchar(100),
@GrupoFechaCreacion datetime,
@GrupoFechaActualizacion datetime

AS

INSERT INTO dbo.Grupo
(
GrupoNombre,
GrupoDescripcion,
GrupoFechaCreacion,
GrupoFechaActualizacion
)
VALUES
(
@GrupoNombre,
@GrupoDescripcion,
@GrupoFechaCreacion,
@GrupoFechaActualizacion
)

RETURN SCOPE_IDENTITY()

GO
ALTER AUTHORIZATION ON [dbo].[GrupoInsert] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[GrupoInsert] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[GrupoUsuarioInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GrupoUsuarioInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GrupoUsuarioInsert] AS' 
END
GO
ALTER PROCEDURE [dbo].[GrupoUsuarioInsert]

@GrupoID int,
@UsuarioID int

AS

INSERT INTO dbo.GrupoUsuario
(
GrupoID,
UsuarioID
)
VALUES
(
@GrupoID,
@UsuarioID
)



GO
ALTER AUTHORIZATION ON [dbo].[GrupoUsuarioInsert] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[GrupoUsuarioInsert] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[MensajeInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MensajeInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[MensajeInsert] AS' 
END
GO
ALTER PROCEDURE [dbo].[MensajeInsert]

@GrupoID int,
@UsuarioID int,
@MensajeFecha datetime,
@MensajeTexto nvarchar(MAX)

AS

INSERT INTO dbo.Mensaje
(
GrupoID,
UsuarioID,
MensajeFecha,
MensajeTexto

)
VALUES
(
@GrupoID,
@UsuarioID,
@MensajeFecha,
@MensajeTexto
)

RETURN SCOPE_IDENTITY()

GO
ALTER AUTHORIZATION ON [dbo].[MensajeInsert] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[MensajeInsert] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[PublicacionActualizarFoto]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicacionActualizarFoto]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PublicacionActualizarFoto] AS' 
END
GO
ALTER PROCEDURE [dbo].[PublicacionActualizarFoto]

@PublicacionID int,
@PublicacionImagen varbinary(MAX)

AS

UPDATE	Publicacion
SET		PublicacionImagen = @PublicacionImagen 
WHERE	PublicacionID = @PublicacionID

GO
ALTER AUTHORIZATION ON [dbo].[PublicacionActualizarFoto] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[PublicacionActualizarFoto] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[PublicacionInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicacionInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PublicacionInsert] AS' 
END
GO
ALTER PROCEDURE [dbo].[PublicacionInsert]

@UsuarioID int,
@GrupoID int,
@Descripcion nvarchar(144),
@PublicacionActualizacion datetime,
@PublicacionImagen varbinary(MAX) = null

AS

INSERT INTO dbo.Publicacion
(
UsuarioID,
GrupoID,
Descripcion,
PublicacionActualizacion,
PublicacionImagen
)
VALUES
(
@UsuarioID,
@GrupoID,
@Descripcion,
@PublicacionActualizacion,
@PublicacionImagen
)
RETURN SCOPE_IDENTITY()

GO
ALTER AUTHORIZATION ON [dbo].[PublicacionInsert] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[PublicacionInsert] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SolicitudBuscarPorUsuarioID]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitudBuscarPorUsuarioID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SolicitudBuscarPorUsuarioID] AS' 
END
GO
ALTER PROCEDURE [dbo].[SolicitudBuscarPorUsuarioID]

@UsuarioID int,
@SolicitudEstadoID tinyint
AS

SELECT	*
FROM	Solicitud
WHERE	UsuarioID = @UsuarioID AND SolicitudEstadoID = @SolicitudEstadoID

GO
ALTER AUTHORIZATION ON [dbo].[SolicitudBuscarPorUsuarioID] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SolicitudBuscarPorUsuarioID] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SolicitudBuscarPorUsuarioIDSolicita]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitudBuscarPorUsuarioIDSolicita]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SolicitudBuscarPorUsuarioIDSolicita] AS' 
END
GO
ALTER PROCEDURE [dbo].[SolicitudBuscarPorUsuarioIDSolicita]

@UsuarioID int,
@SolicitudEstadoID tinyint
AS

SELECT	*
FROM	Solicitud
WHERE	UsuarioIDSolicita = @UsuarioID AND SolicitudEstadoID = @SolicitudEstadoID

GO
ALTER AUTHORIZATION ON [dbo].[SolicitudBuscarPorUsuarioIDSolicita] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SolicitudBuscarPorUsuarioIDSolicita] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SolicitudInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitudInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SolicitudInsert] AS' 
END
GO
ALTER PROCEDURE [dbo].[SolicitudInsert]

@UsuarioID int,
@UsuarioIDSolicita int,
@SolicitudEstadoID tinyint,
@FechaAlta datetime,
@FechaModificacion datetime

AS

INSERT INTO dbo.Solicitud
(
UsuarioID,
UsuarioIDSolicita,
SolicitudEstadoID,
FechaAlta,
FechaModificacion

)
VALUES
(
@UsuarioID,
@UsuarioIDSolicita,
@SolicitudEstadoID,
@FechaAlta,
@FechaModificacion

)

RETURN SCOPE_IDENTITY()

GO
ALTER AUTHORIZATION ON [dbo].[SolicitudInsert] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SolicitudInsert] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[UsuarioActualizarFoto]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioActualizarFoto]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UsuarioActualizarFoto] AS' 
END
GO
ALTER PROCEDURE [dbo].[UsuarioActualizarFoto]

@UsuarioID int,
@UsuarioFoto nvarchar(100),
@UsuarioFotoActual varbinary(MAX)

AS

UPDATE	Usuario
SET		UsuarioFoto = @UsuarioFoto, UsuarioFotoActual = @UsuarioFotoActual
WHERE	UsuarioID = @UsuarioID

GO
ALTER AUTHORIZATION ON [dbo].[UsuarioActualizarFoto] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[UsuarioActualizarFoto] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarEmail]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioBuscarEmail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UsuarioBuscarEmail] AS' 
END
GO
ALTER PROCEDURE [dbo].[UsuarioBuscarEmail]

@UsuarioEmail nvarchar(100)

AS

IF EXISTS (SELECT * FROM Usuario WHERE UsuarioEmail = @UsuarioEmail)
	SELECT 1
ELSE
	SELECT 0

GO
ALTER AUTHORIZATION ON [dbo].[UsuarioBuscarEmail] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[UsuarioBuscarEmail] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarPorEmailPassword]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioBuscarPorEmailPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UsuarioBuscarPorEmailPassword] AS' 
END
GO
ALTER PROCEDURE [dbo].[UsuarioBuscarPorEmailPassword]

@UsuarioEmail nvarchar(100),
@UsuarioPassword nvarchar(100)

AS

SELECT	*
FROM	Usuario
WHERE	UsuarioEmail = @UsuarioEmail AND
		UsuarioPassword = @UsuarioPassword

GO
ALTER AUTHORIZATION ON [dbo].[UsuarioBuscarPorEmailPassword] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[UsuarioBuscarPorEmailPassword] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 9/11/2016 10:37:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UsuarioInsert] AS' 
END
GO
ALTER PROCEDURE [dbo].[UsuarioInsert]

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
ALTER AUTHORIZATION ON [dbo].[UsuarioInsert] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[UsuarioInsert] TO  SCHEMA OWNER 
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Solicitud', N'COLUMN',N'SolicitudEstadoID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Pendiente
2=Aceptada
3=Rechazada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solicitud', @level2type=N'COLUMN',@level2name=N'SolicitudEstadoID'
GO
USE [master]
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET  READ_WRITE 
GO
