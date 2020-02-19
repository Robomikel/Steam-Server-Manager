#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Servercfg {
    Write-Host "****   Retrieve Default Config   ****" -F Y -B Black
    #(New-Object Net.WebClient).DownloadFile("$githuburl/${gamedirname}/${servercfg}", "$currentdir\$serverfiles\csgo\cfg\server.cfg")
    If (("" -eq $servercfgdir) -or ("" -eq $servercfg)) {
        Exit
    }
    ElseIf ($null -eq $config2) {
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
        Write-Host "****   Retrieve server config GSM   ****" -F M -B Black
        $WebResponse = Invoke-WebRequest "$githuburl/$gamedirname/$servercfg" -UseBasicParsing
        If (!$?) { 
            Write-Host "****   Array Failed !! Did NOT Retrieve server config   ****" -F R -B Black ; ; Exit 
        }
        If ($?) { 
            Write-Host "****    Retrieved server config   ****" -F M -B Black 
        }
        New-Item $currentdir\$serverfiles\$servercfgdir\$servercfg -Force
        Add-Content $currentdir\$serverfiles\$servercfgdir\$servercfg $WebResponse
    }
}