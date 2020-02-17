Function Get-StopServer {
    If ($global:APPID -eq "996560") { Get-StopMultiple }Else {
        Write-Host '****   Stopping Server process   *****' -F M -B Black 
        If ($Null -eq (Get-Process "$global:PROCESS" -ea SilentlyContinue)) {
            Write-Host "----   NOT RUNNING   ----" -F R -B Black
        }
        Else { Stop-Process -Name "$global:PROCESS" -Force }
        Get-CheckForError
    }
}
Function Get-StopServerInstall {
    If ($global:APPID -eq "996560") { Get-StopMultiple }Else {
        Write-Host '****   Stopping Server process   *****' -F M -B Black 
        If ($Null -eq (Get-Process "$global:PROCESS" -ea SilentlyContinue)) {
            Write-Host "****   No Process found   ****" -F Y -B Black
        }
        Else {
            Write-Host "****   Stopping Server Process   *****" -F M -B Black
            Stop-Process -Name "$global:PROCESS" -Force
        }
    }
}   

Function Get-StopMultiple {

    $mPROCESS = get-process | Where-Object { $_.ProcessName -match $global:PROCESS }
    If ($null -eq $mPROCESS) { Write-Host "----   NOT RUNNING   ----" -F R -B Black }Else {
        Write-Host "****   Stopping Server Process   *****" -F M -B Black
        get-process | Where-Object { $_.ProcessName -match $global:PROCESS } | stop-process -force
    }
}