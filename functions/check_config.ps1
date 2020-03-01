#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   

#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-CheckForVars {
    Add-Content $ssmlog "[$loggingdate] checking Server Variables"
    If ($command) {
        If ($command -eq "mcrcon") {
            $missingvars = $port, $rconpassword, ${extip}, ${ip}
        }
        ElseIf ($command -eq "query") {
            $missingvars = $querytype, ${extip}, ${port}, ${ip}
        }
        Else {
            $missingvars = $appid, $process, $anon, $launchParams
        }
        Foreach ($missingvars in $missingvars) {
            If ( !$missingvars) {
                $global:warnmessage = "missingvars"
                Get-warnmessage
            }
        }   
    }
    ElseIf (!$command) {
        $global:warnmessage = "chkvarsfailed"
        Get-warnmessage
        Exit
    }
}