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
    $sourcemetainstall = @(17515, 237410, 232250, 276060, 346680, 228780, 475370, 383410, 238430, 740, 232290, 462310, 317800, 460040, 17585, 17555, 295230, 4020, 232370, 222860, 332670, 17505, 329710)
    If ($sourcemetainstall -contains $appid) {
        Get-SourceMetaModQ
    }
    ElseIF ($appid -eq 258550) {
        Get-OxideQ
    }
    ElseIF ($appid -eq 11500000) {
        Get-InstallForgeQ
    }
    Else {
        Get-Infomessage "No Mods Available " 'warning'
        Write-log "No Mods Available"
    }
}