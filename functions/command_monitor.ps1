#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-MonitorServer {
    If ($global:appid -eq "996560") { 
        Get-MonitorMultiple 
    }
    Else {
        Write-Host '****   Monitor  Server process    *****' -F Y -B Black 
        If ($Null -eq (Get-Process "$process" -ea SilentlyContinue)) {
            Write-Host "----   NOT RUNNING   ----" -F R -B Black
            $global:alert = "restart"
            New-DiscordAlert
        }
        Else {
            Write-Host "****   RUNNING   ****" -F Green -B Black ; ; Get-Process "$process"
            Get-ClearVariables
            Exit 
        }
        Get-CheckForError
    }
}

Function Get-MonitorMultiple {
    $global:process = get-process | Where-Object { $_.ProcessName -match $process } | get-process
    
    If ($null -eq $process) {
        Write-Host "----   NOT RUNNING   ----" -F R -B Black
        $global:alert = "restart"
        New-DiscordAlert 
    }
    Else {
        Write-Host "****   RUNNING   ****" -F Green -B Black
        $process 
        Get-ClearVariables 
        Exit
    }
}