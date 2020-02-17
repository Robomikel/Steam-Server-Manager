Function Get-CheckServer {
    If ($global:APPID -eq "996560") { 
        Get-checkMultiple 
    }
    Else {
        Write-Host '****   Check  Server process    *****' -F Y -B Black 
        If ($Null -eq (Get-Process "$global:PROCESS" -ea SilentlyContinue)) {
            Write-Host "----   NOT RUNNING   ----" -F R -B Black
        }
        Else { Write-Host "****   RUNNING   ****" -F Green -B Black ; ; Get-Process "$global:PROCESS" ; ; Get-ClearVariables ; ; Exit }
        Get-CheckForError
    }
}

Function Get-checkMultiple {
    $global:PROCESS = get-process | Where-Object { $_.ProcessName -match $global:PROCESS } | get-process
    
    If ($null -eq $global:PROCESS) { Write-Host "----   NOT RUNNING   ----" -F R -B Black }Else {
        Write-Host "****   RUNNING   ****" -F Green -B Black ; ; $global:PROCESS ; ; Get-ClearVariables ; ; Exit
    }
}