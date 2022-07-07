/****** Object:  Table [dbo].[medicare_npi_hcpcs]    Script Date: 2022-07-07 11:41:43 ******/

GO

SET QUOTED_IDENTIFIER ON
GO

  If OBJECT_ID('medicare_npi_hcpcs_dme', 'U') IS NOT NULL
      DROP TABLE [medicare_npi_hcpcs_dme]
   GO

CREATE TABLE [dbo].[medicare_npi_hcpcs_dme](
   [Rfrg_NPI] [numeric](18, 0) NULL,
   [Rfrg_Prvdr_Last_Name_Org] [varchar](70) NULL,
   [Rfrg_Prvdr_First_Name] [varchar](20) NULL,
   [Rfrg_Prvdr_MI] [varchar](20) NULL,
   [Rfrg_Prvdr_Crdntls] [varchar](20) NULL,
   [Rfrg_Prvdr_Gndr] [varchar](1) NULL,
   [Rfrg_Prvdr_Ent_Cd] [varchar](1) NULL,
   [Rfrg_Prvdr_St1] [varchar](55) NULL,
   [Rfrg_Prvdr_St2] [varchar](55) NULL,
   [Rfrg_Prvdr_City] [varchar](40) NULL,
   [Rfrg_Prvdr_State_Abrvtn] [varchar](2) NULL,
   [Rfrg_Prvdr_State_FIPS] [varchar](2) NULL,
   [Rfrg_Prvdr_ZIP5] [varchar](5) NULL,
   [Rfrg_Prvdr_RUCA_CAT] [varchar](20) NULL,
   [Rfrg_Prvdr_RUCA] [varchar](4) NULL,
   [Rfrg_Prvdr_RUCA_Desc] [varchar](100) NULL,
   [Rfrg_Prvdr_Cntry] [varchar](2) NULL,
   [Rfrg_Prvdr_Type_cd] [varchar](55) NULL,
   [Rfrg_Prvdr_Type] [varchar](100) NULL,
   [Rfrg_Prvdr_Type_Flag] [varchar](1) NULL,
   [BETOS_Lvl] [varchar](55) NULL,
   [BETOS_Cd] [varchar](3) NULL,
   [BETOS_Desc] [varchar](55) NULL,
   [HCPCS_CD] [varchar](5) NULL,
   [HCPCS_Desc] [varchar](500) NULL,
   [Suplr_Rentl_Ind] [varchar](1) NULL,
   [Tot_Suplrs] [int] NULL,
   [Tot_Suplr_Benes] [int] NULL,
   [Tot_Suplr_Clms] [int] NULL,
   [Tot_Suplr_Srvcs] [int] NULL,
   [Avg_Suplr_Sbmtd_Chrg] [numeric](30, 10) NULL,
   [Avg_Suplr_Mdcr_Alowd_Amt] [numeric](30, 10) NULL,
   [Avg_Suplr_Mdcr_Pymt_Amt] [numeric](30, 10) NULL,
   [Avg_Suplr_Mdcr_Stdzd_Amt] [numeric](30, 10) NULL
) ON [PRIMARY]
GO


CREATE INDEX medicare_dme_npi_idx on [dbo].[medicare_npi_hcpcs_dme] (Rfrg_NPI);
GO   

CREATE INDEX medicare_dme_hcpcs_idx on [dbo].[medicare_npi_hcpcs_dme] (HCPCS_CD);
GO   