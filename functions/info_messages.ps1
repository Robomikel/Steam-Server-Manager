#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Infomessage {
    If ($InfoMessage -eq "discord"){
        Write-infoMessageDiscord
    }
}
Function Write-infoMessageDiscord {
    Write-Host '****   Sending Discord Alert   ****' -F M -B Black
}
Function Get-Finished {
    Get-ClearVariables
    Write-Host "*************************************" -F Y
    Write-Host "***  Server $command is done!  $CHECKMARK ****" -F Y
    Write-Host "*************************************" -F Y
    Write-Host "  ./ssm start $serverfiles  "-F Black -B White
}

Function Get-varsmessage {
    Write-Host "----------------------------------------------------------------------------" -F Y -B Black
    Write-Host "$DIAMOND $DIAMOND Missing Vars ! $DIAMOND $DIAMOND" -F R -B Black
    Write-Host "Try install command again or check vars in Variables-$serverfiles.ps1" -F Y -B Black
    Write-Host "----------------------------------------------------------------------------" -F Y -B Black
    Exit
}

Function Get-adminMessage {
    Write-Host "----------------------------------------------------------------------------" -F Y -B Black
    Write-Host "                 $DIAMOND $DIAMOND Do Not Run as an Admin account $DIAMOND $DIAMOND" -F R -B Black
    Write-Host "***  Please Create a Non Admin Account to run script and game server  ******" -F Y -B Black
    Write-Host "----------------------------------------------------------------------------" -F Y -B Black
}
Function Get-CheckForError {
    If (!$?) {
        Write-Host "----------------------------------------------------------------------------" -F Y -B Black
        Write-Host "      $DIAMOND $DIAMOND Command $command Failed! $DIAMOND $DIAMOND" -F R -B Black
        Write-Host "***        Try install command again          ****  " -F Y -B Black
        Write-Host "----------------------------------------------------------------------------" -F Y -B Black
        Exit
    }
}