Function Get-StopServer {
    Write-Host '****   Stopping Server process   *****' -F M -B Black 
    If ($Null -eq (Get-Process "$global:PROCESS" -ea SilentlyContinue)) {
        Write-Host "----   NOT RUNNING   ----" -F R -B Black
    }
    Else { Stop-Process -Name "$global:PROCESS" -Force }
    Get-CheckForError
}
Function Get-StopServerInstall {
    Write-Host '****   Checking for Server process before install   ****' -F Y -B Black 
    If ($Null -eq (Get-Process "$global:PROCESS" -ea SilentlyContinue)) {
        Write-Host "****   No Process found   ****" -F Y -B Black
    }
    Else {
        Write-Host "****   Stopping Server Process   *****" -F M -B Black
        Stop-Process -Name "$global:PROCESS" -Force
    }
}   