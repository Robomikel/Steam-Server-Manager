#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-FolderNames {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($ssmlog -and $loggingdate) {
        Write-log "Checking Folder Names "
        If ("$serverdir") {
            If (Test-Path "$serverdir") {
                Write-log "Folder Name Exists   $serverdir "
            }
            ElseIf (!(Test-Path "$serverdir")) {
                New-ServerFolderq
            }
        }
        ElseIf (!"$serverdir") {
            Get-warnmessage "fngetfoldersfailed"
        }
    }
}

Function New-LocalFolder {
    Write-log "Function: $($MyInvocation.Mycommand)" 
    ##-- 
    $global:configlocal = "config-local"
    If (Test-Path $currentdir\$configlocal ) {
        Write-log "config-local Folder Already Created!   "
    }
    Else {
        Write-log "Creating: config-local Folder  "
        New-Item $currentdir -Name "$configlocal" -ItemType "directory" | Out-File -Append -Encoding Default  $ssmlog
        If(!$?){
            Write-log "Failed: Creating config-local Folder  "
        }
    }
    New-defaultFolder
}

Function New-defaultFolder {
    Write-log "Function: $($MyInvocation.Mycommand)"  
    ##-- 
    $global:configdefault = "config-default"
    If (Test-Path $currentdir\$configdefault) {
        Write-log "config-default Folder Already Created!   "
    }
    Else {
        Write-log "Creating: config-default Folder  "
        New-Item $currentdir -Name "$configdefault" -ItemType "directory" | Out-File -Append -Encoding Default  $ssmlog
        If(!$?){
            Write-log "Failed: Creating config-default Folder  "
        }
    }
}

