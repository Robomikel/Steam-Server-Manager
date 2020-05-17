#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-CreatedVaribles {
    If (!$serverfiles) {
        Param($serverfiles)
    }
    Add-Content $ssmlog "[$loggingdate] Getting Server Variables"
    If (Test-Path $currentdir\$serverfiles\Variables-$serverfiles.ps1 ) {
        . { 
            Invoke-Expression $currentdir\$serverfiles\Variables-$serverfiles.ps1

        } 
    }
    Else {
        Get-warnmessage "fn_InstallServerFiles"
        
    }
}
Function Get-ClearVariables {
    $var = (Get-Variable * -scope global).Name
    Add-Content $ssmlog "[$loggingdate] Removing Variables $var" 
    Remove-Variable * -Scope Global  -ea SilentlyContinue -Force
    # Add-Content $ssmlog "[$loggingdate]  Variables $var"
    
}

Function Get-TestInterger { 
    If ($APPID) {
        If ( $APPID -notmatch '^[0-9]+$') { 
            Get-warnmessage "invalidnumbers"
            
        }
    }
}
Function Get-TestString {
    If ($serverfiles) {
        If ( $serverfiles -notmatch "[a-z,A-Z]") { 
            Get-warnmessage "invalidCharacters"
            
        }
    }
}




Function Set-Console {
    If ( $logo -eq "off") { }Else {
        Clear-Host
        $host.ui.RawUi.WindowTitle = "...::: Steam-Server-Manager :::..."
        [console]::ForegroundColor = "Green"
        [console]::BackgroundColor = "Black"
        # [console]::WindowWidth = 150; [console]::WindowHeight = 125; [console]::BufferWidth = [console]::WindowWidth
        #$host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(200,5000)
        If ($admincheckmessage -eq "on") {
            Get-AdminCheck
            Get-Logo
        }
        Else {
            Get-Logo
        }
    }
}
Function Get-Logo {
    Write-Host " 
    _________ __                          _________              _____                 
    /   _____//  |_  ____ _____    _____  /   _____/_________  __/     \    ___________ 
    \_____  \\   __\/ __ \\__  \  /     \ \_____  \\_  __ \  \/ /  \ /  \  / ___\_  __ \
    /        \|  | \  ___/ / __ \|  Y Y  \/        \|  | \/\   /    Y    \/ /_/  >  | \/
   /_______  /|__|  \___  >____  /__|_|  /_______  /|__|    \_/\____|__  /\___  /|__|   
           \/           \/     \/      \/        \/                    \//_____/                           
" -F C
}
Function Set-Steamer {
    If (!$command) {
        Select-Steamer 
    }
    else {
        Select-Steamer $command $serverfiles
    }
}
Function Set-VariablesPS {
    Get-Infomessage "creating"
    New-Item $serverdir\Variables-$serverfiles.ps1 -Force
}

