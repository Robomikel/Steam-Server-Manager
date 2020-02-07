Function New-BackupFolder {
    $path = "$global:currentdir\backups" 
    If (Test-Path $path) { 
        Write-Host '****   Backup folder exists!   ****' -F Y -B Black
    } 
    Else {  
        Write-Host '****   Creating backup folder   ****' -F M -B Black
        New-Item  "$global:currentdir\" -Name "backups" -ItemType "directory"
    }
}