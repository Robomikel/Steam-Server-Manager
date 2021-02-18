#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-UpdateSteamer {
    Get-UpdateSteamerCSV
    # Get-UpdateSteamerConfigDefault
    Get-UpdateSteamerSSM
    $getlocalssm = $(Get-ChildItem $ssmwd\functions\ -Force)
    If ($getlocalssm) {
        ForEach ($getlocalssm in $getlocalssm ) {  
            $global:getlocalssmname = $getlocalssm.Name
            If ($getlocalssmname) {
                $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/Steam-Server-Manager/master/functions/$getlocalssmname" -UseBasicParsing
                If ($githubvarcontent) {
                    $githubvarcontent = ($githubvarcontent).Content
                    If ($githubvarcontent) {
                        If (Test-Path $ssmwd\tmp) { } Else {
                            New-Item $ssmwd -Name 'tmp' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                        }
                        New-Item  "$ssmwd\tmp\$getlocalssmname\" -Force >$null 2>&1
                        Add-Content "$ssmwd\tmp\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        $githubvarcontenttrim = Get-Content $ssmwd\tmp\$getlocalssmname | Where-Object { $_ -notlike "" }
                        If ($githubvarcontenttrim) {
                            $ssmcontentlocaltrim = Get-Content $ssmwd\functions\$getlocalssmname | Where-Object { $_ -notlike "" }
                            If ($ssmcontentlocaltrim ) {
                                if (Compare-Object ($githubvarcontenttrim ) ($ssmcontentlocaltrim )) {
                                    Get-Infomessage 'ssmupdates' 'update'
                                    New-Item  "$ssmwd\functions\$getlocalssmname" -Force >$null 2>&1
                                    Add-Content "$ssmwd\functions\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                                } 
                                Else {
                                    Get-Infomessage 'nossmupdates' 
                                }
                            }
                        }
                    }
                }
            }
        }
        Remove-Item "$ssmwd\tmp" -Recurse -Force
        Write-Information 'Press Enter to Close this session' -InformationAction Continue
        Pause  
        Stop-Process -Id $PID
    }
}
Function Get-UpdateSteamerSSM {
    $getlocalssm = $([pscustomobject]@{ Name = 'ssm.ps1' })
    If ($getlocalssm) {
        ForEach ($getlocalssm in $getlocalssm ) {  
            $global:getlocalssmname = $getlocalssm.Name
            If ($getlocalssmname) {
                $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/Steam-Server-Manager/master/$getlocalssmname" -UseBasicParsing
                If ($githubvarcontent) {
                    $githubvarcontent = ($githubvarcontent).Content
                    If ($githubvarcontent) {
                        If (Test-Path $ssmwd\tmp) { } Else {
                            New-Item $ssmwd -Name 'tmp' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                        }
                        New-Item  "$ssmwd\tmp\$getlocalssmname\" -Force >$null 2>&1
                        Add-Content "$ssmwd\tmp\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        $githubvarcontenttrim = Get-Content $ssmwd\tmp\$getlocalssmname | Where-Object { $_ -notlike "" }
                        If ($githubvarcontenttrim) {
                            $ssmcontentlocaltrim = Get-Content $ssmwd\$getlocalssmname | Where-Object { $_ -notlike "" }
                            If ($ssmcontentlocaltrim ) {
                                if (Compare-Object ($githubvarcontenttrim ) ($ssmcontentlocaltrim )) {
                                    Get-Infomessage 'ssmupdates' 'update'
                                    New-Item  "$ssmwd\$getlocalssmname" -Force >$null 2>&1
                                    Add-Content "$ssmwd\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                                } 
                                Else {
                                    Get-Infomessage 'nossmupdates' 
                                }
                            }
                        }
                    }
                }
            }
        }
        Remove-Item "$ssmwd\tmp" -Recurse -Force
    }
}
Function Get-UpdateSteamerCSV {
    $getlocalssm = Get-ChildItem $ssmwd\data\ -Force
    If ($getlocalssm) {
        ForEach ($getlocalssm in $getlocalssm ) {  
            $global:getlocalssmname = $getlocalssm.Name
            If ($getlocalssmname) {
                $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/Steam-Server-Manager/master/data/$getlocalssmname" -UseBasicParsing
                If ($githubvarcontent) {
                    $githubvarcontent = ($githubvarcontent).Content
                    If ($githubvarcontent) {
                        If (Test-Path $ssmwd\tmp) { } Else {
                            New-Item $ssmwd -Name 'tmp' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                        }
                        New-Item  "$ssmwd\tmp\$getlocalssmname\" -Force >$null 2>&1
                        Add-Content "$ssmwd\tmp\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        $githubvarcontenttrim = Get-Content $ssmwd\tmp\$getlocalssmname | Where-Object { $_ -notlike "" }
                        If ($githubvarcontenttrim) {
                            $ssmcontentlocaltrim = Get-Content $ssmwd\data\$getlocalssmname | Where-Object { $_ -notlike "" }
                            If ($ssmcontentlocaltrim ) {
                                if (Compare-Object ($githubvarcontenttrim ) ($ssmcontentlocaltrim )) {
                                    Get-Infomessage 'ssmupdates' 'update'
                                    New-Item  "$ssmwd\data\$getlocalssmname" -Force >$null 2>&1
                                    Add-Content "$ssmwd\data\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                                } 
                                Else {
                                    Get-Infomessage 'nossmupdates' 
                                }
                            }
                        }
                    }
                }
            }
        }
        Remove-Item "$ssmwd\tmp" -Recurse -Force
    }
}
Function Get-UpdateSteamerConfigDefault {
    # $getlocalssm = $((Import-Csv $ssmwd\data\serverlist.csv)."Default-Config")
    $getlocalssmname = gci $ssmwd\config-default\
    If ($getlocalssmname) {
        ForEach ($getlocalssmname in $getlocalssmname ) {  
            If ($getlocalssmname) {
                $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/config-default/master/$getlocalssmname" -UseBasicParsing
                If ($githubvarcontent) {
                    $githubvarcontent = ($githubvarcontent).Content
                    If ($githubvarcontent) {
                        If (Test-Path $ssmwd\tmp) { } Else {
                            New-Item $ssmwd -Name 'tmp' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                        }
                        New-Item  "$ssmwd\tmp\$getlocalssmname\" -Force >$null 2>&1
                        Add-Content "$ssmwd\tmp\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        $githubvarcontenttrim = Get-Content $ssmwd\tmp\$getlocalssmname | Where-Object { $_ -notlike "" }
                        If ($githubvarcontenttrim) {
                            if (Test-Path $ssmwd\config-default\$getlocalssmname) {
                                $ssmcontentlocaltrim = Get-Content $ssmwd\config-default\$getlocalssmname | Where-Object { $_ -notlike "" }
                                If ($ssmcontentlocaltrim ) { 
                                    if (Compare-Object ($githubvarcontenttrim ) ($ssmcontentlocaltrim )) {
                                        Get-Infomessage 'ssmupdates' 'update'
                                        New-Item  "$ssmwd\config-default\$getlocalssmname" -Force >$null 2>&1
                                        Add-Content "$ssmwd\config-default\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                                    } 
                                    Else {
                                        Get-Infomessage 'nossmupdates' 
                                    }
                                }

                            }
                            Else {
                                Get-Infomessage 'ssmupdates' 'update'
                                New-Item  "$ssmwd\config-default\$getlocalssmname" -Force >$null 2>&1
                                Add-Content "$ssmwd\config-default\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                            }
                        }
                    }
                }
            }
        }
        Remove-Item "$ssmwd\tmp" -Recurse -Force
    }
}

Function Get-SteamerConfigDefault {
    Write-log "Function: Get-SteamerConfigDefault "
    $getlocalssm = Import-Csv $ssmwd\data\serverlist.csv
    If ($getlocalssm) {
        $global:getlocalssmname = ($getlocalssm | ? AppID -like $AppID).'Default-config'
        write-log "`$getlocalssmname $getlocalssmname"
        If ($getlocalssmname) {
            $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/config-default/master/$getlocalssmname" -UseBasicParsing
            Write-log "Invoke-WebRequest https://raw.githubusercontent.com/Robomikel/config-default/master/$getlocalssmname"
            If ($githubvarcontent) {
                $githubvarcontent = ($githubvarcontent).Content
                If ($githubvarcontent) {
                    If (!(Test-Path $ssmwd\config-default)) {
                        New-Item $ssmwd -Name 'config-default' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                    }
                    If ($getlocalssmname) {
                        If (!(Test-Path $ssmwd\config-default\$getlocalssmname)) {
                            New-Item  "$ssmwd\config-default\$getlocalssmname" -Force >$null 2>&1
                            Add-Content "$ssmwd\config-default\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        }
                        If (!(Test-Path $ssmwd\config-local\$getlocalssmname)) {
                            New-Item  "$ssmwd\config-local\$getlocalssmname\" -Force >$null 2>&1
                            Add-Content "$ssmwd\config-local\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
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