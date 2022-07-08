/****** Object:  View [dbo].[medicare_npi_specialization_hcpcs]    Script Date: 2022-06-08 14:17:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

If OBJECT_ID('medicare_npi_latitude_longitude', 'V') IS NOT NULL
   DROP VIEW [medicare_npi_latitude_longitude]
GO

CREATE VIEW [dbo].[medicare_npi_latitude_longitude] AS
   SELECT n.NPI                      npi
        , g.Latitude                 latitude
        , g.Longitude                longitude
        , t.classification           specialization
        , CASE WHEN n.Entity_Type_Code = 1  --Non-Organizational
               THEN trim(concat(n.Provider_Name_Prefix_Text, ' ',
                                n.Provider_First_Name,' ',
                                n.Provider_Last_Name,
                                n.Provider_Name_Suffix_Text)) 
               WHEN n.Entity_Type_Code = 2  --Organizational
               THEN n.Provider_Org_Name
          END                         provider_name
        , g.MatchedAddress            address
        , CASE WHEN n.Entity_Type_Code = 2 --Organizational
               THEN trim(concat(n.Authorized_Official_First_Name, ' ',
                                n.Authorized_Official_Last_Name, ', ',
                                n.Authorized_Official_Title_or_Position))
          END                         contact
        , e.Endpoint                            email
        , NULL                                  LinkedInProfile
     FROM npidata                      n
          INNER JOIN npi_taxonomy      nt
                  ON nt.npi       = n.npi
                 AND nt.Healthcare_Provider_Primary_Taxonomy_Switch = 'Y'
          INNER JOIN txcodes           t
                  ON t.Code       = nt.Healthcare_Provider_Taxonomy_Code
          INNER JOIN medicare_npi_geo g
                  ON g.Rndrng_NPI = n.npi
                 AND g.Matchflag  = 'Match'
          LEFT  JOIN npi_endpoint      e
                  ON e.NPI        = n.NPI
                 AND e.Endpoint   like '%@%'

GO