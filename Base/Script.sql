USE [RedSocialORT22AGrupo02]
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Solicitud', N'COLUMN',N'SolicitudEstadoID'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solicitud', @level2type=N'COLUMN',@level2name=N'SolicitudEstadoID'

GO
/****** Object:  Trigger [GenerarAmistad]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[GenerarAmistad]'))
DROP TRIGGER [dbo].[GenerarAmistad]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UsuarioInsert]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarPorEmailPassword]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioBuscarPorEmailPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UsuarioBuscarPorEmailPassword]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarEmail]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioBuscarEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UsuarioBuscarEmail]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioActualizarFoto]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuarioActualizarFoto]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UsuarioActualizarFoto]
GO
/****** Object:  StoredProcedure [dbo].[SolicitudInsert]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitudInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SolicitudInsert]
GO
/****** Object:  StoredProcedure [dbo].[SolicitudBuscarPorUsuarioIDSolicita]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitudBuscarPorUsuarioIDSolicita]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SolicitudBuscarPorUsuarioIDSolicita]
GO
/****** Object:  StoredProcedure [dbo].[SolicitudBuscarPorUsuarioID]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitudBuscarPorUsuarioID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SolicitudBuscarPorUsuarioID]
GO
/****** Object:  StoredProcedure [dbo].[PublicacionInsert]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicacionInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PublicacionInsert]
GO
/****** Object:  StoredProcedure [dbo].[PublicacionActualizarFoto]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicacionActualizarFoto]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PublicacionActualizarFoto]
GO
/****** Object:  StoredProcedure [dbo].[MensajeInsert]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MensajeInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MensajeInsert]
GO
/****** Object:  StoredProcedure [dbo].[GrupoUsuarioInsert]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GrupoUsuarioInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GrupoUsuarioInsert]
GO
/****** Object:  StoredProcedure [dbo].[GrupoInsert]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GrupoInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GrupoInsert]
GO
/****** Object:  StoredProcedure [dbo].[ComentarioInsert]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ComentarioInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ComentarioInsert]
GO
/****** Object:  StoredProcedure [dbo].[AmigoInsert]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AmigoInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AmigoInsert]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Solicitud_FechaAlta]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Solicitud] DROP CONSTRAINT [DF_Solicitud_FechaAlta]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Publicacion_PublicacionCalificacion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Publicacion] DROP CONSTRAINT [DF_Publicacion_PublicacionCalificacion]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Amigo_FechaAlta]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Amigo] DROP CONSTRAINT [DF_Amigo_FechaAlta]
END

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
DROP TABLE [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Solicitud]') AND type in (N'U'))
DROP TABLE [dbo].[Solicitud]
GO
/****** Object:  Table [dbo].[Publicacion]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Publicacion]') AND type in (N'U'))
DROP TABLE [dbo].[Publicacion]
GO
/****** Object:  Table [dbo].[Mensaje]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mensaje]') AND type in (N'U'))
DROP TABLE [dbo].[Mensaje]
GO
/****** Object:  Table [dbo].[GrupoUsuario]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GrupoUsuario]') AND type in (N'U'))
DROP TABLE [dbo].[GrupoUsuario]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Grupo]') AND type in (N'U'))
DROP TABLE [dbo].[Grupo]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comentario]') AND type in (N'U'))
DROP TABLE [dbo].[Comentario]
GO
/****** Object:  Table [dbo].[Amigo]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Amigo]') AND type in (N'U'))
DROP TABLE [dbo].[Amigo]
GO
/****** Object:  User [RedSocialORT]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'RedSocialORT')
DROP USER [RedSocialORT]
GO
USE [master]
GO
/****** Object:  Login [RedSocialORT]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'RedSocialORT')
DROP LOGIN [RedSocialORT]
GO
/****** Object:  Database [RedSocialORT22AGrupo02]    Script Date: 23/11/2016 20:52:15 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'RedSocialORT22AGrupo02')
DROP DATABASE [RedSocialORT22AGrupo02]
GO
/****** Object:  Database [RedSocialORT22AGrupo02]    Script Date: 23/11/2016 20:52:15 ******/
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
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [RedSocialORT]    Script Date: 23/11/2016 20:52:15 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'RedSocialORT')
CREATE LOGIN [RedSocialORT] WITH PASSWORD=N'4bFR+HjqtPKT0lcSFEaN/kVqhgdV1JxGt6Y3QnbkSII=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [RedSocialORT] DISABLE
GO
ALTER AUTHORIZATION ON DATABASE::[RedSocialORT22AGrupo02] TO [ALMAGRO\ALEJANDRO.JAIT]
GO
USE [RedSocialORT22AGrupo02]
GO
/****** Object:  User [RedSocialORT]    Script Date: 23/11/2016 20:52:15 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'RedSocialORT')
CREATE USER [RedSocialORT] FOR LOGIN [RedSocialORT] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [RedSocialORT]
GO
/****** Object:  Table [dbo].[Amigo]    Script Date: 23/11/2016 20:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Amigo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Amigo](
	[UsuarioID] [int] NOT NULL,
	[UsuarioIDAmigo] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
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
/****** Object:  Table [dbo].[Comentario]    Script Date: 23/11/2016 20:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comentario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Comentario](
	[ComentarioID] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Grupo]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  Table [dbo].[GrupoUsuario]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  Table [dbo].[Mensaje]    Script Date: 23/11/2016 20:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mensaje]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mensaje](
	[MensajeID] [int] IDENTITY(1,1) NOT NULL,
	[GrupoID] [int] NOT NULL,
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
ALTER AUTHORIZATION ON [dbo].[Mensaje] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Publicacion]    Script Date: 23/11/2016 20:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Publicacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Publicacion](
	[PublicacionID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[GrupoID] [int] NULL,
	[Descripcion] [nchar](144) NOT NULL,
	[PublicacionActualizacion] [datetime] NOT NULL,
	[PublicacionCalificacion] [int] NOT NULL,
	[PublicacionImagen] [varbinary](max) NULL,
 CONSTRAINT [PK_Publicacion] PRIMARY KEY CLUSTERED 
(
	[PublicacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Publicacion] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 23/11/2016 20:52:15 ******/
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
	[FechaAlta] [datetime] NOT NULL,
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/11/2016 20:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
ALTER AUTHORIZATION ON [dbo].[Usuario] TO  SCHEMA OWNER 
GO
INSERT [dbo].[Amigo] ([UsuarioID], [UsuarioIDAmigo], [FechaAlta]) VALUES (1, 1002, CAST(N'2016-11-17T22:20:01.013' AS DateTime))
INSERT [dbo].[Amigo] ([UsuarioID], [UsuarioIDAmigo], [FechaAlta]) VALUES (1000, 1, CAST(N'2016-11-23T19:34:44.320' AS DateTime))
INSERT [dbo].[Amigo] ([UsuarioID], [UsuarioIDAmigo], [FechaAlta]) VALUES (1000, 1003, CAST(N'2016-11-23T19:43:23.193' AS DateTime))
INSERT [dbo].[Amigo] ([UsuarioID], [UsuarioIDAmigo], [FechaAlta]) VALUES (1003, 1, CAST(N'2016-11-23T20:00:57.810' AS DateTime))
INSERT [dbo].[Amigo] ([UsuarioID], [UsuarioIDAmigo], [FechaAlta]) VALUES (1004, 1, CAST(N'2016-11-17T22:21:08.260' AS DateTime))
INSERT [dbo].[Amigo] ([UsuarioID], [UsuarioIDAmigo], [FechaAlta]) VALUES (1004, 1000, CAST(N'2016-11-23T20:47:49.213' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comentario] ON 

INSERT [dbo].[Comentario] ([ComentarioID], [PublicacionID], [UsuarioID], [ComentarioTexto], [ComentarioCalificacion], [ComentarioFechaActualizacion]) VALUES (1, 1, 1, N'Comentario 1 de la publicacion 1 del usuario Jose                                                                                               ', 2, CAST(N'2016-11-09T19:57:07.000' AS DateTime))
INSERT [dbo].[Comentario] ([ComentarioID], [PublicacionID], [UsuarioID], [ComentarioTexto], [ComentarioCalificacion], [ComentarioFechaActualizacion]) VALUES (2, 1, 1, N'Comentario 2 de la publicacion 1 de Jose                                                                                                        ', 3, CAST(N'2016-11-10T09:01:58.000' AS DateTime))
INSERT [dbo].[Comentario] ([ComentarioID], [PublicacionID], [UsuarioID], [ComentarioTexto], [ComentarioCalificacion], [ComentarioFechaActualizacion]) VALUES (3, 3, 1, N'Comentario 1 de la publicacion 3 de Jose                                                                                                        ', 1, CAST(N'2016-11-10T22:39:28.000' AS DateTime))
INSERT [dbo].[Comentario] ([ComentarioID], [PublicacionID], [UsuarioID], [ComentarioTexto], [ComentarioCalificacion], [ComentarioFechaActualizacion]) VALUES (4, 1, 1, N'una publicaion guacho                                                                                                                           ', 1, CAST(N'2016-11-17T21:02:59.163' AS DateTime))
INSERT [dbo].[Comentario] ([ComentarioID], [PublicacionID], [UsuarioID], [ComentarioTexto], [ComentarioCalificacion], [ComentarioFechaActualizacion]) VALUES (5, 1, 1, N'una publicaion guacho                                                                                                                           ', 1, CAST(N'2016-11-17T21:03:26.980' AS DateTime))
INSERT [dbo].[Comentario] ([ComentarioID], [PublicacionID], [UsuarioID], [ComentarioTexto], [ComentarioCalificacion], [ComentarioFechaActualizacion]) VALUES (6, 1, 1, N'OTRO COMENTRARIO                                                                                                                                ', 3, CAST(N'2016-11-17T21:08:31.840' AS DateTime))
INSERT [dbo].[Comentario] ([ComentarioID], [PublicacionID], [UsuarioID], [ComentarioTexto], [ComentarioCalificacion], [ComentarioFechaActualizacion]) VALUES (7, 12, 1, N'asdsad                                                                                                                                          ', 4, CAST(N'2016-11-17T22:26:26.000' AS DateTime))
INSERT [dbo].[Comentario] ([ComentarioID], [PublicacionID], [UsuarioID], [ComentarioTexto], [ComentarioCalificacion], [ComentarioFechaActualizacion]) VALUES (8, 17, 1, N'Juanca me encanto tu publicacion. Segui asi que creo que vas a progresar en esto que debe ser tu carrera en la vida.                            ', 1, CAST(N'2016-11-23T20:43:29.237' AS DateTime))
INSERT [dbo].[Comentario] ([ComentarioID], [PublicacionID], [UsuarioID], [ComentarioTexto], [ComentarioCalificacion], [ComentarioFechaActualizacion]) VALUES (9, 29, 1, N'muy bueno                                                                                                                                       ', 5, CAST(N'2016-11-23T20:45:36.813' AS DateTime))
INSERT [dbo].[Comentario] ([ComentarioID], [PublicacionID], [UsuarioID], [ComentarioTexto], [ComentarioCalificacion], [ComentarioFechaActualizacion]) VALUES (10, 29, 1, N'muy mala                                                                                                                                        ', 1, CAST(N'2016-11-23T20:45:43.813' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comentario] OFF
SET IDENTITY_INSERT [dbo].[Grupo] ON 

INSERT [dbo].[Grupo] ([GrupoID], [GrupoNombre], [GrupoDescripcion], [GrupoFechaCreacion], [GrupoFechaActualizacion]) VALUES (1, N'GrupoA                        ', N'Prueba de creacion de grupos                                                                        ', CAST(N'2016-10-19T22:01:35.983' AS DateTime), CAST(N'2016-10-19T22:01:35.983' AS DateTime))
INSERT [dbo].[Grupo] ([GrupoID], [GrupoNombre], [GrupoDescripcion], [GrupoFechaCreacion], [GrupoFechaActualizacion]) VALUES (2, N'Prueba A                      ', N'Descripcion del grupo 1                                                                             ', CAST(N'2016-10-26T22:14:35.930' AS DateTime), CAST(N'2016-10-26T22:14:35.930' AS DateTime))
INSERT [dbo].[Grupo] ([GrupoID], [GrupoNombre], [GrupoDescripcion], [GrupoFechaCreacion], [GrupoFechaActualizacion]) VALUES (3, N'grupo 1                       ', N'alguna                                                                                              ', CAST(N'2016-11-14T21:47:56.010' AS DateTime), CAST(N'2016-11-14T21:47:56.010' AS DateTime))
INSERT [dbo].[Grupo] ([GrupoID], [GrupoNombre], [GrupoDescripcion], [GrupoFechaCreacion], [GrupoFechaActualizacion]) VALUES (4, N'Prueba B                      ', N'Esta es la descripcion del grupo Prueba B                                                           ', CAST(N'2016-11-23T19:57:22.490' AS DateTime), CAST(N'2016-11-23T19:57:22.490' AS DateTime))
INSERT [dbo].[Grupo] ([GrupoID], [GrupoNombre], [GrupoDescripcion], [GrupoFechaCreacion], [GrupoFechaActualizacion]) VALUES (5, N'123465789a 123456789b 12345678', N'123456798a 123456789b 123456789c 123456789d 123465789e 123465789f 1234567987g 123465798h 123456789i ', CAST(N'2016-11-23T19:58:29.983' AS DateTime), CAST(N'2016-11-23T19:58:29.983' AS DateTime))
INSERT [dbo].[Grupo] ([GrupoID], [GrupoNombre], [GrupoDescripcion], [GrupoFechaCreacion], [GrupoFechaActualizacion]) VALUES (6, N'lksddflksd                    ', N'dfsdfsdfsdfsd                                                                                       ', CAST(N'2016-11-23T20:00:00.000' AS DateTime), CAST(N'2016-11-23T20:00:00.000' AS DateTime))
INSERT [dbo].[Grupo] ([GrupoID], [GrupoNombre], [GrupoDescripcion], [GrupoFechaCreacion], [GrupoFechaActualizacion]) VALUES (7, N'3234234243324                 ', N'sdfsdfsdfsfdasdfsdf                                                                                 ', CAST(N'2016-11-23T20:10:00.000' AS DateTime), CAST(N'2016-11-23T20:10:00.000' AS DateTime))
INSERT [dbo].[Grupo] ([GrupoID], [GrupoNombre], [GrupoDescripcion], [GrupoFechaCreacion], [GrupoFechaActualizacion]) VALUES (8, N'Laboratorio                   ', N'laboratorio A                                                                                       ', CAST(N'2016-11-23T20:46:22.530' AS DateTime), CAST(N'2016-11-23T20:46:22.530' AS DateTime))
SET IDENTITY_INSERT [dbo].[Grupo] OFF
INSERT [dbo].[GrupoUsuario] ([GrupoID], [UsuarioID]) VALUES (1, 1)
INSERT [dbo].[GrupoUsuario] ([GrupoID], [UsuarioID]) VALUES (2, 1)
INSERT [dbo].[GrupoUsuario] ([GrupoID], [UsuarioID]) VALUES (2, 1004)
INSERT [dbo].[GrupoUsuario] ([GrupoID], [UsuarioID]) VALUES (3, 1)
INSERT [dbo].[GrupoUsuario] ([GrupoID], [UsuarioID]) VALUES (3, 1004)
INSERT [dbo].[GrupoUsuario] ([GrupoID], [UsuarioID]) VALUES (4, 1)
INSERT [dbo].[GrupoUsuario] ([GrupoID], [UsuarioID]) VALUES (4, 1004)
INSERT [dbo].[GrupoUsuario] ([GrupoID], [UsuarioID]) VALUES (5, 1)
INSERT [dbo].[GrupoUsuario] ([GrupoID], [UsuarioID]) VALUES (5, 1004)
INSERT [dbo].[GrupoUsuario] ([GrupoID], [UsuarioID]) VALUES (6, 1004)
INSERT [dbo].[GrupoUsuario] ([GrupoID], [UsuarioID]) VALUES (8, 1)
SET IDENTITY_INSERT [dbo].[Publicacion] ON 

INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (1, 1, NULL, N'Primera publicacion                                                                                                                             ', CAST(N'2016-10-05T21:31:43.597' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (2, 1, NULL, N'SegundaPublicaion                                                                                                                               ', CAST(N'2016-10-05T21:55:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (3, 1, NULL, N'Esto va progresando de a poco                                                                                                                   ', CAST(N'2016-10-07T00:00:00.000' AS DateTime), 5, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (6, 1, NULL, N'asd asd asd                                                                                                                                     ', CAST(N'2016-11-09T22:39:15.693' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (7, 1, NULL, N'asd asd ads d sa dsda s                                                                                                                         ', CAST(N'2016-11-09T22:41:16.580' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (8, 1004, NULL, N'esto es una publicacion                                                                                                                         ', CAST(N'2016-11-14T21:43:41.250' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (9, 1004, NULL, N'esto es una publicacion                                                                                                                         ', CAST(N'2016-11-14T21:43:43.860' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (10, 1, NULL, N'1223344                                                                                                                                         ', CAST(N'2016-11-16T21:43:18.790' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (11, 1, NULL, N'1223344                                                                                                                                         ', CAST(N'2016-11-16T21:43:24.873' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (12, 1, NULL, N'OTRA PUBLICACION                                                                                                                                ', CAST(N'2016-11-17T21:08:41.590' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (13, 1004, NULL, N'Publicacion de prueba                                                                                                                           ', CAST(N'2016-11-17T22:01:10.803' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (14, 1, NULL, N'Esto es una publicacion de sdlkjfalkjsdlakjsddñlkajsdñlkjasdkjaskdkljasdlkjhakdsjhakdsjhaksj                                                    ', CAST(N'2016-11-23T19:35:48.163' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (15, 1, NULL, N'lkzdflskjfd                                                                                                                                     ', CAST(N'2016-11-23T19:35:56.297' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (16, 1000, NULL, N'slsdjflsdfjslkjlj                                                                                                                               ', CAST(N'2016-11-23T19:38:16.347' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (17, 1000, NULL, N'sdflsdjkflskdfjls                                                                                                                               ', CAST(N'2016-11-23T19:38:19.260' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (18, 1000, NULL, N'2349820349802938423j4k2hj34kj2h342                                                                                                              ', CAST(N'2016-11-23T19:38:23.583' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (19, 1003, NULL, N'sdñdfksñdlfsñdflkñsdlkfñsd                                                                                                                      ', CAST(N'2016-11-23T19:40:42.953' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (20, 1003, NULL, N'sdfñlkasñdflkñasld2345434534                                                                                                                    ', CAST(N'2016-11-23T19:40:48.333' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (21, 1003, NULL, N'34532                                                                                                                                           ', CAST(N'2016-11-23T19:40:51.017' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (22, 1003, NULL, N'2345234523452345                                                                                                                                ', CAST(N'2016-11-23T19:40:57.040' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (26, 1003, 2, N'asdakhsdlkajsdlkjasldkj                                                                                                                         ', CAST(N'2016-11-23T19:50:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (27, 1000, 2, N'239429384729834                                                                                                                                 ', CAST(N'2016-11-23T19:55:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (28, 1, NULL, N'Hola mis amigos, aca estamos testeando esta pagina para finalizar                                                                               ', CAST(N'2016-11-23T20:44:16.610' AS DateTime), 0, NULL)
INSERT [dbo].[Publicacion] ([PublicacionID], [UsuarioID], [GrupoID], [Descripcion], [PublicacionActualizacion], [PublicacionCalificacion], [PublicacionImagen]) VALUES (29, 1, NULL, N'algo                                                                                                                                            ', CAST(N'2016-11-23T20:45:06.407' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[Publicacion] OFF
SET IDENTITY_INSERT [dbo].[Solicitud] ON 

INSERT [dbo].[Solicitud] ([SolicitudID], [UsuarioID], [UsuarioIDSolicita], [SolicitudEstadoID], [FechaAlta], [FechaModificacion]) VALUES (1, 1001, 1, 1, CAST(N'2016-11-02T22:11:27.053' AS DateTime), CAST(N'2016-11-02T22:11:27.053' AS DateTime))
INSERT [dbo].[Solicitud] ([SolicitudID], [UsuarioID], [UsuarioIDSolicita], [SolicitudEstadoID], [FechaAlta], [FechaModificacion]) VALUES (2, 1, 1002, 2, CAST(N'2016-11-02T22:01:00.000' AS DateTime), CAST(N'2016-11-02T22:07:00.000' AS DateTime))
INSERT [dbo].[Solicitud] ([SolicitudID], [UsuarioID], [UsuarioIDSolicita], [SolicitudEstadoID], [FechaAlta], [FechaModificacion]) VALUES (3, 1002, 1, 1, CAST(N'2016-11-16T22:43:55.543' AS DateTime), CAST(N'2016-11-16T22:43:55.693' AS DateTime))
INSERT [dbo].[Solicitud] ([SolicitudID], [UsuarioID], [UsuarioIDSolicita], [SolicitudEstadoID], [FechaAlta], [FechaModificacion]) VALUES (4, 1003, 1, 2, CAST(N'2016-11-16T22:44:39.137' AS DateTime), CAST(N'2016-11-16T22:44:39.137' AS DateTime))
INSERT [dbo].[Solicitud] ([SolicitudID], [UsuarioID], [UsuarioIDSolicita], [SolicitudEstadoID], [FechaAlta], [FechaModificacion]) VALUES (5, 1004, 1, 2, CAST(N'2016-11-17T21:57:42.847' AS DateTime), CAST(N'2016-11-17T21:57:42.847' AS DateTime))
INSERT [dbo].[Solicitud] ([SolicitudID], [UsuarioID], [UsuarioIDSolicita], [SolicitudEstadoID], [FechaAlta], [FechaModificacion]) VALUES (6, 1000, 1, 2, CAST(N'2016-11-17T22:20:21.970' AS DateTime), CAST(N'2016-11-17T22:20:21.970' AS DateTime))
INSERT [dbo].[Solicitud] ([SolicitudID], [UsuarioID], [UsuarioIDSolicita], [SolicitudEstadoID], [FechaAlta], [FechaModificacion]) VALUES (7, 1004, 1000, 2, CAST(N'2016-11-23T19:34:54.067' AS DateTime), CAST(N'2016-11-23T19:34:54.067' AS DateTime))
INSERT [dbo].[Solicitud] ([SolicitudID], [UsuarioID], [UsuarioIDSolicita], [SolicitudEstadoID], [FechaAlta], [FechaModificacion]) VALUES (8, 1000, 1003, 2, CAST(N'2016-11-23T19:43:16.010' AS DateTime), CAST(N'2016-11-23T19:43:16.010' AS DateTime))
INSERT [dbo].[Solicitud] ([SolicitudID], [UsuarioID], [UsuarioIDSolicita], [SolicitudEstadoID], [FechaAlta], [FechaModificacion]) VALUES (9, 1002, 1004, 1, CAST(N'2016-11-23T20:48:06.297' AS DateTime), CAST(N'2016-11-23T20:48:06.297' AS DateTime))
SET IDENTITY_INSERT [dbo].[Solicitud] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([UsuarioID], [UsuarioNombre], [UsuarioApellido], [UsuarioEmail], [UsuarioPassword], [UsuarioFechaNacimiento], [UsuarioSexo], [UsuarioFoto], [UsuarioFechaRegistracion], [UsuarioFechaActualizacion], [UsuarioFotoActual]) VALUES (1, N'Jose', N'Lopez', N'joselopez@ymail.com', N'joselopez', CAST(N'1999-01-01' AS Date), N'F', N'1.jpg', CAST(N'2016-08-31T21:15:51.720' AS DateTime), CAST(N'2016-11-16T21:07:08.730' AS DateTime), 0xFFD8FFE000104A46494600010100000100010000FFDB00840009060713131215121213151615161717181715181715151815151715171715171617181D2820181A251D151521312125292B2E2E2E171F3338332D37282D2E2B010A0A0A0E0D0E1810101A2D1F1D1D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2B2D2D2DFFC000110800A8012C03012200021101031101FFC4001B00000105010100000000000000000000000300010204050607FFC4003B100001030204040307030303040300000001000211032104123141055161712281910613A1B1C1D1F03252E11442622382F1073392A2151643FFC400190100030101010000000000000000000000000102030405FFC400221101010002030101010002030000000000000102110321311213415161042242FFDA000C03010002110311003F00F3AE1353C0E100C4CCF5FF0093E887C3E88039959C1E41B1226C60C485D0708C0E7BB8C34FA959E5D37C7BD2CF0BC255AA48A79001BB8900F6B2BCE655A722A32C37690E1F7F820714AE6853968802C00EBA4F45934FDA1269C3DD2EB82CCA6EDFDCD337EA0C79ED1ACAF8D7EA63D56BD7ACD033130355CCF15A8DA9E36030DB136DF491AC75407D673CE4638E5D9AE76B7DB31F825867536C17833CB98E8B4C71D76CB3E4DF4A108B86B15AECE10D739DEEDC2AB0E869905ED9889A6E82409831759CD688B79AAB59C9FD1187C24CE960A2C93FA89B99D50AA3A042907A35B3B9696DEED2EAAD674994D29226120BC99545B653512A2F7C2A46CEFAB0B6FD8CE2987A5882EC5B65858E687C39D91C400096B6F11370247CB9B95263E0CC69CD01ECDC0F8636A383062057A45F3EF699CD4CD327FD4CCD2086BC9830772046EB9FF6B1BEEF0EEA8CF79409229060814EBD32F7407B223334075B60D045B4E0E87117D278A941CEA3507F753739A4F2D0FC345678B7B4188C4860AF533E49CBE16B6E752728126C04FF0029081D3A90E13A1B751CA54B12602A42ADA1356AA4A9D34FAE9066A8B2912C2D6E56BC54939AE1CC70D8B7FB9A768BF391A2251C2553FA69543D98F3F209D4C532526852AAC2D30E05A7938169F42A7876DE790FA80A9023E8B6D16536D303AA1C5D3948E099BF250DCC5084E1257A688D52054C28BE9C5F64D361E54A9B09200D4A1422E1DF06489B5BBFE4A648A45AA2ED53B4A01E1384E1C91083A40A235A5D743026CADB1B000411B0B86CEF81A0D5767C33C03407A7258DC3688637EAB4F0B55C0F8353AF35CD965BAECE3C3E676BF55F4DDFA983C81FA2054A7460834811D5B6F58B29BF1153623CFF00840C462EA0692408D246BE8614F6BE9CC71EE1ECA643E9D81DA6C0F45961B3E4AF716A82AD41EEDA736844449BECA8D2B187036D46856F86FE7B72F26BEBA3BB0875B742A544C59DA738BF93BEE8AEAE0585FBEDDBAA0D4706990E713CDA488E8AAF699746A94C7348051F7F3AFAFF0001482A89A493D22B5B0581194389049E9A256E8F1C7E99868540DCC58E0D3A3A0C7AECA9BCCAEC3DE621A08863DB1FA6F9A3A5AFD97378F7B1CEF008E77041326E214E395ABCF093C070D44104B8DBF3450A20070274126E09048121A63626DE6A41A06A9F2855A44BAB106B64CC28395AA8F936DC831DF5F8ADCF617D957710C5B688914C43AA3B93790EA6E882B3B82FB3D5F13269B0E51ABA0FC3995A789E08CA1032973B72EBDFB68BDF3DA2A386C0E10329B1AC0043408060085E15C7B890738C7F09DB048C9AB8A20D8C76B7C91B0FED1626919A55EAD33CDAF70F583759951D250CA5AD8DBA6ADEDBF10AADC95314EA8DFDAF6D2703DE58B29C731934D92776B724FF00E30167072B787C496905465B9E34C7E6FAB1430EC2E8A85EC6F30D0F8F2B485ABFFD61951B9A9570E1CF28F422C41EEAEE13DA1A2EA469D5C3B1C7678B387DD65BB1229BF3D139798D9C39386EB9E72E76EACD3A6F171C9BF58FC4786D4A27C425BFB869E7C8AA72BB5A18C155B9A3A39BAC1DFB858DC43820266958FEDDBCB92DF1CF7D5619F16BBC7C628520146AD2730C38107AEFDB9A76B968C42364E04EEA35B52AD70CA59899D37FA2296337740062594AD2A58702445E7CA2FB476BA356A4088097DB4FCD900291D16BE169868D2FF3FCD7C966633527AA265BA5971EA6C3A62E1597D5843C39116D546B3493654CDB782C40A9669F17EDDFCB9AB2D79FDF97E1F15CA38C26AD8873FF005389EE49F5E6B2FCDB7EB74E8B1FC61AD05B4DC5CEFDD623ACACD1C66B6E736FA69E8B31CDE4A32473553089BC95B7C1A897D5151D3AF2B1D64FC16871DE08F2EA95A9E52D07C4D9F10B09311A6FAA27B32E1EEC491E3044F2703A7CBD4ABF5F1504168F18B3DA7703E647C96795BF4D71C65C7B70B9B54C5C23AFCFBAD4E2980066A531E1372DE4778E9D3659058B5976C2CD123D3D1428B44DE63A6B1BC2BBC3CB49B8BEB0A8820D95D230CD30400EB5DBCFA7759C294924F211F1954F155DD4DC329CA7E9D967976D30BF2DBC2E3586CD25A46AD74823B83A792E7788D6CD51C600BEDA77562BF13CEDCAF634BB67684763A859C354638EAEC679EE6851489D6077204F6949D4E07E7CD418E12735FC260DFF0056A0A261EB104418F903A4DD5B38261EA010266768D3AAF5EFFA598AA785A65E6333EE7CC00D1E9F55E64DA546AB33DDAF8D068E74F2E7D42F42F67B81E28D3157DCBBDD5C9792D688DCC133F0538E5ED6B71D6A2EFB6BC42A56CCF71B116E835FA2F29C699715EB1ED6F13C39A0298AB4C9B6844891F9F05E4F8EA833182B2E2CAE57B69CB8CC64D2A427CA8B4DA39A20A4BA1CAA7953157B88E19B4E32BDAF99BB74DA0F3DF4304468A95269710D11279981EA95A70EDA88ADAA4A3D5E0989682EF72F2D1A96C5403AF8098548289F37C697EB1F7A6B70CAF91C391B1FA1F55B62A106792AF80E0E5F44D5170D027CCC028D5584784EB6539CFEB5E1CB7B949F4455B1DF5044807A75B7C160718E18298CCD36E5B742174B9B209B0B0BCEC0837EB21735ED0624B9CD13B69CAF209EA6E5185B6AB931C263E76CA2E957B8756001117E6B3DA14E93E0ADB29D3971BAADCA26E4A1E2B14D6EBAF2545B8E8361F1B9B5BE2AA543266E6567316B793AE969DC41DB40F8A03EB4EA840270AE48CAE56A62D709C54775480B219309A4C5EA2022B69E6D36E89EA518D41096CD175A2F2A05C88DA3A1D4227F4E11B0270DE2069C8D89907F6BB9C6E085B3FD77BC8CC20FEFD8EB6F88D7AAC96D06C5C4A1BA9BDB66CE5D8159DD5AD66E4D362A8A770F10ED8C919BA8E6550145A4FDE155692753EB288DAB1D52B8D39941B19866820B607455E853878213BAB126546A3CF9A78CB0B2B326D3345438AD09666DC7DD1F0F8811E23F62A755D22CA90C06B86E911D6CB670F8163DE1AE1A9BC58E9D156C77047D3922ECFDDC87F9468A90A05969DB9A950A599C1B204EE741CC9E8159C3F0F716E66B4B9C1D0E6CEDB1E9AAD9345AD6FF00D86B730832E92474B9F985372D34C70DB7F83711E0941A056189AEF1FB406539D881209EE4950E27ED4E08B5CCC33ABD3A6ED69973C34F47016779AE0310D6CF8663AAE8B82619858D76561CBFABF4CEBA945BA8AC65CAE94ABE3A99D081FC2AA0B5DFDDF9E8BA4AD8F697656869236005FE0ADE1A8B5E40A945B279B1A47C429FB57E5B71E70BC8B7FF00367C89949D87A8DD9C3AC18F5D177E7D9EC3BBFF00C983AB4167C5A42CDE25ECA31833D373D900927366D1A4EE2751CD399C178329DB8D873B493D05FE09530AC6218F6BCEE038C12407100D8E6E764D50971926735E74279CFF0096B2AFB63D2DE038DD5A46C4387ED7B43C1F5BFA109B1D8F656398D30C77F8B9C5BE41E491EAA8D40850B3FCF1DEE7AD3F5CF5F36EE3B4F63F89019A83F761CA635DF29EB611D96CFB7341B4EBD373440A987A3523A96E577C5A572DEC6D467BF60A8246669F470CC3CDB9879AEAFF00EA1436BB2948FF004698A7323C403DEE69F36B82794E871DFF00BB94C5D70087543617E427B05CCD7AA5EE2E3B95B9C6007D301A4174C91D2173E4A38E7439AF69D3AB97607B8908956B35C3FEDB5A79B4B803DDAE247A42AE902B465B1004EA19934A0245295194E80202A41C10653CA02E52A858223BF5521541B1D20FE04A8622D053BCB4F69F4FCBA930A9183AA95475D214473EC7D3D10CEA904DF8841762145D0A06A8E48D1EE9C54BDD103C7F0AA975D15AE54958F7BC923A42097A9352D1CABF81ADFDA75DBECAC5466B16E8B283B7DC2D80F900C25441385B26AB75DC9E90D31A7585BD5E8CC0F3E467D2FA058FC21A4B891CA2DA926F03C96D556930649DB6F8264E7B1DC1DA097873D84031044181A74F5591470CE7DC9262D7337E4BB2719043BC409E51D973BC488A4F25B04385DA445E22446852B3AE958D9BED958D78D872F25D17FD3FE1C6AD575425C194C00E8061F983BC25C3B030B947B89BAF67E0DC3BFA5C050A40789E3DF558D4D478103FDADCADF259F25D63A74FFC7C7EF937FC8C8E2DC11951B943434037204983CBF9E4887863035ADA64D9A1A6608303575A27A8BAD5FEA7C595C32CEC6CADD47340B4405CDF596F4EFF00CB0F5430B87CA0099B6A8B5E84883BA3BB10C02DC9557E224765A46793CDA957A10F3569BDEFCDE0CAE0185A2D0FDE7A85418F24104CBACE07D0387A069FF6A30A24B0B80B34349E92401F128783C37BC7650E6B5D04B64C071FD80F33B765D7BE9E56BB46B9DFD7BA012ACE21C58EC955995C35077F307E2104E53A5BCE7E690B04C1D6CAE0568FB4DC49F5EA0A8E372D026D70D6B5A0FF00EBBACCA4C1CE3C91F88344308336F4213257A6E8D4AAF55B7474B2A5B5695C3145C211CB542A14F69D04924926474E1453A01D3A8CA740143872F43F75291CCFA26CA0E83E2A0F03610A4D30EDA536742290404A39A1B88D948A8D93066B653B0A953374ABB60CA649E6290286D2A61231256BD236BF21E8B142DBE112FAAC04786743FDD009161A09039CA471ADC3E8599B4DFCEF3F55A4CB1BF5BACEA95E9973836A325A6633B649FEE1ACD8CFAAB4EA81ED0E6CF51C8EE80B551A152C6F0FA752EE682A4CA86518BE534B8FE29846D27B806C88044DC41FE64792E947B5F5714E2035C32B67235D97C206C7520720A9719A2D21A49F102409DC1179F41F850B819F7555858D05D9C402068FF078A6D1758E7A7570E57F8DCE1150D42092ECA2F7739DD44171256E36A4883B159D89A15DAE2D3EEC5CC86905827F6C0D11709984879136BF311F83C9636EEEDDD25C7AABA697A21F12AA29D27BB935DEB165618F80B97E27C4FDF566E18086170CE79864B9CDED6025548CF3CB519F86A192831AEB7F5351AC9D32B20E53DE7C406F656BDA2E19469E1C0A74DA082DFF00535A84C8065DEA7E8A87B5B8E0F7B69B40865FFDD7007903F159989C7552D0D7BDCE8B804CC6D2799EEB6C65BAAE3CF3C71DE3ADAB55379792E71E77F59426519B9803B6BD829D389BDCEB1D372ADD33B46BE503D2FDD6F239B68D3C18FDA3D4EDB4CA96230CD0D9020817FAF62A4E78021B26E0F5B7C87DD4CB1CE9D819813371CD2C958B39C5292AD716C20A2FC81ED7C069CCD92D25CD0EF0C8062F171A82AB06A855A70545F4E475563074054741706B7727E8AE63306D65D8F0E1CC1123B8DC750A6E5AAA937182424AD54A13A0BAAA4459692ED9D9A2492490474D29A534A00AD74270F2A253B106785207F225252CC2120810398F8A190110426791B0404696A8EE4065927494C907344D95AC3B5A6C665564E1161C690A01B75658CCAD2EE84FC2CAA51A80B3C4815B18E88DB4959B5B648AA4A763C8D091D891F25094EB462726F3BF3DFD56BF0EE3955B2D39AA690091239F88B4959B428176F0B57081B4F4BF327F2CA72BA549FE5ACCC339EEF79508D0C34CC3771A0BF75998825AFCE1DB6A3622E115B8F738459C06D196DC8386C83C62A4B7C2C2DE7BFA1FE161F396F75BFD63AE9DE70FE1B51AC639EEBB98D74722E68244742559AD87DC6AB9BE1DED987347BD195D004EC606CACBBDA363F4708F82CFE32DBB272E1AF5A955D0355CB718C5B299269347BD7EE05EFAB8F2FA989D13E3B8D4821A7CCD87F2B9DAB5F58324EAE3A9EDC82DB0E3FF002E6E5E79E4F49DE1924E67EE7583F5282CA65D2761A951D6C8F9205FC86E4ED3F05D11C47A6D113200F8F4B6FF00CA72741A01E4862499D3EFF7447363531F3F4D93FA3D27980DEFD3B1FBC79A232A0E7F7FE554690541E60A8B5A48B98AA5203C0E84F35549D94E95506DA7D55CE11401ACD93A4903991B7D7C94DBA1ADB6784F0486F8F5372397495A1FFC75300DACAFD3A663A959FC571ED6360104E91CCFF0B92E59655B4C71C7D51C4E1982D4DA1AEE9691BE659DC4B04DA94C16822A099248BC6DDB91D9130D8ACC637DFAA2621F161AFC8AD26F1A3732F3C7264265BD8FC00A9E26407EE3491CBBF2598FC111B1B6D0BA2672B0B858A909C523C95B981609831C6E11B2D2BA75109C2A249326489403A4904A100A5294C5310809265148B9004A798F85BDCF4EEAFE1D82200FF955F00F111BEFD55A020F7486D07D10E8046965431144B4C6DB1E6B4CEA7AFCD2AA0102798FCF825BD12586A10C1E8A6CC30D482E1F0FE519AFF081C95AA4410B3B92F5D29D4C4002008450299A65CE924D9A24C98E8344D8BA009CD23947251A05BEF29F269131A90354FAB063E89FD3B3365768D02DD62FF158AC11500D3C513136262616A62B181C1C4889E563AF3F359C1EE36077DEE963B8ACB54279275510D5AB5307929976F97CE4ACFA146F3D169B468995328802F3727E1E4998CDCFE7F09E44A6CDB04F769086A4586BCFEDC909C0F2F35670F879BEC37E67A2BF468B4013D66267E298F594CA2E898F97E04C6375AB9331B80477F91F243AF424EF6E77F44747AB194F6423D0791067CF704255A9E531B7E69CFE69533E8A328AC7D6CD0E3B504B492ECD17DC1E83455B1FA66DC954DAE20C8457BF396B5BB7CD44925D9E5B1F87BA24C79A34A361B0F02EA356909E435ECA6DDD5E3D746C2919813A7E7AA2E3B04F702F6006361A9E642C8C5562F302CD1B0B4F52A584C6BE9383812E6EED27E5C91F345CA78CFA9535FCBA76D6CA00804EA66753F816C718C3B6B37DFD31E2FEE8FEFE663670F8AE7CB96B8D9632A64A54414A55A049510A20A7404A52CE8698B90042E4D9D0CB9320086A28048052080930C1DFC95FC35796DE2C7A7CB58EAB3C26406D4C8B28671980EF6596CA8468614BFA939813B29B0DB79919A0891C8AAF83A80B9BCA517178868795959DE9A7FE4D5DDB42083FAA1354C5B4F3EEA06A8261B2493C8FD5544CB0D9BF709E73BFE7D11387B1B98902C875A9168924CF2B7C6C8984303BAA11A3C44CB0AC6F76498165AD9A6CABE2A81025BBEBD3AA14CA7B1C0C6A07A23D1A52401B908952980D9E5F15A1C1A8090F226089FA9F9FA2A88D2C8A596DAC0B83A76BEFD90AA8824C448062E2DBF876E48B89AB7E5132660F6F4F49F4A958891B5AC64F945AFDFBAA2100DC1B729FC161F2517349120E9DBE5C931205C82EE4620733E7AA8B4119B58D4581F5941ECF5EE34D4EF6DF53F7542BE1E2ED20EE46E3A8E7E4AF61C9CBE2205E23FB8023BE9053B859DB831A01D4C94B4198D74A157244381823757715868199BA0D7F3E6B3F12EB28D6AAB7B8E8F0B882E6B4937207AAA3C4F14490D1611EB7D7B2B1C0A987D382EB8B103F511F9BAB7C50332FBBCA3BEE23AF359DD4A24BEB270CF6B4C16820822F1A9EA77FE149F87CA36360626F063D0DC48559F4CB2C6ED3BFD11640119891B026C8B17329668F49CEA47332E0EADD3D11EA70763CE76B9CD9B9000224DCC7255C89883AAD001A40FD660459D03E48FF0065A8E4E0A50513326CEB66288694A0A907A67261184F0904900F098B53852404213A4E4C8074924900A533829252802616BE53F5FBF457EAE2A47880B7222FFED37F49594E0A295872B5E8E21A775729566B776F790B9D0881897C86AE32B073C069046E469CF551C3BF6DF6FB20615B645AADDC7E754951A745031B5F64D4AB7864FF00CAA752A4A676A6F3300773F40B6E810C6006F3CAE624CF9EAB1308D975BB790D3E4B498E9D0DC8DBA4C6BA5A3E0AD1B3D5CED243ADDA09B73F9A77B065CB2F3D6C40302D3A11123C94801E011A0368B9EFCB6BA881008008BC8DEDCFAF2EA8059CE6BB4696E8398B6EA159E64EBE1111949DCEBC8DCDD37BC39B912646C5C2E0F4DF64CE791020013B74F4F521320DD59D1CEF3783B4091E49C63012341B5C1B0E8079A8559B9D1BA0F9D86E2CA0E60B9260EC6EDF16F364C0EE226091D0DAE3CFCD676368117D8DC77DD591507E97891B11323AFE59471353C107B8FCDBFE54E50E23C369CB641823756CE21EE701AFF9684F759F82A8435C05EE15B0FD1CCDB51D7F3759D0B4FCCE1072F9FDD03DD8D9AC31CE41F2B0956F0F45D51B20491AF7EBF7417532D8736E370763B8B69DD41EEC3E129B08FD594F5B83D88D3D15F7D3A6227369FDA447C564D8996F85DB81F9753CFCFE647C12B8ABF460BA991B28FBB3C8A492DD9935879220C39E69D24CB609109E05BF212492331481492404828A492010520924804130492404D281A424926110C454924A859A2765618924A5A442B986C0D9576EC9D2444D5CC2819A3FC48E7B8BF710ADC4024D8DA041E5303F36F4492D2A6094483040D2CD17CDF3B5BE8A150C80349B1DEF13DFF35292491A0DB180791D2C446A6449DD2224136370018D358D4881AD8A492649B06B733CCCD8F6D3F3A283CDAD79E932D063F5193A734924045ED041E4644F5D40D3A1F4954F16D96DF507E7AFD3D12492A61E00662E1CFF002CAC650D70ED6EE124947F4AB47865721FD1C0FA8D0AB759A33661BEA39A492C32F5AE3E32B14D0D796EA76E883FD4B9B6227AA492D67719DEABFFD9)
INSERT [dbo].[Usuario] ([UsuarioID], [UsuarioNombre], [UsuarioApellido], [UsuarioEmail], [UsuarioPassword], [UsuarioFechaNacimiento], [UsuarioSexo], [UsuarioFoto], [UsuarioFechaRegistracion], [UsuarioFechaActualizacion], [UsuarioFotoActual]) VALUES (1000, N'Juanca ', N'a', N'a@a.a.com', N'1', CAST(N'2016-01-01' AS Date), N'M', NULL, CAST(N'2016-11-02T21:55:11.167' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([UsuarioID], [UsuarioNombre], [UsuarioApellido], [UsuarioEmail], [UsuarioPassword], [UsuarioFechaNacimiento], [UsuarioSexo], [UsuarioFoto], [UsuarioFechaRegistracion], [UsuarioFechaActualizacion], [UsuarioFotoActual]) VALUES (1001, N'Jorge', N'b', N'b@b.com', N'1', CAST(N'2016-01-01' AS Date), N'F', NULL, CAST(N'2016-11-02T22:09:20.520' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([UsuarioID], [UsuarioNombre], [UsuarioApellido], [UsuarioEmail], [UsuarioPassword], [UsuarioFechaNacimiento], [UsuarioSexo], [UsuarioFoto], [UsuarioFechaRegistracion], [UsuarioFechaActualizacion], [UsuarioFotoActual]) VALUES (1002, N'Carlos', N'c', N'c@c.com', N'1', CAST(N'2016-01-01' AS Date), N'M', NULL, CAST(N'2016-11-02T22:10:07.073' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([UsuarioID], [UsuarioNombre], [UsuarioApellido], [UsuarioEmail], [UsuarioPassword], [UsuarioFechaNacimiento], [UsuarioSexo], [UsuarioFoto], [UsuarioFechaRegistracion], [UsuarioFechaActualizacion], [UsuarioFotoActual]) VALUES (1003, N'Alberto', N'd', N'd@d.com', N'1', CAST(N'2016-01-01' AS Date), N'F', NULL, CAST(N'2016-11-02T22:10:22.680' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([UsuarioID], [UsuarioNombre], [UsuarioApellido], [UsuarioEmail], [UsuarioPassword], [UsuarioFechaNacimiento], [UsuarioSexo], [UsuarioFoto], [UsuarioFechaRegistracion], [UsuarioFechaActualizacion], [UsuarioFotoActual]) VALUES (1004, N'asd', N'asd', N'asd@asd.com', N'asd', CAST(N'2009-01-01' AS Date), N'M', NULL, CAST(N'2016-11-14T21:43:28.373' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Amigo_FechaAlta]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Amigo] ADD  CONSTRAINT [DF_Amigo_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Publicacion_PublicacionCalificacion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Publicacion] ADD  CONSTRAINT [DF_Publicacion_PublicacionCalificacion]  DEFAULT ((0)) FOR [PublicacionCalificacion]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Solicitud_FechaAlta]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Solicitud] ADD  CONSTRAINT [DF_Solicitud_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
END

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
/****** Object:  StoredProcedure [dbo].[AmigoInsert]    Script Date: 23/11/2016 20:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AmigoInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[AmigoInsert] AS' 
END
GO

ALTER PROCEDURE [dbo].[AmigoInsert]

@UsuarioID INT,
@UsuarioIDAmigo INT

AS

INSERT INTO Amigo (UsuarioID, UsuarioIDAmigo, FechaAlta ) VALUES ( @UsuarioID, @UsuarioIDAmigo, getdate() )
RETURN SCOPE_IDENTITY()


GO
ALTER AUTHORIZATION ON [dbo].[AmigoInsert] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[AmigoInsert] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[ComentarioInsert]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  StoredProcedure [dbo].[GrupoInsert]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  StoredProcedure [dbo].[GrupoUsuarioInsert]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  StoredProcedure [dbo].[MensajeInsert]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  StoredProcedure [dbo].[PublicacionActualizarFoto]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  StoredProcedure [dbo].[PublicacionInsert]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  StoredProcedure [dbo].[SolicitudBuscarPorUsuarioID]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  StoredProcedure [dbo].[SolicitudBuscarPorUsuarioIDSolicita]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  StoredProcedure [dbo].[SolicitudInsert]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioActualizarFoto]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarEmail]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioBuscarPorEmailPassword]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioInsert]    Script Date: 23/11/2016 20:52:15 ******/
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
/****** Object:  Trigger [dbo].[GenerarAmistad]    Script Date: 23/11/2016 20:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[GenerarAmistad]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		SciNet
-- Create date: 
-- Description:	
-- =============================================
CREATE TRIGGER [dbo].[GenerarAmistad] 
   ON  [dbo].[Solicitud] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @SolicitudEstadoID INT
	DECLARE @UsuarioID INT
	DECLARE @UsuarioIDAmigo INT

    SELECT @SolicitudEstadoID = inserted.SolicitudEstadoID, @UsuarioIDAmigo = inserted.UsuarioIDSolicita, @UsuarioID = inserted.UsuarioID FROM inserted;

	IF @SolicitudEstadoID = 2
	begin
    -- Insert statements for trigger here
	--
		 
			--exec AmigoInsert(@UsuarioID, @UsuarioIDAmigo)
			INSERT INTO Amigo (UsuarioID, UsuarioIDAmigo, FechaAlta ) VALUES ( @UsuarioID, @UsuarioIDAmigo, getdate() )
		
	end;

END
' 
GO
ALTER TABLE [dbo].[Solicitud] ENABLE TRIGGER [GenerarAmistad]
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Solicitud', N'COLUMN',N'SolicitudEstadoID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Pendiente
2=Aceptada
3=Rechazada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solicitud', @level2type=N'COLUMN',@level2name=N'SolicitudEstadoID'
GO
USE [master]
GO
ALTER DATABASE [RedSocialORT22AGrupo02] SET  READ_WRITE 
GO
