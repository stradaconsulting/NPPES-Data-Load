SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


If OBJECT_ID('medicare_hcpcs_summary', 'V') IS NOT NULL
   DROP VIEW [medicare_hcpcs_summary]
GO


CREATE VIEW [dbo].[medicare_hcpcs_summary] AS
   SELECT HCPCS_Cd                              code
        , t.Classification                      specialty
        , count(distinct m.Rndrng_NPI)          npi_count
        , round(sum(Tot_Srvc),0)                count
        , round(sum(Avg_Sbmtd_Chrg),0)          value
     FROM medicare_npi_hcpcs           m
          INNER JOIN npidata           npi
                  ON npi.npi      = m.Rndrng_NPI
          INNER JOIN npi_taxonomy      n
                  ON n.npi        = m.Rndrng_NPI
                 AND n.Healthcare_Provider_Primary_Taxonomy_Switch = 'Y'
          INNER JOIN txcodes           t
                  ON t.Code       = n.Healthcare_Provider_Taxonomy_Code
          INNER JOIN medicare_npi_geo  g
                  ON g.Rndrng_NPI = m.Rndrng_NPI
                 AND Matchflag    = 'Match'
    GROUP BY
          HCPCS_Cd
        , t.Classification
UNION
   SELECT HCPCS_Cd                              code
        , t.Classification                      specialty
        , count(distinct m.Rfrg_NPI)            npi_count
        , round(sum(Tot_Suplr_Srvcs),0)         count
        , round(sum(Avg_Suplr_Sbmtd_Chrg),0)    value
     FROM medicare_npi_hcpcs_dme           m
          INNER JOIN npidata           npi
                  ON npi.npi      = m.Rfrg_NPI
          INNER JOIN npi_taxonomy      n
                  ON n.npi        = m.Rfrg_NPI
                 AND n.Healthcare_Provider_Primary_Taxonomy_Switch = 'Y'
          INNER JOIN txcodes           t
                  ON t.Code       = n.Healthcare_Provider_Taxonomy_Code
          INNER JOIN medicare_npi_geo  g
                  ON g.Rndrng_NPI = m.Rfrg_NPI
                 AND Matchflag    = 'Match'
    GROUP BY
          HCPCS_Cd
        , t.Classification        

GO


