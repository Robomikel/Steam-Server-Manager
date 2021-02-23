
#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Install-ServerFiles {
    Write-log "Function: Install-ServerFiles"
    If ($APPID -eq 11421000) {
        Write-log "11421000 $true"
    }
    ElseIf ($APPID -eq 11500000) {
        Write-log  "11500000 $true"
    }
    Else {
        If ($anon) {
            If ($steamexecutable -and $steamdirectory) {
                push-location
                Set-Location $steamdirectory
                If ($ANON -eq "yes") {
                    $steamcmdparams = @("+@NoPromptForPassword 1", "+login", "anonymous", "+force_install_dir $serverdir", "+app_update $appid $branch validate", "+Exit")
                    Get-Infomessage "Please Wait: Will Display console in a moment" 'info'
                    & $steamexecutable $steamcmdparams | Tee-Object -Variable 'appinstalllog'
                    # Write-log "$appinstalllog"
                    compare-SteamExit
                }
                Else {
                    Write-Host "Enter Username for Steam install" -F Cyan -B Black
                    $username = Read-host
                    If ($username) {
                        Write-Host "Enter steam password" -F Cyan -B Black
                        $securedpassword = Read-Host -AsSecureString
                        If ($securedpassword) {
                            $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($securedpassword)
                            $password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)
                            # Set-Location $steamdirectory
                            $steamcmdparams = @("+login $username $password", "+Exit")
                            & $steamexecutable $steamcmdparams
                            New-TryagainSteamLogin
                            Get-Infomessage "Please Wait: " 'info'
                            $steamcmdparams = @( "+login", "$username", "$password", "+force_install_dir $serverdir", "+app_update $appid $branch validate", "+Exit")
                            & $steamexecutable  $steamcmdparams | Tee-Object -Variable 'appinstalllog'
                            compare-SteamExit
                        }
                    }
                }
                Pop-location
            }
        }
        Else {
            Get-warnmessage "fn_InstallServerFiles"
        }
    }
}
