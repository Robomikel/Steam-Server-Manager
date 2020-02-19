#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-GamedigServerv2 {
    Write-Host '****   Starting gamedig on Server   ****' -F M -B Black
    Set-Location $currentdir\node-v$nodeversion-win-x64\node-v$nodeversion-win-x64
    If (( $AppID -eq 581330) -or ($AppID -eq 376030) -or ($AppID -eq 443030)) {
        Write-Host '****   Using QUERYPORT    ****' -F Y -B Black
        If (($null -eq ${QUERYPORT} ) -or ("" -eq ${QUERYPORT} )) {
            Write-Host '****   Missing QUERYPORT Var!   ****' -F R -B Black
        }
        ElseIf ($command -eq "gamedig") {
            .\gamedig --type $GAME ${EXTIP}:${QUERYPORT} --pretty
        }
        ElseIf ($Useprivate -eq "1") {
            .\gamedig --type $GAME ${IP}:${QUERYPORT} --pretty
        }
    }
    ElseIf (($null -eq ${PORT}) -or ("" -eq ${PORT} )) {
        Write-Host '****   Missing PORT Var!   ****' -F R -B Black
    }
    ElseIf ($Useprivate -eq "1") {
        .\gamedig --type $GAME ${IP}:${PORT} --pretty
    }
    Else {
        .\gamedig --type $GAME ${EXTIP}:${PORT} --pretty
        
    }
    Set-Location $currentdir
}