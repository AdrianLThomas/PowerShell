Param(
    [string]$7zLocation,
    [string]$backupSource,
    [string]$backupDestination,
    [string]$backupName,
    [string]$password
)


$filename = Get-Date -format yyyy_M_dd.HHmm

if ($7zLocation){
    Write-Host "Backing up $backupName..."

    & $7zLocation a "$backupDestination\$backupName\$filename.7z" -p -r -v10m $backupSource\*.*

    if($LASTEXITCODE -ne 0){
        Write-Error "There was an error creating the archive (7-ZIP error code $LASTERRORCODE)"
    }
}else{
    Write-Error "7-Zip application not provided"
}