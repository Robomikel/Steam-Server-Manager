Function Get-Finished {
    Get-ClearVariables
    Write-Host "*************************************" -F Y
    Write-Host "***  Server $global:command is done!  $global:CHECKMARK ****" -F Y
    Write-Host "*************************************" -F Y
    Write-Host "  ./steamer start $global:server  "-F Black -B White
}