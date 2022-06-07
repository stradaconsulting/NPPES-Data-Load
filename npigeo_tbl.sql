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

CREATE INDEX medicare_npi_idx on [dbo].[medicare_npi_hcpcs] (Rndrng_NPI);
GO



-----------------------------
--  npigeo_stage
-----------------------------
If OBJECT_ID('npigeo_stage', 'U') IS NOT NULL
   DROP TABLE [npigeo_stage]
GO
CREATE TABLE [dbo].[npigeo_stage] (
	[NPI] numeric not null,
	[Matchflag] varchar(20) null,
	[Matchtype] varchar(20) null,
	[Longitude] float null,
	[Latitude] float null
);
GO