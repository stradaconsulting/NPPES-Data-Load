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
$server   = $sqlparms['server']
$database = $sqlparms['database']
$user     = $sqlparms['userid']
$pswd     = $sqlparms['password']


# Process the Medicare datafile; optional filter may be applied
python CleanCSV.py .\data\$npifilename ".\data\tmp_medicare.dat" $filtercol $filterval

Write-Host "Loading Medicare data into SQL Server using bcp..."
bcp dbo.medicare_npi_hcpcs IN .\data\tmp_medicare.dat -f medicare_npi_hcpcs_format.xml -e error_medicare.dat -m 10 -S $server -d $database -U $user -P $pswd #-T Either use -T or -U & -P depending on connection type


