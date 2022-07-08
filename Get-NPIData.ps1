#Requires -Version 7.0
Param ( [Parameter(Mandatory=$True)] [ValidateNotNull()] [string] $month, `
        [Parameter(Mandatory=$True)] [ValidateNotNull()] [string] $year, `
        [Parameter(Mandatory=$True)] [ValidateNotNull()] [string] $txcodesURI `
      )

# download the NPPES monthly data file
$nppesMonthlyFileURI  = [URI] ("https://download.cms.gov/nppes/NPPES_Data_Dissemination_" + $month + "_" + $year + ".zip")
$nppesMonthlyFileName = $nppesMonthlyFileURI.LocalPath | Split-Path -Leaf
$txcodesFileName = ([URI] $txcodesURI).LocalPath | Split-Path -Leaf

# create a .\data folder if it does not yet exist
$FolderName = ".\data"
if(Test-Path -Path $FolderName){
    Write-Host "'.\data' Folder Exists"
}
else {
    Write-Host "'.\data' Folder does not exist. Will be created."
    New-Item $FolderName -ItemType Directory
}



Invoke-WebRequest -URI $nppesMonthlyFileURI -Outfile .\data\$nppesMonthlyFileName

Expand-Archive -LiteralPath .\data\$nppesMonthlyFileName -DestinationPath .\data\ -Force

Invoke-WebRequest -URI $txcodesURI -OutFile .\data\$txcodesFileName

Write-Host "***Warning - You must download the Medicare data manually and place it into the .\data subfolder. The URI requires accepting terms and selecting the file"
Write-Host "Navigate to this location and download the most recent single year:"
Write-Host "https://data.cms.gov/provider-summary-by-type-of-service/medicare-physician-other-practitioners/medicare-physician-other-practitioners-by-provider-and-service"

Write-Host "***Warning - The same must be done for the Durable Medical Equipment for Referring Provider"
Write-Host "Navigate to this location and download the most recent single year and place into the .\data\ location"
Write-Host "https://data.cms.gov/provider-summary-by-type-of-service/medicare-durable-medical-equipment-devices-supplies/medicare-durable-medical-equipment-devices-supplies-by-referring-provider-and-service"
Write-Host "Be sure to extract the compressed file into the same .\data\ location"

Write-Host "***Warning - The same must be done for the Medicare Physician & Other Practitioners - by Geography and Service"
Write-Host "Navigate to this location and download the most recent single year and place into the .\data\ location"
Write-Host "https://data.cms.gov/provider-summary-by-type-of-service/medicare-physician-other-practitioners/medicare-physician-other-practitioners-by-geography-and-service"
Write-Host "Be sure to extract the compressed file into the same .\data\ location"