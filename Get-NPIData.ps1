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

