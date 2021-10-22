USE [galerie_sztuki_lab1]
GO
ALTER TABLE [dbo].[wystawy] DROP CONSTRAINT [FK__wystawy__ID_gale__5A4F643B]
GO
ALTER TABLE [dbo].[transakcje] DROP CONSTRAINT [FK__transakcj__ID_au__5D2BD0E6]
GO
ALTER TABLE [dbo].[pracownicy] DROP CONSTRAINT [FK__pracownic__ID_wy__731B1205]
GO
ALTER TABLE [dbo].[pracownicy] DROP CONSTRAINT [FK__pracownic__ID_ko__75035A77]
GO
ALTER TABLE [dbo].[pracownicy] DROP CONSTRAINT [FK__pracownic__ID_ga__740F363E]
GO
ALTER TABLE [dbo].[pracownicy] DROP CONSTRAINT [FK__pracownic__ID_au__7226EDCC]
GO
ALTER TABLE [dbo].[konserwacje] DROP CONSTRAINT [FK__konserwac__ID_ko__78D3EB5B]
GO
ALTER TABLE [dbo].[konserwacje] DROP CONSTRAINT [FK__konserwac__ID_dz__77DFC722]
GO
ALTER TABLE [dbo].[klienci] DROP CONSTRAINT [FK__klienci__ID_tran__7CA47C3F]
GO
ALTER TABLE [dbo].[dzieła] DROP CONSTRAINT [FK__dzieła__ID_wysta__62E4AA3C]
GO
ALTER TABLE [dbo].[dzieła] DROP CONSTRAINT [FK__dzieła__ID_trans__61F08603]
GO
ALTER TABLE [dbo].[dzieła] DROP CONSTRAINT [FK__dzieła__ID_galer__63D8CE75]
GO
ALTER TABLE [dbo].[dzieła] DROP CONSTRAINT [FK__dzieła__ID_artys__60FC61CA]
GO
ALTER TABLE [dbo].[bilety] DROP CONSTRAINT [FK__bilety__ID_wysta__689D8392]
GO
ALTER TABLE [dbo].[aukcje] DROP CONSTRAINT [FK__aukcje__ID_galer__5772F790]
GO
/****** Object:  Table [dbo].[wystawy]    Script Date: 20.12.2020 11:36:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[wystawy]') AND type in (N'U'))
DROP TABLE [dbo].[wystawy]
GO
/****** Object:  Table [dbo].[transakcje]    Script Date: 20.12.2020 11:36:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[transakcje]') AND type in (N'U'))
DROP TABLE [dbo].[transakcje]
GO
/****** Object:  Table [dbo].[pracownicy]    Script Date: 20.12.2020 11:36:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pracownicy]') AND type in (N'U'))
DROP TABLE [dbo].[pracownicy]
GO
/****** Object:  Table [dbo].[konserwatorzy]    Script Date: 20.12.2020 11:36:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[konserwatorzy]') AND type in (N'U'))
DROP TABLE [dbo].[konserwatorzy]
GO
/****** Object:  Table [dbo].[konserwacje]    Script Date: 20.12.2020 11:36:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[konserwacje]') AND type in (N'U'))
DROP TABLE [dbo].[konserwacje]
GO
/****** Object:  Table [dbo].[klienci]    Script Date: 20.12.2020 11:36:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[klienci]') AND type in (N'U'))
DROP TABLE [dbo].[klienci]
GO
/****** Object:  Table [dbo].[galerie]    Script Date: 20.12.2020 11:36:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[galerie]') AND type in (N'U'))
DROP TABLE [dbo].[galerie]
GO
/****** Object:  Table [dbo].[dzieła]    Script Date: 20.12.2020 11:36:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dzieła]') AND type in (N'U'))
DROP TABLE [dbo].[dzieła]
GO
/****** Object:  Table [dbo].[bilety]    Script Date: 20.12.2020 11:36:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bilety]') AND type in (N'U'))
DROP TABLE [dbo].[bilety]
GO
/****** Object:  Table [dbo].[aukcje]    Script Date: 20.12.2020 11:36:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aukcje]') AND type in (N'U'))
DROP TABLE [dbo].[aukcje]
GO
/****** Object:  Table [dbo].[artyści]    Script Date: 20.12.2020 11:36:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[artyści]') AND type in (N'U'))
DROP TABLE [dbo].[artyści]
GO
