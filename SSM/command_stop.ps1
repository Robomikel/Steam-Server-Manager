Function Get-StopServer {
    Write-Host '****   Stopping Server process   *****' -F M -B Black 
    If ($Null -eq (Get-Process "$global:PROCESS" -ea SilentlyContinue)) {
        Write-Host "----   NOT RUNNING   ----" -F R -B Black
    }
    Else { Stop-Process -Name "$global:PROCESS" -Force }
    Get-CheckForError
}