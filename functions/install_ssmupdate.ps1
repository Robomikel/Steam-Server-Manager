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
    Get-UpdateSteamerConfigDefault
    $getlocalssm = $(Get-ChildItem $currentdir\functions\ -Force) + $(Get-ChildItem $currentdir\ssm.ps1)
    If ($getlocalssm) {
        ForEach ($getlocalssm in $getlocalssm ) {  
            $global:getlocalssmname = $getlocalssm.Name
            If ($getlocalssmname) {
                $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/Steam-Server-Manager/master/functions/$getlocalssmname" -UseBasicParsing
                If ($githubvarcontent) {
                    $githubvarcontent = ($githubvarcontent).Content
                    If ($githubvarcontent) {
                        If (Test-Path $currentdir\tmp) { } Else {
                            New-Item  . -Name 'tmp' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                        }
                        New-Item  "$currentdir\tmp\$getlocalssmname\" -Force >$null 2>&1
                        Add-Content "$currentdir\tmp\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        $githubvarcontenttrim = Get-Content $currentdir\tmp\$getlocalssmname | Where-Object { $_ -notlike "" }
                        If ($githubvarcontenttrim) {
                            $ssmcontentlocaltrim = Get-Content $currentdir\functions\$getlocalssmname | Where-Object { $_ -notlike "" }
                            If ($ssmcontentlocaltrim ) {
                                if (Compare-Object ($githubvarcontenttrim ) ($ssmcontentlocaltrim )) {
                                    Get-Infomessage 'ssmupdates' 'update'
                                    New-Item  "$currentdir\functions\$getlocalssmname" -Force >$null 2>&1
                                    Add-Content "$currentdir\functions\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
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
        Remove-Item "$currentdir\tmp" -Recurse -Force
        Write-Information 'Press Enter to Close this session' -InformationAction Continue
        Pause  
        Stop-Process -Id $PID
    }
}
Function Get-UpdateSteamerCSV {
    $getlocalssm = Get-ChildItem $currentdir\data\ -Force
    If ($getlocalssm) {
        ForEach ($getlocalssm in $getlocalssm ) {  
            $global:getlocalssmname = $getlocalssm.Name
            If ($getlocalssmname) {
                $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/Steam-Server-Manager/master/data/$getlocalssmname" -UseBasicParsing
                If ($githubvarcontent) {
                    $githubvarcontent = ($githubvarcontent).Content
                    If ($githubvarcontent) {
                        If (Test-Path $currentdir\tmp) { } Else {
                            New-Item  . -Name 'tmp' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                        }
                        New-Item  "$currentdir\tmp\$getlocalssmname\" -Force >$null 2>&1
                        Add-Content "$currentdir\tmp\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        $githubvarcontenttrim = Get-Content $currentdir\tmp\$getlocalssmname | Where-Object { $_ -notlike "" }
                        If ($githubvarcontenttrim) {
                            $ssmcontentlocaltrim = Get-Content $currentdir\data\$getlocalssmname | Where-Object { $_ -notlike "" }
                            If ($ssmcontentlocaltrim ) {
                                if (Compare-Object ($githubvarcontenttrim ) ($ssmcontentlocaltrim )) {
                                    Get-Infomessage 'ssmupdates' 'update'
                                    New-Item  "$currentdir\data\$getlocalssmname" -Force >$null 2>&1
                                    Add-Content "$currentdir\data\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
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
        Remove-Item "$currentdir\tmp" -Recurse -Force
    }
}
Function Get-UpdateSteamerConfigDefault {
    $getlocalssm = $((Import-Csv $currentdir\data\serverlist.csv)."Default-Config")
    If ($getlocalssm) {
        ForEach ($getlocalssm in $getlocalssm ) {  
            $global:getlocalssmname = $getlocalssm
            If ($getlocalssmname) {
                $githubvarcontent = Invoke-WebRequest "https://raw.githubusercontent.com/Robomikel/Steam-Server-Manager/master/config-default/$getlocalssmname" -UseBasicParsing
                If ($githubvarcontent) {
                    $githubvarcontent = ($githubvarcontent).Content
                    If ($githubvarcontent) {
                        If (Test-Path $currentdir\tmp) { } Else {
                            New-Item  . -Name 'tmp' -ItemType Directory -InformationAction  SilentlyContinue | Out-File -Append -Encoding Default  $ssmlog
                        }
                        New-Item  "$currentdir\tmp\$getlocalssmname\" -Force >$null 2>&1
                        Add-Content "$currentdir\tmp\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                        $githubvarcontenttrim = Get-Content $currentdir\tmp\$getlocalssmname | Where-Object { $_ -notlike "" }
                        If ($githubvarcontenttrim) {
                            if (Test-Path $currentdir\config-default\$getlocalssmname) {
                                $ssmcontentlocaltrim = Get-Content $currentdir\config-default\$getlocalssmname | Where-Object { $_ -notlike "" }
                                If ($ssmcontentlocaltrim ) { 
                                    if (Compare-Object ($githubvarcontenttrim ) ($ssmcontentlocaltrim )) {
                                        Get-Infomessage 'ssmupdates' 'update'
                                        New-Item  "$currentdir\config-default\$getlocalssmname" -Force >$null 2>&1
                                        Add-Content "$currentdir\config-default\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                                    } 
                                    Else {
                                        Get-Infomessage 'nossmupdates' 
                                    }
                                }

                            }
                            Else {
                                Get-Infomessage 'ssmupdates' 'update'
                                New-Item  "$currentdir\config-default\$getlocalssmname" -Force >$null 2>&1
                                Add-Content "$currentdir\config-default\$getlocalssmname" $githubvarcontent -InformationAction  SilentlyContinue
                            }
                        }
                    }
                }
            }
        }
        Remove-Item "$currentdir\tmp" -Recurse -Force
    }
}