#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-UpdateServer {
    Write-log "Function:  Get-UpdateServer"
    If ($steamexecutable) {
        Push-location
        Set-Location $steamdirectory
        Get-Infomessage "updating" 'info'
        If ($ANON -eq "yes") {
            $steamcmdparams = @( "+@NoPromptForPassword 1", "+login", "anonymous", "+force_install_dir $serverdir", "+app_update $appid $branch", "+Exit")
            & $steamexecutable $steamcmdparams | Tee-Object -Variable 'appinstalllog'
            compare-SteamExit
        }
        Else {
            Write-Host "Enter Username for Steam install" -F Cyan -B Black
            $username = Read-host
            Write-Host "Enter steam password" -F Cyan -B Black
            $securedpassword = Read-Host -AsSecureString
            If ($username -and $securedpassword) {
                $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($securedpassword)
                $password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)
                $steamcmdparams = @( "+login", "$username", "$password", "+force_install_dir $serverdir", "+app_update $appid $branch", "+Exit")
                & $steamexecutable $steamcmdparams | Tee-Object -Variable 'appinstalllog'
                compare-SteamExit
            }
        }
        New-DiscordAlert "update"
        pop-location
    }
}