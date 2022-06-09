#Requires -Version 7.0
# This script de-normalizes the taxonomy and other provider information

# Get SQL credentials
$sqlparms = ./Get-SQLCredential.ps1
$server   = $sqlparms['server']
$database = $sqlparms['database']
$user     = $sqlparms['userid']
$pswd     = $sqlparms['password']

Write-Host "Refactoring npidata..."
sqlcmd -e -i npidata_refactor.sql -S $server -d $database -U $user -P $pswd #-E use either -E or -U & -P depending on connection type
