
#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Install-ServerFiles {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($APPID -eq 11421000) {
        # Write-log "info: 11421000 $true"
    }
    ElseIf ($APPID -eq 11500000) {
        # Write-log  "info: 11500000 $true"
    }
    Else {
        If ($anon) {
            If ($steamexecutable -and $steamdirectory) {
                push-location
                Set-Location $steamdirectory
                If ($ANON -eq "yes") {
                    $steamcmdparams = @("+@NoPromptForPassword 1", "+force_install_dir $serverdir", "+login", "anonymous", "+app_update $appid $branch validate", "+Exit")
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
                            # Set-Location $steamdirectory
                            # $steamcmdparams = @("+login $username $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr))", "+Exit")
                            # & $steamexecutable $steamcmdparams
                            # New-TryagainSteamLogin
                            Get-Infomessage "+force_install_dir $serverdir" 'info'
                            Get-Infomessage "+app_update $appid $branch validate " 'info'
                            Get-Infomessage "Use Steamcmd to login for download " 'info'
                            $steamcmdparams = @("+force_install_dir $serverdir", "+login", "$username", "$([System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr))", "+app_update $appid $branch validate", "+Exit")
                            # & $steamexecutable  $steamcmdparams | Tee-Object -Variable 'appinstalllog'
                            & $steamexecutable $steamcmdparams
                            # compare-SteamExit
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
