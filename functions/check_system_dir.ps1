Function Get-FolderNames {
    Write-Host "****   Checking Folder Names   ****" -F Y -B Black
    If (Test-Path "$global:currentdir\$global:server\") {
    }
    Else {
        New-ServerFolderq
    }
}
