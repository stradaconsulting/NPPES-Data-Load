USE NPPES

-- Create Medicare data for most recent year available by NPI and HCPCS code


   If OBJECT_ID('medicare_npi_hcpcs', 'U') IS NOT NULL
      DROP TABLE [medicare_npi_hcpcs]
   GO
   
   CREATE TABLE [dbo].[medicare_npi_hcpcs] (
      [Rndrng_NPI]                      numeric(18,0),
      [Rndrng_Prvdr_Last_Org_Name]      varchar(70),
      [Rndrng_Prvdr_First_Name]         varchar(20),
      [Rndrng_Prvdr_MI]                 varchar(20),
      [Rndrng_Prvdr_Crdntls]            varchar(20),
      [Rndrng_Prvdr_Gndr]               varchar(1),
      [Rndrng_Prvdr_Ent_Cd]             varchar(1),
      [Rndrng_Prvdr_St1]                varchar(55),
      [Rndrng_Prvdr_St2]                varchar(55),
      [Rndrng_Prvdr_City]               varchar(40), 
      [Rndrng_Prvdr_State_Abrvtn]       varchar(2),
      [Rndrng_Prvdr_State_FIPS]         varchar(2),
      [Rndrng_Prvdr_ZIP5]               varchar(5),
      [Rndrng_Prvdr_RUCA]               varchar(4)  ,          
      [Rndrng_Prvdr_Ruca_Desc]          varchar(100),
      [Rndrng_Prvdr_Cntry]              varchar(2),
      [Rndrng_Prvdr_Type]               varchar(55),
      [Rndrng_Prvdr_Mdcr_Prtcptg_Ind]   varchar(1),
      [HCPCS_Cd]                        varchar(5),
      [HCPCS_Desc]                      varchar(500),
      [HCPCS_Drug_Ind]                  varchar(1),
      [Place_Of_Srvc]                   varchar(1),
      [Tot_Benes]                       int,
      [Tot_Srvc]                        numeric(30,10),
      [Tot_Bene_Day_Srvcs]              int,
      [Avg_Sbmtd_Chrg]                  numeric(30,10),
      [Avg_Mdcr_Alowd_Amt]              numeric(30,10),
      [Avg_Mdcr_Pymt_Amt]               numeric(30,10),
      [Avg_Mdcr_Stdzd_Amt]              numeric(30,10)
   )
   GO

   CREATE INDEX medicare_npi_idx on [dbo].[medicare_npi_hcpcs] (Rndrng_NPI);
   GO   

   CREATE INDEX medicare_hcpcs_idx on [dbo].[medicare_npi_hcpcs] (HCPCS_Cd);
   GO   