#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Set-ConnectMCRcon {
    Write-log "Function: Set-ConnectMCRcon"
    If ($ssmlog -and $loggingdate) {
        Write-log "Starting McRcon"
        If ($mcrconexecutable) {
            Push-location
            set-location $mcrcondirectory
            If ($Useprivate -eq "off") {
                If (!( ${rconport} )) {
                    Write-log "Using Port ${extip} -P ${port} -p $rconpassword"
                    & $mcrconexecutable -t -H ${extip} -P ${port} -p $rconpassword
                }
                Else {
                    Write-log "Using RconPort ${extip} -P ${rconport} -p $rconpassword"
                    & $mcrconexecutable -t -H ${extip} -P ${rconport} -p $rconpassword
                }
            }
            Else {
                If (!( ${rconport} )) {
                    Write-log "Using Port ${ip} -P ${port} -p $rconpassword"
                    & $mcrconexecutable -t -H ${ip} -P ${port} -p $rconpassword
                }
                Else {
                    Write-log "Using Port ${ip} -P ${rconport} -p $rconpassword"
                    & $mcrconexecutable -t -H ${ip} -P ${rconport} -p $rconpassword
                }
            }
            Pop-location
        }
        ElseIf (!$mcrconexecutable) {
            Get-warnmessage "fn_Set-ConnectMCRcon"
        }
    }
}
Function invoke-sourcerestart {
    Write-log "Function: invoke-sourcerestart"
    Write-log "Starting McRcon for source restart"
    If ($mcrconexecutable) {
        push-location
        set-location $mcrcondirectory
        If ($Useprivate -eq "off") {
            If (!${rconport}) {
                Write-log "Using Port ${extip} -P ${port} -p $rconpassword _restart"
                & $mcrconexecutable -c -H ${extip} -P ${port} -p $rconpassword "_restart"
                # & $mcrconexecutable -t -H ${extip} -P ${port} -p $rconpassword
            }
            Else {
                Write-log "Using RconPort ${extip} -P ${rconport} -p $rconpassword _restart"
                # & $mcrconexecutable -t -H ${extip} -P ${rconport} -p $rconpassword
                & $mcrconexecutable -c -H ${extip} -P ${rconport} -p $rconpassword "_restart"
                
            }
        }
        Else {
            If (!${rconport}) {
                Write-log "Using Port ${ip} -P ${port} -p $rconpassword _restart"
                # & $mcrconexecutable -t -H ${ip} -P ${port} -p $rconpassword
                & $mcrconexecutable -c -H ${ip} -P ${port} -p $rconpassword "_restart"
            }
            Else {
                Write-log "Using Port ${ip} -P ${rconport} -p $rconpassword _restart"
                # & $mcrconexecutable -t -H ${ip} -P ${rconport} -p $rconpassword
                & $mcrconexecutable -c -H ${ip} -P ${rconport} -p $rconpassword "_restart"
            }
        }
        Pop-Location
    }
    ElseIf (!$mcrconexecutable) {
        Get-warnmessage "Set-ConnectMCRcon"      
    }
}
