# DEPRECATED as new process for loading NPI address data converted to latitude/longitude is now
# loaded into the database using Process_npigeo_USCensusData

#Requires -Version 7.0
Param ( [Parameter(Mandatory=$True)] [ValidateNotNull()] [string] $inputfile)

# Loads the geocoding results to the NPPES database.  These were generated by 
# python script "Geocode-NPIaddr.py".

# Get SQL credentials
$sqlparms = ./Get-SQLCredential.ps1
$server   = $sqlparms['server']
$database = $sqlparms['database']
$user     = $sqlparms['userid']
$pswd     = $sqlparms['password']


#################
python Load-Geocodes.py $inputfile $user $pswd $server $database
