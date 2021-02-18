#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-GamedigServerv2 {
    Write-log "Function: Get-GamedigServerv2"
    If ($ssmlog -and $loggingdate) {
        If ($nodejsdirectory) {
            Write-log "Starting gamedig on Server  "
            set-location $nodejsdirectory
            If ($Useprivate -eq "off") {
                If (!${queryport}) {
                    Write-log " Using port $querytype ${extip}:${port} "
                    If (!(test-path $nodejsprogramexecutable)) {
                        $queryOutput = (((((  .\gamedig --type $querytype ${extip}:${port} --pretty  ).trim()).replace('"', '')).replace('{', '')).replace(',', '')).replace('}', '') ; $queryOutput
                    }
                    Else {
                        # saps powershell -args ("  $queryOutput = (((((  gamedig --type $querytype ${extip}:${port} --pretty  ).trim()).replace(`'`"`',`'`')).replace(`'{`',`'`')).replace(`',`',`'`')).replace(`'}`',`'`') ; $queryOutput")
                        # $queryOutput = saps powershell -args ("gamedig --type $querytype ${extip}:${port} --pretty") -wait -nnw
                        # $queryOutput = ((((($queryOutput).trim()).replace('"', '')).replace('{', '')).replace(',', '')).replace('}', '') ; $queryOutput
                        $queryOutput = (((((  gamedig --type $querytype ${extip}:${port} --pretty  ).trim()).replace('"', '')).replace('{', '')).replace(',', '')).replace('}', '') ; $queryOutput

                    }
                }
                Else {
                    Write-log " Using queryport $querytype ${extip}:${queryport}"
                    If (!(test-path $nodejsprogramexecutable)) {
                        $queryOutput = (((((  .\gamedig --type $querytype ${extip}:${queryport} --pretty ).trim()).replace('"', '')).replace('{', '')).replace(',', '')).replace('}', '') ; $queryOutput 
                    }
                    Else {
                        # saps powershell -args ("  $queryOutput = (((((  gamedig --type $querytype ${extip}:${port} --pretty  ).trim()).replace(`'`"`',`'`')).replace(`'{`',`'`')).replace(`',`',`'`')).replace(`'}`',`'`') ; $queryOutput")
                        # $queryOutput = saps powershell -args ("gamedig --type $querytype ${extip}:${queryport} --pretty") -wait -nnw
                        # $queryOutput = ((((($queryOutput).trim()).replace('"', '')).replace('{', '')).replace(',', '')).replace('}', '') ; $queryOutput
                        $queryOutput = (((((  gamedig --type $querytype ${extip}:${queryOutput} --pretty  ).trim()).replace('"', '')).replace('{', '')).replace(',', '')).replace('}', '') ; $queryOutput

                    }
                }
            }
            Else {
                If (!${queryport}) {
                    Write-log " Using port $querytype ${ip}:${port} "
                    If (!(test-path $nodejsprogramexecutable)) {
                        $queryOutput = ((((( .\gamedig --type $querytype ${ip}:${port} --pretty ).trim()).replace('"', '')).replace('{', '')).replace(',', '')).replace('}', '') ; $queryOutput
                    }
                    Else {
                        # saps powershell -args ("  $queryOutput = (((((  gamedig --type $querytype ${extip}:${port} --pretty  ).trim()).replace(`'`"`',`'`')).replace(`'{`',`'`')).replace(`',`',`'`')).replace(`'}`',`'`') ; $queryOutput")
                        # $queryOutput = saps powershell -args ("gamedig --type $querytype ${ip}:${port} --pretty") -wait -nnw
                        # $queryOutput = ((((($queryOutput).trim()).replace('"', '')).replace('{', '')).replace(',', '')).replace('}', '') ; $queryOutput
                        $queryOutput = (((((  gamedig --type $querytype ${ip}:${port} --pretty  ).trim()).replace('"', '')).replace('{', '')).replace(',', '')).replace('}', '') ; $queryOutput

                    }
                }
                Else {
                    Write-log "Using queryport $querytype ${ip}:${queryport}"
                    If (!(test-path $nodejsprogramexecutable)) {
                        $queryOutput = (((((  .\gamedig --type $querytype ${ip}:${queryport} --pretty ).trim()).replace('"', '')).replace('{', '')).replace(',', '')).replace('}', '') ; $queryOutput 
                    }
                    Else {
                        # saps powershell -args ("  $queryOutput = (((((  gamedig --type $querytype ${extip}:${port} --pretty  ).trim()).replace(`'`"`',`'`')).replace(`'{`',`'`')).replace(`',`',`'`')).replace(`'}`',`'`') ; $queryOutput")
                        # $queryOutput = saps powershell -args ("gamedig --type $querytype ${ip}:${queryport} --pretty") -wait -nnw
                        # $queryOutput = ((((($queryOutput).trim()).replace('"', '')).replace('{', '')).replace(',', '')).replace('}', '') ; $queryOutput
                        $queryOutput = (((((  gamedig --type $querytype ${ip}:${queryport} --pretty  ).trim()).replace('"', '')).replace('{', '')).replace(',', '')).replace('}', '') ; $queryOutput

                    }
                }
                #$queryOutput
                # $queryOutput =  $queryOutput | ConvertFrom-Json

                # Write-Host "Name: $($queryOutput.name)"
                # Write-Host "Map: $($queryOutput.map)"
                # Write-Host "Password: $($queryOutput.password)"
                # Write-Host "Maxplayers: $($queryOutput.maxplayers)"
                # Write-Host "Online Players: $($queryOutput.players)"
                # Write-Host "Current bots: $($queryOutput.bots)"
                # Write-Host "Ping: $($queryOutput.ping)"
                # Write-Host "connect: $($queryOutput.connect)"
                # Write-Host "Rules: "
                # $($queryOutput.raw.rules)
                # Write-Host "Tags: "
                # $($queryOutput.raw.tags)
                # set-location $ssmwd
            }
            pop-location -StackName cwd
        }
    }
}

