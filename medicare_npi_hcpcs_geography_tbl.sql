/****** Object:  Table [dbo].[medicare_npi_hcpcs]    Script Date: 2022-07-07 11:41:43 ******/

GO

SET QUOTED_IDENTIFIER ON
GO

  If OBJECT_ID('medicare_npi_hcpcs_geography', 'U') IS NOT NULL
      DROP TABLE [medicare_npi_hcpcs_geography]
   GO

CREATE TABLE [dbo].[medicare_npi_hcpcs_geography](
   Rndrng_Prvdr_Geo_Lvl [varchar](20) NULL,
   Rndrng_Prvdr_Geo_Cd [varchar](5) NULL,
   Rndrng_Prvdr_Geo_Desc [varchar](100) NULL,
   HCPCS_Cd [varchar] (5) NULL,
   HCPCS_Desc  [varchar](500) NULL,
   HCPCS_Drug_Ind [varchar](1) NULL,
   Place_Of_Srvc [varchar](1) NULL,
   Tot_Rndrng_Prvdrs [int] NULL,   
   Tot_Benes [int] NULL,   
   Tot_Srvcs [numeric](30,10) NULL,   
   Tot_Bene_Day_Srvcs [int] NULL,   
   Avg_Sbmtd_Chrg [numeric](30,10) NULL,
   Avg_Mdcr_Alowd_Amt [numeric](30,10) NULL,
   Avg_Mdcr_Pymt_Amt [numeric](30,10) NULL,
   Avg_Mdcr_Stdzd_Amt [numeric](30,10) NULL

) ON [PRIMARY]
GO


CREATE INDEX medicare_geogrpahy_geo_idx on [dbo].[medicare_npi_hcpcs_geography] (Rndrng_Prvdr_Geo_Lvl, Rndrng_Prvdr_Geo_Cd);
GO   

CREATE INDEX medicare_geography_hcpcs_idx on [dbo].[medicare_npi_hcpcs_geography] (HCPCS_Cd);
GO   