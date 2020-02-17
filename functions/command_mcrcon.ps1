#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Set-ConnectMCRcon {
    If ($global:Useprivate -eq "0") {
        set-location $global:currentdir\mcrcon\mcrcon-0.7.1-windows-x86-32
        .\mcrcon.exe -t -H $global:EXTIP -P $global:RCONPORT -p $global:RCONPASSWORD
        set-location $global:currentdir
    }
    Else {
        set-location $global:currentdir\mcrcon\mcrcon-0.7.1-windows-x86-32
        .\mcrcon.exe -t -H $global:IP -P $global:RCONPORT -p $global:RCONPASSWORD
        set-location $global:currentdir
    }
}