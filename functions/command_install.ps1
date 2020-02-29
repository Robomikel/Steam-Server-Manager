
#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Install-ServerFiles {
    If ($APPID -eq 11421000) {
        New-LaunchScriptbedrock_serverPS
    }
    ElseIf ($APPID -eq 11500000) {
        New-LaunchScriptminecraft_serverPS
    }
    Else {
        If ($anon) {
        
            Set-Location $steamdirectory
            If ($ANON -eq "yes") {
                $steamcmdparams = @("+@NoPromptForPassword 1", "+login", "anonymous", "+force_install_dir $serverdir", "+app_update $appid $branch validate", "+Exit")
                Write-Host "Please Wait: Will Display console in a moment" -F Y
                & $steamexecutable $steamcmdparams | Tee-Object -Variable 'appinstalllog'
                # Add-Content $ssmlog "[$loggingdate] $appinstalllog"
                compare-SteamExit

            }
            Else {
                Write-Host "Enter Username for Steam install" -F Cyan -B Black
                $username = Read-host
                Write-Host "Enter steam password" -F Cyan -B Black
                $securedpassword = Read-Host -AsSecureString
                $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($securedpassword)
                $password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)
                Set-Location $steamdirectory
                $steamcmdparams = @("+login $username $password", "+Exit")
                & $steamexecutable $steamcmdparams
                New-TryagainSteamLogin
                Write-Host "Please Wait: " -F Y
                $steamcmdparams = @( "+login", "$username", "$password", "+force_install_dir $serverdir", "+app_update $appid $branch validate", "+Exit")
                & $steamexecutable  $steamcmdparams | Tee-Object -Variable 'appinstalllog'
                compare-SteamExit
            }
            Set-Location $currentdir
        }
        Else {
            $global:warnmessage = "fn_InstallServerFiles"
            Get-warnmessage
        }
    }
}
