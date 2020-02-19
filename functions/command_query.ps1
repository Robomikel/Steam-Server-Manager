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
    If (( $appid -eq 581330) -or ($appid -eq 376030) -or ($appid -eq 443030)) {
        Write-Host '****   Using queryport    ****' -F Y -B Black
        If (($null -eq ${queryport} ) -or ("" -eq ${queryport} )) {
            Write-Host '****   Missing queryport Var!   ****' -F R -B Black
        }
        ElseIf ($command -eq "gamedig") {
            .\gamedig --type $querytype ${extip}:${queryport} --pretty
        }
        ElseIf ($Useprivate -eq "1") {
            .\gamedig --type $querytype ${ip}:${queryport} --pretty
        }
    }
    ElseIf (($null -eq ${port}) -or ("" -eq ${port} )) {
        Write-Host '****   Missing port Var!   ****' -F R -B Black
    }
    ElseIf ($Useprivate -eq "1") {
        .\gamedig --type $querytype ${ip}:${port} --pretty
    }
    Else {
        .\gamedig --type $querytype ${extip}:${port} --pretty
        
    }
    Set-Location $currentdir
}