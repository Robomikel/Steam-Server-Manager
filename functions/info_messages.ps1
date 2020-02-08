Function Get-Finished {
    Get-ClearVariables
    Write-Host "*************************************" -F Y
    Write-Host "***  Server $global:command is done!  $global:CHECKMARK ****" -F Y
    Write-Host "*************************************" -F Y
    Write-Host "  ./steamer start $global:server  "-F Black -B White
}

Function Get-varsmessage {
    Write-Host "----------------------------------------------------------------------------" -F Y -B Black
    Write-Host "$global:DIAMOND $global:DIAMOND Missing Vars ! $global:DIAMOND $global:DIAMOND" -F R -B Black
    Write-Host "Try install command again or check vars in Variables-$global:server.ps1" -F Y -B Black
    Write-Host "----------------------------------------------------------------------------" -F Y -B Black
    Exit
}

Function Get-adminMessage {
    Write-Host "----------------------------------------------------------------------------" -F Y -B Black
    Write-Host "                 $global:DIAMOND $global:DIAMOND Do Not Run as an Admin account $global:DIAMOND $global:DIAMOND" -F R -B Black
    Write-Host "***  Please Create a Non Admin Account to run script and game server  ******" -F Y -B Black
    Write-Host "----------------------------------------------------------------------------" -F Y -B Black
}
Function Get-CheckForError {
    If (!$?) {
        Write-Host "----------------------------------------------------------------------------" -F Y -B Black
        Write-Host "      $global:DIAMOND $global:DIAMOND Command $global:command Failed! $global:DIAMOND $global:DIAMOND" -F R -B Black
        Write-Host "***        Try install command again          ****  " -F Y -B Black
        Write-Host "----------------------------------------------------------------------------" -F Y -B Black
        Exit
    }
}