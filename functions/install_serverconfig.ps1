Function Get-Servercfg {
    Write-Host "****   Retrieve Default Config   ****" -F Y -B Black
    #(New-Object Net.WebClient).DownloadFile("$global:githuburl/${gamedirname}/${config1}", "$global:currentdir\$global:server\csgo\cfg\server.cfg")
    If (("" -eq $global:SERVERCFGDIR) -or ("" -eq $global:config1)) {
        Exit
    }
    ElseIf ($null -eq $global:config2) {
        $global:SERVERCFG = "$global:config1"
    }
    ElseIf ($null -eq $global:config3) {
        $global:SERVERCFG = "$global:config1", "$global:config2"
    }
    ElseIf ($null -eq $global:config4) {
        $global:SERVERCFG = "$global:config1", "$global:config2", "$global:config3"
    }
    ElseIf ($null -eq $global:config5) {
        $global:SERVERCFG = "$global:config1", "$global:config2", "$global:config3", "$global:config4"
    }
    Else { $global:SERVERCFG = "$global:config1", "$global:config2", "$global:config3", "$global:config4", "$global:config5" }
    Foreach ($global:SERVERCFG in $global:SERVERCFG) {
        Write-Host "****   Retrieve server config GSM   ****" -F M -B Black
        $WebResponse = Invoke-WebRequest "$global:githuburl/$global:gamedirname/$global:SERVERCFG -UseBasicParsing"
        If (!$?) { 
            Write-Host "****   Array Failed !! Did NOT Retrieve server config   ****" -F R -B Black ; ; Exit 
        }
        If ($?) { 
            Write-Host "****    Retrieved server config   ****" -F M -B Black 
        }
        New-Item $global:currentdir\$global:server\$global:SERVERCFGDIR\$global:SERVERCFG -Force
        Add-Content $global:currentdir\$global:server\$global:SERVERCFGDIR\$global:SERVERCFG $WebResponse
    }
}