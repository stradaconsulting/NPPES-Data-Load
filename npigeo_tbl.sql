USE NPPES

-----------------------------
--  npigeo
-----------------------------

If OBJECT_ID('npigeo', 'U') IS NOT NULL
   DROP TABLE [npigeo]
GO
CREATE TABLE [dbo].[npigeo] (
	[NPI] numeric not null,
	[Matchflag] varchar(20) null,
	[Matchtype] varchar(20) null,
	[Longitude] float null,
	[Latitude] float null
);
GO