Function Get-Savelocation {
    If ( !$saves ) {
        Add-Content $ssmlog "[$loggingdate] No saves located in App Data" 
    }
    Else {
        # New-AppDataSave
        New-backupAppdata
    }
}
Function Select-RenameSource {
    # Write-Host "***  Renaming srcds.exe to $executable to avoid conflict with local source Engine (srcds.exe) server  ***" -F M -B Black
    Add-Content $ssmlog "[$loggingdate] Renaming srcds.exe to $executable to avoid conflict with local source Engine (srcds.exe) server"
    Rename-Item  "$executabledir\srcds.exe" -NewName "$executabledir\$executable.exe" >$null 2>&1
    Rename-Item  "$executabledir\srcds_x64.exe" -NewName "$executabledir\$executable-x64.exe" >$null 2>&1
}
Function Select-EditSourceCFG {
    If (($servercfgdir) -and ($servercfg )) {
        # Write-Host "***  Editing Default server.cfg  ***" -F M -B Black
        Add-Content $ssmlog "[$loggingdate] Editing Default server.cfg"
        if ($HOSTNAME) {
            ((Get-Content  $servercfgdir\$servercfg -Raw) -replace "\bSERVERNAME\b", "$HOSTNAME") | Set-Content  $servercfgdir\$servercfg
        }
        If ($RCONPASSWORD) {
            ((Get-Content  $servercfgdir\$servercfg -Raw) -replace "\bADMINPASSWORD\b", "$RCONPASSWORD") | Set-Content  $servercfgdir\$servercfg
        }    
    }
}
Function New-ServerLog {
    If ($consolelogging -eq "on") { 
        If ($consolelog  ) {
            Add-Content $ssmlog "[$loggingdate] Found $consolelog"
            $log = (Get-ChildItem $logdirectory -Filter $consolelog | Sort-Object LastWriteTime -Descending | Select-Object -First 1).Name
            Copy-Item  $logdirectory\$log -Destination "$currentdir\log\$serverfiles-$date.log" -Force
            If ($?) {
                If ($pastebinconsolelog -eq "on") { 
                    Out-Pastebin  -InputObject $(Get-Content "$logdirectory\$log") -PasteTitle "$serverfiles" -ExpiresIn 10M -Visibility Unlisted
                    Add-Content $ssmlog "[$loggingdate] Sent Pastebin"
                }
                if ($log) {
                    Rename-Item -Path $logdirectory\$log -NewName ("Backup" + " - " + $date + " - " + $log) -Force -ea SilentlyContinue
                }
                If (!$?) {
                    Add-Content $ssmlog "[$loggingdate] Rename-Item Failed"
                }
            }
        }
    }
    Remove-SteamerLogs
    Remove-ServerconsoleLogs
    Remove-backupLogs
}
Function Remove-backupLogs {
    Add-Content $ssmlog "[$loggingdate] Removing logs over $consolelogcount backup_$serverfiles-*.log"
    If (Test-Path $logdir\backup_$serverfiles-*.log) {
        Get-Childitem $logdir\$serverfiles-*.log -Recurse | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
    }
}
Function Remove-ServerconsoleLogs {
    Add-Content $ssmlog "[$loggingdate] Removing logs over $consolelogcount $serverfiles-*.log"
    If (Test-Path $logdir\$serverfiles-*.log) {
        Get-Childitem $logdir\$serverfiles-*.log -Recurse | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
    }
}
Function Remove-SteamerLogs {
    Add-Content $ssmlog "[$loggingdate] Removing logs over $consolelogcount $ssmlogdir\ssm-*.log"
    If (Test-Path $ssmlogdir\*.log) {
        Get-Childitem $ssmlogdir -Recurse | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
    }
}
Function Send-Paste_OLD {
    If ($serverfiles) {
        If (Test-Path $currentdir\log\$serverfiles-*.log) {
            Set-Location $logdir
            $paste = Get-Childitem $logdir -Filter $serverfiles-*.log | Sort-Object LastWriteTime -Descending | Select-Object -First 1
            Out-Pastebin  -InputObject $(Get-Content "$paste") -PasteTitle "$serverfiles" -ExpiresIn 10M -Visibility Unlisted
            Set-Location $currentdir
        }

    }
}
Function New-ServerBackupLog {
    If ($backuplogs -eq "on") { Copy-Item "$sevenzipdirectory\[b]*.log", -Destination "$logdir\backup_$serverfiles-$date.log" -ea SilentlyContinue }
    Get-Childitem $logdir -Recurse | where-object name -like backup_$serverfiles-*.log | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
}

Function Get-Appid {
    If ($serverfiles) {
        $global:AppID = Get-Content -path $serverlistdir\serverlist.csv | Select-String  -Pattern "\b$serverfiles\b"
        If ($Appid) {
            $global:appid = $appid.Line.Split(",")[3]
            # $global:appid = Import-Csv $currentdir\data\serverlist.csv | where-object appid -like $appid  | Select-Object -ExpandProperty AppID
            $game = Import-Csv $currentdir\data\serverlist.csv | where-object appid -like $appid | Select-Object -ExpandProperty Game
        }
        ElseIf (!$AppID) {
            Write-Host 'Input Steam Server App ID: ' -F C -N 
            $global:AppID = Read-host
            Write-Host 'Add Argument?, -beta... or leave Blank for none: ' -F C -N 
            $global:Branch = Read-host  
            Get-TestInterger
        }
        If ($AppID -eq 985050 -or $AppID -eq 233780) {
            Write-Host "****   Requires Steam Login    *****" -F Y
            Add-Content $ssmlog "[$loggingdate] Requires Steam Login"
        }
        Else {
            Write-Host "        App Name: $game" -F Y 
            Write-Host "        App ID: $AppID" -F Y
        }        
    }
}

