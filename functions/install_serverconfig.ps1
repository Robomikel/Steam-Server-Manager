#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Servercfg {
    #(New-Object Net.WebClient).DownloadFile("$githuburl/${gamedirname}/${servercfg}", "$serverdir\csgo\cfg\server.cfg")
    If (($servercfgdir) -or ($servercfg)) {
        If ($null -eq $config2) {
            $servercfg = "$servercfg"
        }
        ElseIf ($null -eq $config3) {
            $servercfg = "$servercfg", "$config2"
        }
        ElseIf ($null -eq $config4) {
            $servercfg = "$servercfg", "$config2", "$config3"
        }
        ElseIf ($null -eq $config5) {
            $servercfg = "$servercfg", "$config2", "$config3", "$config4"
        }
        Else { $servercfg = "$servercfg", "$config2", "$config3", "$config4", "$config5" }
        Foreach ($servercfg in $servercfg) {
            Add-Content $ssmlog "[$loggingdate] Retrieve server config GSM "
            $WebResponse = Invoke-WebRequest "$githuburl/$gamedirname/$servercfg" -UseBasicParsing
            If (!$?) { 
                Add-Content $ssmlog "[$loggingdate] Array Failed !! Did NOT Retrieve server config"
                Exit 
            }
            ElseIf ($?) { 
                Add-Content $ssmlog "[$loggingdate] Retrieved server config " 
            }
            New-Item $servercfgdir\$servercfg -Force
            Add-Content $servercfgdir\$servercfg $WebResponse
        }
    }
}