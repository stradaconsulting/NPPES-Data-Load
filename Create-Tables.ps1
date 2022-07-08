#Requires -Version 7.0
# Creates the NPPES tables
# CAUTION!!! - DROPS ALL THE EXISTING TABLES USED BY THIS DATA LOAD
# Uses the named database name in the passwords.json file
$sqlparms = ./Get-SQLCredential.ps1
$user     = $sqlparms['userid']
$pswd     = $sqlparms['password']
$server   = $sqlparms['server']
$database = $sqlparms['database']

Write-Host "Processing medical_data_database.sql"
sqlcmd -e -i medical_data_database.sql -S $server -d $database -U $user -P $pswd #-E #use either -E or -U & -P depending on connection type

Write-Host "Processing npidata_stage_tbl.sql"
sqlcmd -e -i npidata_stage_tbl.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type
Write-Host "Processing npidata_tbls.sql"
sqlcmd -e -i npidata_tbls.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type

Write-Host "Processing prov_loc_tbl.sql"
sqlcmd -e -i prov_loc_tbl.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type

Write-Host "Processing txcodes_tbl.sql"
sqlcmd -e -i txcodes_tbl.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type

Write-Host "Processing npi_endpoint_tbl.sql"
sqlcmd -e -i npi_endpoint_tbl.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type

Write-Host "Processing medicare_npi_hcpcs_tbl.sql"
sqlcmd -e -i medicare_npi_hcpcs_tbl.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type
Write-Host "Processing medicare_npi_tbl.sql"
sqlcmd -e -i medicare_npi_tbl.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type
Write-Host "Processing medicare_npi_geo_tbl.sql"
sqlcmd -e -i medicare_npi_geo_tbl.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type
Write-Host "Processing medicare_npi_geo_stage_tbl.sql"
sqlcmd -e -i medicare_npi_geo_stage_tbl.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type

Write-Host "Processing npigeo_tbl.sql"
sqlcmd -e -i npigeo_tbl.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type
Write-Host "Processing npigeo_stage_tbl.sql"
sqlcmd -e -i npigeo_stage_tbl.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type

Write-Host "medicare_npi_latitude_longitude_view.sql"
sqlcmd -e -i medicare_npi_latitude_longitude_view.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type
Write-Host "medicare_npi_specialization_hcpcs_view.sql"
sqlcmd -e -i medicare_npi_specialization_hcpcs_view.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type

Write-Host "medicare_npi_hcpcs_dme_tbl.sql"
sqlcmd -e -i medicare_npi_hcpcs_dme_tbl.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type

Write-Host "medicare_npi_hcpcs_geography_tbl.sql"
sqlcmd -e -i medicare_npi_hcpcs_geography_tbl.sql -S $server -d $database -U $user -P $pswd  #-E #use either -E or -U & -P depending on connection type
