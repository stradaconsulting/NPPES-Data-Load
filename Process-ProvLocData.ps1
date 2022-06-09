#Requires -Version 7.0
#TODO: make filter optional in this script
Param ( [Parameter(Mandatory=$True)] [ValidateNotNull()] [string] $plfilename, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filtercol, `
        [Parameter(Mandatory=$False)] [ValidateNotNull()] [string] $filterval `
       )

# Get SQL credentials
$sqlparms = ./Get-SQLCredential.ps1
$server   = $sqlparms['server']
$database = $sqlparms['database']
$user     = $sqlparms['userid']
$pswd     = $sqlparms['password']

python CleanCSV.py .\data\$plfilename ".\data\tmp_pl.dat" $filtercol $filterval 

Write-Host "Loading Provider Location data into SQL Server using bcp..."
bcp dbo.prov_loc IN .\data\tmp_pl.dat -f prov_loc_format.xml -e error_provloc.dat -m 10 -S $server -d $database -U $user -P $pswd #-T Either use -T or -U & -P depending on connection type

