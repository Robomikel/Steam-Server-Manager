#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-UpdateSteamer {
    Write-log "Function: $($MyInvocation.Mycommand)"
    Get-UpdateSteamerCSV
    Get-UpdateSteamerConfigDefault
    Get-UpdateSteamerSSM
    $getlocalssm = $(Get-ChildItem -Depth 1 $currentdir\functions\ -Force)
    If ($getlocalssm) {
        ForEach ($getlocalssm in $getlocalssm ) {  
            $global:getlocalssmname = $getlocalssm.Name
            If ($getlocalssmname) {
                [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
                Try {
                    $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/Steam-Server-Manager/master/functions/$getlocalssmname" -UseBasicParsing
                }
                Catch {
                    Write-log "Warning: $_"
                    #Write-log $_.Exception.Message
                }
                If ($githubvarcontent) {
                    $githubvarcontent = ($githubvarcontent).Content
                    If ($githubvarcontent) {
                        If (Test-Path $currentdir\tmp) { } Else {
                            New-Item  $currentdir -Name 'tmp' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                        }
                        New-Item  "$currentdir\tmp\$getlocalssmname\" -Force >$null 2>&1
                        Add-Content "$currentdir\tmp\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        $githubvarcontenttrim = Get-Content $currentdir\tmp\$getlocalssmname | Where-Object { $_ -notlike "" }
                        If ($githubvarcontenttrim) {
                            $ssmcontentlocaltrim = Get-Content $currentdir\functions\$getlocalssmname | Where-Object { $_ -notlike "" }
                            If ($ssmcontentlocaltrim ) {
                                if (Compare-Object ($githubvarcontenttrim ) ($ssmcontentlocaltrim )) {
                                    clear-hostline 1
                                    Get-Infomessage 'ssmupdates' 'update'
                                    New-Item  "$currentdir\functions\$getlocalssmname" -Force >$null 2>&1
                                    Add-Content "$currentdir\functions\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                                } 
                                Else {
                                    clear-hostline 1
                                    Get-Infomessage 'nossmupdates' 
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
        Remove-Item "$currentdir\tmp" -Recurse -Force
        Write-Information 'Press Enter to Close this session' -InformationAction Continue
        Pause  
        Stop-Process -Id $PID
    }
}
Function Get-UpdateSteamerSSM {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $getlocalssm = $([pscustomobject]@{ Name = 'ssm.ps1' })
    If ($getlocalssm) {
        ForEach ($getlocalssm in $getlocalssm ) {  
            $global:getlocalssmname = $getlocalssm.Name
            If ($getlocalssmname) {
                Try {
                    $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/Steam-Server-Manager/master/$getlocalssmname" -UseBasicParsing
                }
                Catch {
                    Write-log "Warning: $_"
                    #Write-log $_.Exception.Message
                }
                If ($githubvarcontent) {
                    $githubvarcontent = ($githubvarcontent).Content
                    If ($githubvarcontent) {
                        If (Test-Path $currentdir\tmp) { } Else {
                            New-Item  $currentdir -Name 'tmp' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                        }
                        New-Item  "$currentdir\tmp\$getlocalssmname\" -Force >$null 2>&1
                        Add-Content "$currentdir\tmp\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        $githubvarcontenttrim = Get-Content $currentdir\tmp\$getlocalssmname | Where-Object { $_ -notlike "" }
                        If ($githubvarcontenttrim) {
                            $ssmcontentlocaltrim = Get-Content $currentdir\$getlocalssmname | Where-Object { $_ -notlike "" }
                            If ($ssmcontentlocaltrim ) {
                                if (Compare-Object ($githubvarcontenttrim ) ($ssmcontentlocaltrim )) {
                                    clear-hostline 1
                                    Get-Infomessage 'ssmupdates' 'update'
                                    New-Item  "$currentdir\$getlocalssmname" -Force >$null 2>&1
                                    Add-Content "$currentdir\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                                } 
                                Else {
                                    clear-hostline 1
                                    Get-Infomessage 'nossmupdates' 
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
        Remove-Item "$currentdir\tmp" -Recurse -Force
    }
}
Function Get-UpdateSteamerCSV {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $getlocalssm = Get-ChildItem -Depth 1 $currentdir\data\ -Force
    If ($getlocalssm) {
        ForEach ($getlocalssm in $getlocalssm ) {  
            $global:getlocalssmname = $getlocalssm.Name
            If ($getlocalssmname) {
                Try {
                    $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/Steam-Server-Manager/master/data/$getlocalssmname" -UseBasicParsing
                }
                Catch {
                    Write-log "Warning: $_"
                    #Write-log $_.Exception.Message
                }
                If ($githubvarcontent) {
                    $githubvarcontent = ($githubvarcontent).Content
                    If ($githubvarcontent) {
                        If (Test-Path $currentdir\tmp) { } Else {
                            New-Item  $currentdir -Name 'tmp' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                        }
                        New-Item  "$currentdir\tmp\$getlocalssmname\" -Force >$null 2>&1
                        Add-Content "$currentdir\tmp\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        $githubvarcontenttrim = Get-Content $currentdir\tmp\$getlocalssmname | Where-Object { $_ -notlike "" }
                        If ($githubvarcontenttrim) {
                            $ssmcontentlocaltrim = Get-Content $currentdir\data\$getlocalssmname | Where-Object { $_ -notlike "" }
                            If ($ssmcontentlocaltrim ) {
                                if (Compare-Object ($githubvarcontenttrim ) ($ssmcontentlocaltrim )) {
                                    clear-hostline 1
                                    Get-Infomessage 'ssmupdates' 'update'
                                    New-Item  "$currentdir\data\$getlocalssmname" -Force >$null 2>&1
                                    Add-Content "$currentdir\data\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                                } 
                                Else {
                                    clear-hostline 1
                                    Get-Infomessage 'nossmupdates' 
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
        Remove-Item "$currentdir\tmp" -Recurse -Force
    }
}
Function Get-UpdateSteamerConfigDefault {
    Write-log "Function: $($MyInvocation.Mycommand)"
    # $getlocalssm = $((Import-Csv $currentdir\data\serverlist.csv)."Default-Config")
    $getlocalssmname = $(Get-ChildItem -Depth 1 $currentdir\config-default\ -Force).Name
    If ($getlocalssmname) {
        ForEach ($getlocalssmname in $getlocalssmname ) {
            If ($getlocalssmname) {
                Try {
                    $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/config-default/master/$getlocalssmname" -UseBasicParsing
                }
                Catch {
                    Write-log "Warning: $_"
                    #Write-log $_.Exception.Message
                }
                If ($githubvarcontent) {
                    $githubvarcontent = ($githubvarcontent).Content
                    If ($githubvarcontent) {
                        If (Test-Path $currentdir\tmp) { } Else {
                            New-Item  $currentdir -Name 'tmp' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                        }
                        New-Item  "$currentdir\tmp\$getlocalssmname\" -Force >$null 2>&1
                        Add-Content "$currentdir\tmp\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        $githubvarcontenttrim = Get-Content $currentdir\tmp\$getlocalssmname | Where-Object { $_ -notlike "" }
                        If ($githubvarcontenttrim) {
                            if (Test-Path $currentdir\config-default\$getlocalssmname) {
                                $ssmcontentlocaltrim = Get-Content $currentdir\config-default\$getlocalssmname | Where-Object { $_ -notlike "" }
                                If ($ssmcontentlocaltrim ) {
                                    if (Compare-Object ($githubvarcontenttrim ) ($ssmcontentlocaltrim )) {
                                        clear-hostline 1
                                        Get-Infomessage 'ssmupdates' 'update'
                                        New-Item  "$currentdir\config-default\$getlocalssmname" -Force >$null 2>&1
                                        Add-Content "$currentdir\config-default\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                                    }
                                    Else {
                                        clear-hostline 1
                                        Get-Infomessage 'nossmupdates'
                                    }
                                }

                            }
                        }
                    }
                }
            }
        }
        Remove-Item "$currentdir\tmp" -Recurse -Force
    }
}
Function Get-SteamerConfigDefault {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $getlocalssm = Import-Csv $currentdir\data\serverlist.csv
    If ($getlocalssm) {
        $global:getlocalssmname = ($getlocalssm | Where-Object AppID -like $AppID).'Default-config'
        write-log "info: Default-Config: $getlocalssmname"
        If ($getlocalssmname) {
            Try {
                $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/config-default/master/$getlocalssmname" -UseBasicParsing
            }
            Catch {
                Write-log "Warning: $_"
                #Write-log $_.Exception.Message
            }
            # Write-log "Invoke-WebRequest https://raw.githubusercontent.com/Robomikel/config-default/master/$getlocalssmname"
            If ($githubvarcontent) {
                $githubvarcontent = ($githubvarcontent).Content
                If ($githubvarcontent) {
                    If (!(Test-Path $currentdir\config-default)) {
                        New-Item  $currentdir -Name 'config-default' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                    }
                    If ($getlocalssmname) {
                        If (!(Test-Path $currentdir\config-default\$getlocalssmname)) {
                            New-Item  "$currentdir\config-default\$getlocalssmname" -Force >$null 2>&1
                            Add-Content "$currentdir\config-default\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        }
                        If (!(Test-Path $currentdir\config-local\$getlocalssmname)) {
                            New-Item  "$currentdir\config-local\$getlocalssmname\" -Force >$null 2>&1
                            Add-Content "$currentdir\config-local\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        }
                    }
                }
            }
        }
        New-LocalConfig
    } 
    Else {
        New-LocalConfig
    }
}