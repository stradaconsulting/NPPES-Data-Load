select Rndrng_NPI               npi
     , t.Classification         specialty
     , HCPCS_Cd                 code
     , round(Tot_Srvc,0)        count
     , round(Avg_Sbmtd_Chrg,0)  value
  from medicare_npi_hcpcs           m
       inner join npi_taxonomy      n
               on n.npi           = m.Rndrng_NPI
              and n.Healthcare_Provider_Primary_Taxonomy_Switch = 'Y'
       inner join txcodes           t
               on t.Code          = n.Healthcare_Provider_Taxonomy_Code