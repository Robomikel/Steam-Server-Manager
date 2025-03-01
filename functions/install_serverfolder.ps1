#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-ServerFolder {
    Write-log "Function: $($MyInvocation.Mycommand)"  
    ##-- Create Folder for Server -- In current folder
    If (!$serverfiles -or $serverfiles -eq " ") {
        Write-Warning 'Entered a null or Empty value'
        write-log "Warning: Entered null or Empty value"
        Read-Host "Press Enter to continue"
        Select-Steamer
    }
    ElseIf (!$appid -or $appid -eq " ") {
        Write-Warning 'Entered a null or Empty value'
        write-log "Warning: Entered null or Empty value"
        Read-Host "Press Enter to continue"
        Select-Steamer
    }
    ElseIf (Test-Path "$sfwd\$serverfiles" ) {
        Write-log "info: Server Folder Already Created!   "
    }
    Else {
        Write-log "info: Creating Server Folder  "
        New-Item  $sfwd -Name "$serverfiles" -ItemType Directory | Out-File -Append -Encoding Default  $ssmlog
        If(!$?){
            Write-log "Failed: Creating Server Folder  "
        }
    }
}
