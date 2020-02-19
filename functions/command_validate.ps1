#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-ValidateServer {
    Set-Location $currentdir\SteamCMD\ >$null 2>&1
    #Get-Steamtxt
    Write-Host '****   Validate May Overwrite some config files   ****' -F R -B Black
    Write-Host '****   Run Install command again to update variables-$serverfiles.ps1  ****' -F Y -B Black
    Write-Host 'Press any key to continue...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

    Write-Host '****   Validating Server   ****' -F M -B Black
    #.\steamcmd +runscript Validate-$serverfiles.txt
    If ($anon -eq "yes") {
        .\steamCMD +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir $currentdir\$serverfiles +app_update $APPID $Branch validate +Exit
    }
    Else {
        .\steamCMD +@ShutdownOnFailedCommand 1 +login $username +force_install_dir $currentdir\$serverfiles +app_update $APPID $Branch validate +Exit
    }
    If ( !$? ) {
        Write-Host "****   Validating Server Failed   ****" -F R
        New-TryagainNew   
    }
    ElseIf ($?) {
        Write-Host "****   Validating Server succeeded   ****" -F Y
    }
    Set-Location $currentdir
}