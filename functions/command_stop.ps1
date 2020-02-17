#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-StopServer {
    If ($global:APPID -eq "996560") { Get-StopMultiple }Else {
        Write-Host '****   Stopping Server process   *****' -F M -B Black 
        If ($Null -eq (Get-Process "$global:PROCESS" -ea SilentlyContinue)) {
            Write-Host "----   NOT RUNNING   ----" -F R -B Black
        }
        Else { Stop-Process -Name "$global:PROCESS" -Force }
        Get-CheckForError
    }
}
Function Get-StopServerInstall {
    If ($global:APPID -eq "996560") { Get-StopMultiple }Else {
        Write-Host '****   Stopping Server process   *****' -F M -B Black 
        If ($Null -eq (Get-Process "$global:PROCESS" -ea SilentlyContinue)) {
            Write-Host "****   No Process found   ****" -F Y -B Black
        }
        Else {
            Write-Host "****   Stopping Server Process   *****" -F M -B Black
            Stop-Process -Name "$global:PROCESS" -Force
        }
    }
}   

Function Get-StopMultiple {

    $mPROCESS = get-process | Where-Object { $_.ProcessName -match $global:PROCESS }
    If ($null -eq $mPROCESS) { Write-Host "----   NOT RUNNING   ----" -F R -B Black }Else {
        Write-Host "****   Stopping Server Process   *****" -F M -B Black
        get-process | Where-Object { $_.ProcessName -match $global:PROCESS } | stop-process -force
    }
}