Function Get-GamedigServervMonitor {
    Write-log "Function: Get-GamedigServervMonitor"
    If ($ssmlog -and $loggingdate) {
        If ($nodejsdirectory) {
            Write-log "Starting gamedig Monitor on Server  "
            set-location $nodejsdirectory
            If ($Useprivate -eq "off") {
                If (!${queryport}) {
                    Write-log " Using port $querytype ${extip}:${port} "
                    If (!(test-path $nodejsprogramexecutable)) {
                        $queryOutput = .\gamedig --type $querytype ${extip}:${port} --pretty
                    }
                    Else {
                        $queryOutput = gamedig --type $querytype ${extip}:${port} --pretty
                    }
                }
                Else {
                    Write-log " Using queryport $querytype ${extip}:${queryport}"
                    If (!(test-path $nodejsprogramexecutable)) {
                        $queryOutput = .\gamedig --type $querytype ${extip}:${queryport} --pretty
                    }
                    Else {
                        $queryOutput = gamedig --type $querytype ${extip}:${queryport} --pretty
                    }
                }
            }
            Else {
                If (!${queryport}) {
                    Write-log " Using port $querytype ${ip}:${port} "
                    If (!(test-path $nodejsprogramexecutable)) {
                        $queryOutput = .\gamedig --type $querytype ${ip}:${port} --pretty
                    }
                    Else {
                        $queryOutput = gamedig --type $querytype ${ip}:${port} --pretty
                    }
                }
                Else {
                    Write-log "Using queryport $querytype ${ip}:${queryport}"
                    If (!(test-path $nodejsprogramexecutable)) {
                        $queryOutput =  .\gamedig --type $querytype ${ip}:${queryport} --pretty
                    }
                    Else {
                        $queryOutput = gamedig --type $querytype ${ip}:${queryport} --pretty
                    }
                }
                #$queryOutput
                $queryOutput =  $queryOutput | ConvertFrom-Json
                Write-log "Ping: $($queryOutput.ping)"
                $script:pingstatus = $($queryOutput.ping)
            }
            Pop-Location -StackName cwd
        }
    }
}