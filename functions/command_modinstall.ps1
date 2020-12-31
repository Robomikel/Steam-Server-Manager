#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Modinstall {
    Write-log "Function: Get-Modinstall"
    $sourcemetainstall = @(17515, 237410, 232250, 276060, 346680, 228780, 475370, 383410, 238430, 232290, 462310, 317800, 460040, 17585, 17555, 295230, 4020, 232370, 222860, 332670, 17505, 329710)
    If ($sourcemetainstall -contains $appid) {
        Get-SourceMetaModQ
    }
    ElseIf ($appid -eq 740) {
        Show-CSGOModMenu
    }
    ElseIf ($appid -eq 258550) {
        Get-OxideQ
    }
    ElseIf ($appid -eq 11500000) {
        Get-InstallForgeQ
    }
    Else {
        Get-Infomessage "No Mods Available " 'warning'
        Write-log "No Mods Available"
    }

}

Function Show-CSGOModMenu {
    Write-log "Function: Show-CSGOModMenu"
    Write-Host ".:.:.:.:.:.:.:. CSGO Mod Menu .:.:.:.:.:.:.:.
    Choose Option: " -F Cyan
    $command = Menu @('SourceMod/metmod', 'Get5', 'csgo-pug-setup', 'Steamworks')
    clear-Host
    Set-Console  >$null 2>&1
    If ($command -eq 'SourceMod/metmod') {
        Get-SourceMetaMod
    } 
    ElseIf ($command -eq 'Get5') {
        Get-CSGOGet5
    }
    ElseIf ($command -eq 'csgo-pug-setup') {
        Get-CSGOcsgopugsetup
    }
    ElseIf ($command -eq 'Steamworks') {
        Get-CSGOsteamworks
    }
}

Function Get-UpdateMods {
    Write-log "Function: Get-UpdateMods"
    Get-installedMods
    If ($installedmods.Name -eq "MetaMod" -or $installedmods.Name -eq "SourceMod") {
        Get-SourceMetaMod
    } 
    ElseIf ($installedmods.Name -eq "CSGO-Get5") {
        Get-CSGOGet5
    }
    ElseIf ($installedmods.Name -eq "CSGO-pugsetup") {
        Get-CSGOcsgopugsetup
    }
    ElseIf ($installedmods.Name -eq "SteamWorks") {
        Get-CSGOsteamworks
    }
    ElseIf ($installedmods.Name -eq "Oxide") {
        Get-Oxide
    }
    ElseIf ($installedmods.Name -eq "Minecraft Forge") {
        Get-InstallForge
    }
}

Function Import-installedMods {
    If ($("$currentdir\$serverfiles\mods.json")) {
        Get-UpdateMods
    }
}