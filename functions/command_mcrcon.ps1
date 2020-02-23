#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Set-ConnectMCRcon {
    If ($Useprivate -eq "off") {
        set-location $mcrcondirectory
        If (($null -eq ${rconport} ) -or ("" -eq ${rconport} )) {
            .\mcrcon.exe -t -H ${extip} -P ${port} -p $rconpassword
        }
        Else {
            .\mcrcon.exe -t -H ${extip} -P ${rconport} -p $rconpassword
        }
        set-location $currentdir
    }
    Else {
        set-location $mcrcondirectory
        If (($null -eq ${rconport} ) -or ("" -eq ${rconport} )) {
            .\mcrcon.exe -t -H ${ip} -P ${port} -p $rconpassword
        }
        Else {
            .\mcrcon.exe -t -H ${ip} -P ${rconport} -p $rconpassword
        }
        set-location $currentdir
    }
}