Function Get-MCBRWebrequest {
    # get latest download
    $global:mcbrWebResponse = ((Invoke-WebRequest "https://www.minecraft.net/en-us/download/server/bedrock/" -UseBasicParsing).Links | Where-Object { $_.href -like "https://minecraft.azureedge.net/bin-win/*" })
    If (!$? -or !$mcbrWebResponse) {
        Add-Content $ssmlog "[$loggingdate] Failed: Get-MCBRWebrequest"
        Exit
    }
}
Function Get-MCWebrequest {
    # check latest version
    $mcvWebResponse = Invoke-WebRequest "https://launchermeta.mojang.com/mc/game/version_manifest.json" -UseBasicParsing | ConvertFrom-Json
    $global:mcvWebResponse = $mcvWebResponse.Latest.release
    If (!$? -or !$mcvWebResponse) {
        Add-Content $ssmlog "[$loggingdate] Failed: Get-MCWebrequest"
        Exit
    }
}
Function Get-SourceMetaModWebrequest {
    # $mmWebResponse = Invoke-WebRequest "https://mms.alliedmods.net/mmsdrop/$metamodmversion/mmsource-latest-windows" -UseBasicParsing -ea SilentlyContinue
    # $mmWebResponse = $mmWebResponse.content
    # $global:metamodurl = "https://mms.alliedmods.net/mmsdrop/$metamodmversion/$mmWebResponse"
    $metamoddownloadurl = "https://www.metamodsource.net/latest.php?os=windows&version=${metamodmversion}"
    $global:metamodurl = "${metamoddownloadurl}"
    
    # $smWebResponse = Invoke-WebRequest "https://sm.alliedmods.net/smdrop/$sourcemodmversion/sourcemod-latest-windows" -UseBasicParsing -ErrorAction SilentlyContinue
    # $smWebResponse = $smWebResponse.content
    # $global:sourcemodurl = "https://sm.alliedmods.net/smdrop/$sourcemodmversion/$smWebResponse"
    $sourcemoddownloadurl="https://www.sourcemod.net/latest.php?os=windows&version=${sourcemodmversion}"
    $global:sourcemodurl="${sourcemoddownloadurl}"

    If (!$metamodurl -or !$sourcemodurl) {
        Add-Content $ssmlog "[$loggingdate] Failed: Get-SourceMetaModWebrequest"
        Exit
    }
}

Function Get-PreviousInstall {
    If (Test-Path $serverdir\Variables-*.ps1) {
        $check = (Get-Childitem $serverdir | Where-Object { $_.Name -like 'Variables-*' } -ea SilentlyContinue)
        If ($check) {
            Get-createdvaribles
            If ( $process ) {
                Get-StopServerInstall
                # Get-ClearVariables
            }
        }
    }
}

function Receive-Information {
    process { Write-Host $_ -ForegroundColor Yellow -NoNewline }
}
function Receive-Message {
    process { Write-Host $_ -ForegroundColor $textcolor -NoNewline }
}
Function compare-SteamExit {
    If ($ssmlog -and $loggingdate) {
        If ($appinstalllog) {
            If ($appinstalllog -Like "Steam Guard code:FAILED*") {
                Write-Host "****   Failed Logon Requires set_steam_guard_code ****" -F R
                Set-Location $steamdirectory
                .\steamCMD +login $username $password +force_install_dir $serverdir +app_update $APPID $Branch +Exit
                New-TryagainSteam
            }
            ElseIf ($appinstalllog -Like "*Invalid Password*") {
                Write-Host "****   Failed Password   ****" -F R
                Add-Content $ssmlog "[$loggingdate] Failed Password"
                New-TryagainNew 
            }
            ElseIf ($appinstalllog -Like "*No subscription*") {
                Write-Host "****  No subscription, Requires steamcmd login   ****" -F R
                Add-Content $ssmlog "[$loggingdate] No subscription, Requires steamcmd login"
                New-TryagainNew 
            }
            ElseIf ($appinstalllog -Like "*Success*") {
                Write-Host "****   Downloading  server succeeded   ****" -F Y
                Add-Content $ssmlog "[$loggingdate] Downloading  server succeeded"
            }   
            ElseIf (($appinstalllog -Like "* Failed *") -or ($appinstalllog -Like "*FAILED*")) {
                Write-Host "****   Downloading  server Failed   ****" -F R
                Add-Content $ssmlog "[$loggingdate] Downloading  server Failed"
                New-TryagainNew 
            }
            Else {
                New-TryagainSteam
            }
        }
    }
}