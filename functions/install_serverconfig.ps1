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
    #(New-Object Net.WebClient).DownloadFile("$githuburl/${gamedirname}/${config1}", "$currentdir\$server\csgo\cfg\server.cfg")
    If (("" -eq $SERVERCFGDIR) -or ("" -eq $config1)) {
        Exit
    }
    ElseIf ($null -eq $config2) {
        $SERVERCFG = "$config1"
    }
    ElseIf ($null -eq $config3) {
        $SERVERCFG = "$config1", "$config2"
    }
    ElseIf ($null -eq $config4) {
        $SERVERCFG = "$config1", "$config2", "$config3"
    }
    ElseIf ($null -eq $config5) {
        $SERVERCFG = "$config1", "$config2", "$config3", "$config4"
    }
    Else { $SERVERCFG = "$config1", "$config2", "$config3", "$config4", "$config5" }
    Foreach ($SERVERCFG in $SERVERCFG) {
        Write-Host "****   Retrieve server config GSM   ****" -F M -B Black
        $WebResponse = Invoke-WebRequest "$githuburl/$gamedirname/$SERVERCFG" -UseBasicParsing
        If (!$?) { 
            Write-Host "****   Array Failed !! Did NOT Retrieve server config   ****" -F R -B Black ; ; Exit 
        }
        If ($?) { 
            Write-Host "****    Retrieved server config   ****" -F M -B Black 
        }
        New-Item $currentdir\$server\$SERVERCFGDIR\$SERVERCFG -Force
        Add-Content $currentdir\$server\$SERVERCFGDIR\$SERVERCFG $WebResponse
    }
}