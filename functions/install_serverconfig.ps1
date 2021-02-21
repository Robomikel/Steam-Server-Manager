#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Servercfg {
    Write-log "Function: Get-Servercfg"
    #(New-Object Net.WebClient).DownloadFile("$githuburl/${gamedirname}/${servercfg}", "$serverdir\csgo\cfg\server.cfg")
    If ($servercfgdir -or $servercfg) {
        If (!$config2) {
            $servercfg = "$servercfg"
        }
        ElseIf (!$config3) {
            $servercfg = "$servercfg", "$config2"
        }
        ElseIf (!$config4) {
            $servercfg = "$servercfg", "$config2", "$config3"
        }
        ElseIf (!$config5) {
            $servercfg = "$servercfg", "$config2", "$config3", "$config4"
        }
        Else { $servercfg = "$servercfg", "$config2", "$config3", "$config4", "$config5" }
        Foreach ($servercfg in $servercfg) {
            Write-log "Retrieve server config GSM "
            If ($githuburl -and $gamedirname) {
                $WebResponse = Invoke-WebRequest "$githuburl/$gamedirname/$servercfg" -UseBasicParsing
                If (!$?) { 
                    Write-log "Array Failed !! Did NOT Retrieve server config"
                    Exit 
                }
                ElseIf ($?) { 
                    Write-log "Retrieved server config " 
                }
                New-Item $servercfgdir\$servercfg -Force | Out-File -Append -Encoding Default  $ssmlog
                If ($WebResponse) {
                    Add-Content $servercfgdir\$servercfg $WebResponse
                }
            }
        }
    }
}