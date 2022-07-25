#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Modinstall {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $script:sourcemetainstall = @(17515, 237410, 232250, 276060, 228780, 475370, 383410, 238430, 232290, 462310, 317800, 460040, 17585, 17555, 295230, 4020, 232370, 222860, 332670, 17505, 329710)
    If ($sourcemetainstall -contains $appid) {
        #Get-SourceMetaModQ
        Show-ModMenu
    }
    ElseIf ($appid -eq 740) {
        Show-ModMenu
    }
    ElseIf ($appid -eq 258550) {
        #Get-OxideQ
        Show-ModMenu
    }
    ElseIf ($appid -eq 11500000) {
        #Get-InstallForgeQ
        Show-ModMenu
    }
    ElseIf ($appid -eq 294420){
        Show-ModMenu
    }
    ElseIf ($appid -eq 346680){
        Show-ModMenu
    }
    Else {
        Get-Infomessage "No Mods Available " 'warning'
        Write-log "No Mods Available"
    }

}

Function Show-ModMenu {
    Write-log "Function: $($MyInvocation.Mycommand)"
    Get-installedMods
    Write-Host ".:.:.:.:.:.:.:. Mod Menu .:.:.:.:.:.:.:.
    Choose Option: " -F Cyan
    If ($appid -eq 740) {
        $command = Menu @('SourceMod','Metamod', 'Get5', 'csgo-pug-setup', 'Steamworks')
    }
    ElseIf ($appid -eq 258550){
        $command = Menu @('Oxide')
    }
    ElseIf ($appid -eq 11500000){
        $command = Menu @('Minecraft Forge')
    }
    ElseIf($sourcemetainstall -contains $appid) {
        $command = Menu @('SourceMod','Metamod')
    }
    ElseIf ($appid -eq 294420){
        $command = Menu @('subquakes-undead-legacy')
    }
    ElseIf ($appid -eq 346680){
        $command = Menu @('bmdm-srccoop')
    }
    Set-Console
    If ($command -eq 'SourceMod') {
        # Get-SourceMetaMod
        Get-SourceMod
        Get-MetaMod
    }
    ElseIf ($command -eq 'Metamod') {
        # Get-SourceMetaMod
        Get-MetaMod
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
    ElseIf ($command -eq 'Minecraft Forge') {
        Get-InstallForge
    }
    ElseIf ($command -eq 'Oxide') {
        Get-Oxide
    }
    ElseIf ($command -eq 'subquakes-undead-legacy') {
        #Get-Oxide
        Get-undeadlegacy
    }
    ElseIf ($command -eq 'bmdm-srccoop') {
        #Get-Oxide
        Get-BlackMesaSrcCoop
        Get-SourceMod
        Get-MetaMod
    }
}

Function Get-UpdateMods {
    Write-log "Function: $($MyInvocation.Mycommand)"
    Get-installedMods
    If ($($installedmods.Mods) -like "*MetaMod*" -or $installedmods -like "*SourceMod*") {
        #Get-SourceMetaMod
        Get-MetaMod
        Get-SourceMod
    } 
    If ($($installedmods.Mods) -like "*CSGO-Get5*") {
        Get-CSGOGet5
    }
    If ($($installedmods.Mods) -like "*CSGO-pugsetup*") {
        Get-CSGOcsgopugsetup
    }
    If ($($installedmods.Mods) -like "*SteamWorks*") {
        Get-CSGOsteamworks
    }
    If ($($installedmods.Mods) -like "*Oxide*") {
        Get-Oxide
        Initialize-plugins
    }
    If ($($installedmods.Mods) -like "*Minecraft Forge*") {
        Get-InstallForge
    }
}