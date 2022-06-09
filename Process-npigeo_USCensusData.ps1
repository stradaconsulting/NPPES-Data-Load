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
python CleanCSV.py $npifilename ".\data\tmp_npigeo.dat" $filtercol $filterval

Write-Host "Loading npidata into SQL Server using bcp..."
bcp dbo.npigeo_stage IN .\data\tmp_npigeo.dat -f npigeo_stage_format.xml -e error_npigeo.dat -m 0 -S $server -d $database -U $user -P $pswd #-T Either use -T or -U & -P depending on connection type

