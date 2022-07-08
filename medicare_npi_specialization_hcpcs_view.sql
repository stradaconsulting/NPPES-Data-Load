SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


If OBJECT_ID('medicare_npi_specialization_hcpcs', 'V') IS NOT NULL
   DROP VIEW [medicare_npi_specialization_hcpcs]
GO


CREATE VIEW [dbo].[medicare_npi_specialization_hcpcs] AS
   SELECT m.Rndrng_NPI                    npi
        , t.Classification                   specialty
        , HCPCS_Cd                           code
        , round(Tot_Srvc,0)                  count
        , round(Avg_Sbmtd_Chrg,0)            value
        , g.Latitude                         latitude
        , g.Longitude                        longitude
        , m.Avg_Mdcr_Alowd_Amt               avg_medicare_allowed
        , m.Avg_Mdcr_Pymt_Amt                avg_medicare_billed
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
UNION
   SELECT m.Rfrg_NPI                      npi
        , t.Classification                   specialty
        , HCPCS_CD                           code
        , round(Tot_Suplr_Srvcs,0)           count
        , round(Avg_Suplr_Sbmtd_Chrg,0)      value
        , g.Latitude                         latitude
        , g.Longitude                        longitude
        , m.Avg_Suplr_Mdcr_Alowd_Amt         avg_medicare_allowed
        , m.Avg_Suplr_Mdcr_Pymt_Amt          avg_medicare_billed
     FROM medicare_npi_hcpcs_dme       m
          INNER JOIN npidata           npi
                  ON npi.npi      = m.Rfrg_NPI
          INNER JOIN npi_taxonomy      n
                  ON n.npi        = m.Rfrg_NPI
                 AND n.Healthcare_Provider_Primary_Taxonomy_Switch = 'Y'
          INNER JOIN txcodes           t
                  ON t.Code       = n.Healthcare_Provider_Taxonomy_Code
          INNER JOIN medicare_npi_geo  g
                  ON g.Rndrng_NPI = m.Rfrg_NPI
                 AND Matchflag    = 'Match';
GO

