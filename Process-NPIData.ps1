#Requires -Version 7.0
Param ( [Parameter(Mandatory=$True)] [ValidateNotNull()] [string] $npifilename, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filtercol, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filterval `
       )

# Get SQL credentials
$sqlparms = ./Get-SQLCredential.ps1
$server   = $sqlparms['server']
$database = $sqlparms['database']
$user     = $sqlparms['userid']
$pswd     = $sqlparms['password']


# Process the NPI datafile; cleans and filters for the state of California
python CleanCSV.py .\data\$npifilename ".\data\tmp_npi.dat" $filtercol $filterval

Write-Host "Loading npidata into SQL Server using bcp..."
bcp dbo.npidata_stage IN .\data\tmp_npi.dat -f npi_format.xml -e error_npi.dat -m 10 -S $server -d $database -U $user -P $pswd #-T Either use -T or -U & -P depending on connection type

