# Transforms npi endpoint input file to pipe delimited file without header row
# and then loads to SQL Server table npi_endpoint using BCP command using
# npi_endpoint_format.xml format file

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


# Process the NPI Endpoint datafile; cleans and filters for the state of California
python CleanCSV.py .\data\$npifilename ".\data\tmp_endpoint.dat" $filtercol $filterval

Write-Host "Loading npidata endpoint into SQL Server using bcp..."
bcp dbo.npi_endpoint IN .\data\tmp_endpoint.dat -f npi_endpoint_format.xml -e error_endpoint.dat -m 10 -S $server -d $database -U $user -P $pswd #-T Either use -T or -U & -P depending on connection type

