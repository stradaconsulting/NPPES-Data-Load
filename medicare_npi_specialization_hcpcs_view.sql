SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


If OBJECT_ID('medicare_npi_specialization_hcpcs', 'V') IS NOT NULL
   DROP VIEW [medicare_npi_specialization_hcpcs]
GO


CREATE VIEW [dbo].[medicare_npi_specialization_hcpcs] AS
   SELECT Rndrng_NPI               npi
        , t.Classification         specialty
        , HCPCS_Cd                 code
        , round(Tot_Srvc,0)        count
        , round(Avg_Sbmtd_Chrg,0)  value
     FROM medicare_npi_hcpcs           m
          INNER JOIN npi_taxonomy      n
                  ON n.npi      = m.Rndrng_NPI
                 AND n.Healthcare_Provider_Primary_Taxonomy_Switch = 'Y'
          INNER JOIN txcodes           t
                  ON t.Code     = n.Healthcare_Provider_Taxonomy_Code
GO

