Function New-ServerFolder {   
    ##-- Create Folder for Server -- In current folder
    If ((!$global:server) -or ($global:server -eq " ")) {
        Write-Host "****   You Enter a null or Empty   ****" -F R -B Black
        Select-Steamer
    }
    ElseIf (($null -eq $global:APPID ) -or ($global:APPID -eq " ")) {
        Write-Host "****   You Enter a space or Empty   ****" -F R -B Black
        Select-Steamer
    }
    ElseIf (Test-Path "$global:currentdir\$global:server\" ) {
        Write-Host '****   Server Folder Already Created!   ****' -F Y -B Black
    }
    Else {
        Write-Host '****   Creating Server Folder   ****' -F M -B Black 
        New-Item  . -Name "$global:server" -ItemType "directory"
    }
}
