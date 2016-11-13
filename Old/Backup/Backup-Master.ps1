$7zip = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | ?{$_.DisplayName -like "7-Zip*"}
$7zLocation = "C:\Program Files\7-Zip\7z.exe"
$backupDestination = "E:\Backups"
$backupPersonalSource = "D:\Personal"

if($7zip){
    Write-Verbose "7-Zip found"
    Write-Host "*** Adrian's Master Backup Script ***"

    $startTime = Get-Date

    & .\Backup-Directory.ps1 $7zLocation $backupPersonalSource $backupDestination "Personal"

    $endTime = Get-Date

    Write-Host "Master backup complete" -ForegroundColor Green
    Write-Host "Started: $startTime. Ended: $endTime" -ForegroundColor Yellow
    Pause
}else{
    Write-Error "7-Zip not found"
    return
}