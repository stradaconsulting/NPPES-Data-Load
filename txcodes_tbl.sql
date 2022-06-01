---------------------------
--  txcodes
---------------------------
If OBJECT_ID('txcodes', 'U') IS NOT NULL
   DROP TABLE [txcodes]
GO
CREATE TABLE [dbo].txcodes (
	Code NCHAR(10),
	Grouping NVARCHAR(80),
	Classification NVARCHAR(110),
	Specialization NVARCHAR(80),
	Definition NVARCHAR(MAX)
);
GO
CREATE INDEX txcodes_idx on [dbo].[txcodes](Code);
GO
