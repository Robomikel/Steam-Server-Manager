#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-CheckServer {
    If ($global:APPID -eq "996560") { 
        Get-checkMultiple 
    }
    Else {
        Write-Host '****   Check  Server process    *****' -F Y -B Black 
        If ($Null -eq (Get-Process "$global:PROCESS" -ea SilentlyContinue)) {
            Write-Host "----   NOT RUNNING   ----" -F R -B Black
        }
        Else { Write-Host "****   RUNNING   ****" -F Green -B Black ; ; Get-Process "$global:PROCESS" ; ; Get-ClearVariables ; ; Exit }
        Get-CheckForError
    }
}

Function Get-checkMultiple {
    $global:PROCESS = get-process | Where-Object { $_.ProcessName -match $global:PROCESS } | get-process
    
    If ($null -eq $global:PROCESS) { Write-Host "----   NOT RUNNING   ----" -F R -B Black }Else {
        Write-Host "****   RUNNING   ****" -F Green -B Black ; ; $global:PROCESS ; ; Get-ClearVariables ; ; Exit
    }
}