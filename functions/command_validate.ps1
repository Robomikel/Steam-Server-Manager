#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-ValidateServer {
    Set-Location $steamdirectory >$null 2>&1
    Write-Warning 'Validate May Overwrite some config files'
    Write-Host 'Press any key to continue...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    $infomessage -eq "validating"
    Get-Infomessage
    If ($anon -eq "yes") {
        $steamcmdparams = @( "+@NoPromptForPassword 1","+login", "anonymous","+force_install_dir $serverdir", "+app_update $appid $branch validate", "+Exit")
        & $steamexecutable $steamcmdparams | Tee-Object -Variable 'appinstalllog'
        compare-SteamExit
    }
    Else {
        $steamcmdparams = @( "+login", "$username","$password","+force_install_dir $serverdir", "+app_update $appid $branch validate", "+Exit")
        & $steamexecutable $steamcmdparams| Tee-Object -Variable 'appinstalllog'
        compare-SteamExit
    }
    Set-Location $currentdir
}