Function Get-RestartsServer {
    Clear-Host
    Start-Countdown -Seconds 10 -Message "Restarting server"
    Get-Logo
    Select-StartServer
    Get-CheckForError
}
Function Start-Countdown {
    Param(
        [Int32]$Seconds = 10,
        [string]$Message = "Restarting server in 10 seconds...")
    Foreach ($Count in (1..$Seconds)) {
        Write-Progress -Id 1 -Activity $Message -Status "Waiting for $Seconds seconds, $($Seconds - $Count) left" -PercentComplete (($Count / $Seconds) * 100)
        Start-Sleep -Seconds 1
    }
    Write-Progress -Id 1 -Activity $Message -Status "Completed" -PercentComplete 100 -Completed
}