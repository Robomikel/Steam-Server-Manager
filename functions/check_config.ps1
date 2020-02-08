Function Get-CheckForVars {
    Write-Host "****   Checking for Vars   ****" -F Y -B Black
    If ($global:command -eq "mcrcon") {
        $global:missingvars = $global:RCONPORT, $global:RCONPASSWORD
    }
    Else {
        $global:missingvars = ${global:QUERYPORT}, ${global:IP}, $global:APPID, $global:PROCESS, ${global:PORT},$global:ANON
    }
    Foreach ($global:missingvars in $global:missingvars) {
        If ( "" -eq $global:missingvars) {
            Get-varsmessage
        }
    }
}