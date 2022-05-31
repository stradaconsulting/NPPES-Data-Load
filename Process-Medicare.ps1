# Transforms Medicare input file to pipe delimited file without header row
# and then loads to SQL Server table medicare_npi_hcpcs using BCP command using
# medicare_npi_hcpcs_format.xml format file

#Requires -Version 7.0
Param ( [Parameter(Mandatory=$True)] [ValidateNotNull()] [string] $npifilename, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filtercol, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filterval `
       )

# Get SQL credentials
$sqlparms = ./Get-SQLCredential.ps1
$server = $sqlparms['server']
$user   = $sqlparms['userid']
$pswd   = $sqlparms['password']


# Process the NPI datafile; cleans and filters for the state of California
python CleanCSV.py .\data\$npifilename ".\data\tmp_medicare.dat" $filtercol $filterval

Write-Host "Loading npidata into SQL Server using bcp..."
bcp NPPES.dbo.medicare_npi_hcpcs IN .\data\tmp_medicare.dat -f medicare_npi_hcpcs_format.xml -e error_medicare.dat -m 10 -S $server -T #-U $user -P $pswd 


