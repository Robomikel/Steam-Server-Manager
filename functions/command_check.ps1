Function Get-CheckServer {
    Write-Host '****   Check  Server process    *****' -F Y -B Black 
    If ($Null -eq (Get-Process "$global:PROCESS" -ea SilentlyContinue)) {
        Write-Host "----   NOT RUNNING   ----" -F R -B Black
    }
    Else { Write-Host "****   RUNNING   ****" -F Green -B Black ; ; Get-Process "$global:PROCESS" ; ; Get-ClearVariables ; ; Exit }
    Get-CheckForError
}