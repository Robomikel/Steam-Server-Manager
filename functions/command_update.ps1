#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-UpdateServer {
    If ($steamdirectory) {
        Set-Location $steamdirectory
        $infomessage = "updating"
        Get-Infomessage
        If ($ANON -eq "yes") {
            $steamcmdparams = @( "+@NoPromptForPassword 1", "+login", "anonymous", "+force_install_dir $serverdir", "+app_update $appid $branch", "+Exit")
            & $steamexecutable $steamcmdparams | Tee-Object -Variable 'appinstalllog'
            compare-SteamExit
        }
        Else {
            $steamcmdparams = @( "+login", "$username", "$password", "+force_install_dir $serverdir", "+app_update $appid $branch", "+Exit")
            & $steamexecutable $steamcmdparams | Tee-Object -Variable 'appinstalllog'
            compare-SteamExit
        }
        Set-Location $currentdir
    }
}