#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-CheckNonSteam {
    If (($global:APPID -eq 11421000 ) -or ($global:APPID -eq 11500000 )){
        If ($global:command -eq "install" ) {
            Read-AppID
            New-CreateVariables
            Get-Finished
            Exit
        }ElseIf($global:command -eq "Update" ){
            If ($global:APPID -eq 11500000 ){
                Get-MCversion
                Exit
            }Else{
            Get-MCbrversion
            Exit
            }
        }ElseIf($global:command -eq "ForceUpdate" ){
            Write-Host "ForceUpdate not available for this server" -F Y
            Write-Host "Try Install Command to download and overwrite files" -F Y
            Pause
            Exit
        }ElseIf($global:command -eq "validate" ){
            Write-Host "validate not available for this server" -F Y
            Write-Host "Try Install Command to download and overwrite files" -F Y
            Pause
            Exit
        }
    }
}