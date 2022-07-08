/****** Object:  View [dbo].[medicare_npi_specialization_hcpcs]    Script Date: 2022-06-08 14:17:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

If OBJECT_ID('medicare_geography_summary', 'V') IS NOT NULL
   DROP VIEW [medicare_geography_summary]
GO

CREATE VIEW medicare_geography_summary AS 
SELECT [Rndrng_Prvdr_Geo_Lvl]
      ,[Rndrng_Prvdr_Geo_Cd]
      ,[Rndrng_Prvdr_Geo_Desc]
      ,[HCPCS_Cd]
      ,[HCPCS_Desc]
      ,[HCPCS_Drug_Ind]
      ,[Place_Of_Srvc]
      ,[Tot_Rndrng_Prvdrs]
      ,[Tot_Benes]
      ,[Tot_Srvcs]
      ,[Tot_Bene_Day_Srvcs]
      ,[Avg_Sbmtd_Chrg]
      ,[Avg_Mdcr_Alowd_Amt]
      ,[Avg_Mdcr_Pymt_Amt]
      ,[Avg_Mdcr_Stdzd_Amt]
  FROM [dbo].[medicare_npi_hcpcs_geography]
GO