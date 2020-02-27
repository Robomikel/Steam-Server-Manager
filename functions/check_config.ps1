#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   

#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-CheckForVars {
    If ($command) {
        # Write-Host "****   Checking for Vars   ****" -F Y -B Black
        If ($command -eq "mcrcon") {
            $missingvars = $rconport, $rconpassword
        }
    }
    Else {
        $missingvars = ${queryport}, ${ip}, $appid, $process, ${port}, $anon
    }
    Foreach ($missingvars in $missingvars) {
        If ( !($missingvars)) {
            Get-varsmessage
        }
    }
    ElseIf (!($command)) {
        Add-Content $ssmlogdir\ssm-$datelog-.log "[$logdate] fn_Get-CheckForVars Missing $command"
    }
}