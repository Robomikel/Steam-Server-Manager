Function Get-GamedigServerv2 {
    Write-Host '****   Starting gamedig on Server   ****' -F M -B Black
    If (( $global:AppID -eq 581330) -or ($global:AppID -eq 376030) -or ($global:AppID -eq 443030)) {
        Write-Host '****   Using QUERYPORT    ****' -F Y -B Black
        If (($null -eq ${global:QUERYPORT} ) -or ("" -eq ${global:QUERYPORT} )) {
            Write-Host '****   Missing QUERYPORT Var!   ****' -F R -B Black
        }
        ElseIf ($global:command -eq "gamedig") {
            Set-Location $global:currentdir\node-v$global:nodeversion-win-x64\node-v$global:nodeversion-win-x64
            .\gamedig --type $global:GAME ${global:EXTIP}:${global:QUERYPORT} --pretty
            Set-Location $global:currentdir
        }
        ElseIf ($global:Useprivate -eq "1") {
            Set-Location $global:currentdir\node-v$global:nodeversion-win-x64\node-v$global:nodeversion-win-x64  
            .\gamedig --type $global:GAME ${global:IP}:${global:QUERYPORT} --pretty
            Set-Location $global:currentdir
        }
    }
    ElseIf (($null -eq ${global:PORT}) -or ("" -eq ${global:PORT} )) {
        Write-Host '****   Missing PORT Var!   ****' -F R -B Black
    }
    ElseIf ($global:Useprivate -eq "1") {
        Set-Location $global:currentdir\node-v$global:nodeversion-win-x64\node-v$global:nodeversion-win-x64  
        .\gamedig --type $global:GAME ${global:IP}:${global:PORT} --pretty
        Set-Location $global:currentdir
    }
    Else {
        Set-Location $global:currentdir\node-v$global:nodeversion-win-x64\node-v$global:nodeversion-win-x64
        .\gamedig --type $global:GAME ${global:EXTIP}:${global:PORT} --pretty
        Set-Location $global:currentdir
    }
     
}