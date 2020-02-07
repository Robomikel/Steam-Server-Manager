Function Get-CheckForVars {
    Write-Host "****   Checking for Vars   ****" -F Y -B Black
    If ($global:command -eq "mcrcon") {
        $global:missingvars = $global:RCONPORT, $global:RCONPASSWORD
    }
    Else {
        $global:missingvars = ${global:QUERYPORT}, ${global:IP}, $global:APPID, $global:PROCESS, ${global:PORT}
    }
    Foreach ($global:missingvars in $global:missingvars) {
        If ( "" -eq $global:missingvars) {
            Write-Host "----------------------------------------------------------------------------" -F Y -B Black
            Write-Host "$global:DIAMOND $global:DIAMOND Missing Vars ! $global:DIAMOND $global:DIAMOND" -F R -B Black
            Write-Host "Try install command again or check vars in Variables-$global:server.ps1" -F Y -B Black
            Write-Host "----------------------------------------------------------------------------" -F Y -B Black
            Exit
        }
    }
}