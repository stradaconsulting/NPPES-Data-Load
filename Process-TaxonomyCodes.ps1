#Requires -Version 7.0
Param ( [Parameter(Mandatory=$True)] [ValidateNotNull()] [string] $txfilename)

# Get the SQL Server credentials
$sqlparms = ./Get-SQLCredential.ps1
$user     = $sqlparms['userid'] 
$pswd     = $sqlparms['password']
$server   = $sqlparms['server']
$database = $sqlparms['database']

python CleanCSV.py .\data\$txfilename ".\data\tmp_txcodes.dat"

bcp dbo.txcodes IN .\data\tmp_txcodes.dat -f tx_format.xml -e error_taxonomy.dat -m 10 -S $server -d $database -U $user -P $pswd #-T Either use -T or -U & -P depending on connection type
