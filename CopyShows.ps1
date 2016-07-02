<# This function takes in a string and appends it to log file. #>

function writeLog ([string] $logThis){
    $Date = get-date;
    
    <# Only perform this logic if the log file does not exist already #>
    $PathExist = test-path -Path $logfile
    if(!$PathExist){
    Add-Content -path $logfile -Value $LogHeader
    Add-Content -path $logfile -Value $Separator
    }
    
    <#Comment out this line to take away the Date#>
    <#Add-Content -path $logfile -Value $Date#>
    $now=get-Date
    $mo=$now.Month.ToString()
    $dy=$now.Day.ToString()
    $hr=$now.Hour.ToString()
    $mi=$now.Minute.ToString()
    if ($dy.length -lt 2) {
        $dy=”0$dy" #pad single digit day with leading zero
    }
    
    if ($mi.length -lt 2) {
        $mi=”0$mi" #pad single digit minute with leading zero
    }

    $logThis = "$mo/$dy at $hr`:$mi --- $logThis"
   
    Add-Content -path $logfile -Value $logThis;
}



<#
I get the name of the specific file in the "From" location, then append it to the path of the "To" location
and check to see if that path exists. This ensures I do not copy something that is already there. It is all
logged correctly in my CopyShows.log file.
#>

function CopyEverything ([string] $FromLocation, [string] $ToLocation){

#Get all the files in the "From" Location
$items = Get-item -path "$FromLocation"

#Copy every file in that location to the "To" location

    foreach ($file in $items){
        $endPath = $file.name;
        $FuturePath = "$ToLocation`\$endPath"
        $fileExists = Test-Path($futurePath);
            if ($fileExists){
                writeLog "$endPath already exists at $ToLocation -- Not Copying"
            }
            else {
                writeLog("Copying $file to location:    $ToLocation")
                Copy-item $file $ToLocation
            }
            if((get-item $file).PSIsContainer){
                writeLog "$file is a folder. Recursively running script"
                CopyEverything $file`\* $FuturePath
            }
    }
}



<#---------------Logfile Info-------------------#>

$logfile = "C:\Users\628196\Desktop\CopyItems.log" <# Set this to the directory of your log #>
$LogHeader = "Log for copying items from one file to another"
$Separator = "---------------------------------------"

<#-----Begin Script Logic #>


$From = "C:\Users\628196\Desktop\From\*"
$To = "C:\Users\628196\Desktop\To"
CopyEverything $From $To


