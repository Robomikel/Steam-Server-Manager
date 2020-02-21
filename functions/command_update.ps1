#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-UpdateServer {
    Set-Location $steamdirectory >$null 2>&1
    #Get-Steamtxt
    Write-Host '****   Updating Server   ****' -F M -B Black
    #.\steamcmd +runscript Updates-$serverfiles.txt
    If ($ANON -eq "yes") {
        .\steamCMD +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir $serverdir +app_update $appid $branch +Exit
    }
    Else {
        .\steamCMD +@ShutdownOnFailedCommand 1 +login $username +force_install_dir $serverdir +app_update $appid $branch +Exit
    }
    
    If (($?) -or ($LASTEXITCODE -eq 7)) {
        Write-Host "****   Downloading Update server succeeded   ****" -F Y
        If ($DiscordUpdateAlert -eq "on") {
            $global:alert = "update"
            New-DiscordAlert 
        }
    }
    ElseIf (!$?) {
        Write-Host "****   Downloading  Update server Failed   ****" -F R
        New-TryagainNew 
    }
    Set-Location $currentdir
}
