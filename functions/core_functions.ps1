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
    Write-log "Function: Get-CreatedVaribles"
    If (Test-Path $currentdir\$serverfiles\Variables-$serverfiles.ps1 ) {
        . { 
            Invoke-Expression $currentdir\$serverfiles\Variables-$serverfiles.ps1

        } 
    }
    Else {
        Get-warnmessage "fn_InstallServerFiles"
    }
}
Function Get-help {
    Write-Host "Format:  ./ssm <Command> <serverFolderName>" -F Yellow -BackgroundColor Black
    Write-Host "IE:      ./ssm install  insserver" -F Yellow -BackgroundColor Black
    Write-Host "Command not found! Available Commands" -F Red -BackgroundColor Black
    Write-Host "install"
    Write-Host "update"
    Write-Host "force-update"
    Write-Host "validate"
    Write-Host "start"
    Write-Host "stop"
    Write-Host "restart"
    Write-Host "backup"
    Write-Host "exit"
    Write-Host "query"
    Write-Host "monitor"
    Write-Host "install-monitor"
    Write-Host "install-mod - SourceMod and Oxide Install"
    Write-Host "install-ws  - WorkShop Install"
    Write-Host "mcrcon"
    Write-Host "install-Restart"
    Write-Host "discord"
    Write-Host "details"
    Write-Host "ssm update"
    break
}
Function Get-ClearVariables {
    Write-log "Function: Get-ClearVariables"
    $var = (Get-Variable * -scope global).Name
    Write-log "Removing Variables $var" 
    Remove-Variable * -Scope Global  -ea SilentlyContinue -Force
    # Write-log " Variables $var"
    
}
Function Get-TestInterger {
    Write-log "Function: Get-TestInterger" 
    If ($APPID) {
        If ( $APPID -notmatch '^[0-9]+$') { 
            Get-warnmessage "invalidnumbers"
            
        }
    }
}
Function Get-TestString {
    Write-log "Function: Get-TestString"
    If ($serverfiles) {
        If ( $serverfiles -notmatch "[a-z,A-Z]") { 
            Get-warnmessage "invalidCharacters"  
        }
    } 
    Elseif (!$serverfiles) {
        Get-warnmessage "invalidCharacters"
    }
}
Function Set-Console {
    Write-log "Function: Set-Console"
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
    Write-log "Function: Get-Logo"
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
    Write-log "Function: Set-Steamer"
    If (!$command) {
        Select-Steamer 
    }
    else {
        Select-Steamer $command $serverfiles
    }
}
Function Set-VariablesPS {
    Write-log "Function: Set-VariablesPS"
    Get-Infomessage "creating" 'info'
    New-Item $currentdir\$serverfiles\Variables-$serverfiles.ps1 -Force
}

Function Get-Savelocation {
    Write-log "Function: Get-Savelocation"
    If ( !$saves ) {
        Write-log "No saves located in App Data" 
    }
    Else {
        If ($command -eq "restore") {
            Get-AppdataBackupMenu
        }
        Else {
            # New-AppDataSave
            New-backupAppdata
        }
    }
}
Function Select-RenameSource {
    Write-log "Function: Select-RenameSource"
    # Write-Host "***  Renaming srcds.exe to $executable to avoid conflict with local source Engine (srcds.exe) server  ***" -F M -B Black
    Write-log "Renaming srcds.exe to $executable to avoid conflict with local source Engine (srcds.exe) server"
    Rename-Item  "$executabledir\srcds.exe" -NewName "$executabledir\$executable.exe" >$null 2>&1
    Rename-Item  "$executabledir\srcds_x64.exe" -NewName "$executabledir\$executable-x64.exe" >$null 2>&1
}
Function Select-EditSourceCFG {
    Write-log "Function: Select-EditSourceCFG"
    If (($servercfgdir) -and ($servercfg )) {
        # Write-Host "***  Editing Default server.cfg  ***" -F M -B Black
        Write-log "Editing Default server.cfg"
        if ($HOSTNAME) {
            ((Get-Content  $servercfgdir\$servercfg -Raw) -replace "\bSERVERNAME\b", "$HOSTNAME") | Set-Content  $servercfgdir\$servercfg
        }
        If ($RCONPASSWORD) {
            ((Get-Content  $servercfgdir\$servercfg -Raw) -replace "\bADMINPASSWORD\b", "$RCONPASSWORD") | Set-Content  $servercfgdir\$servercfg
        }    
    }
}
Function Select-EditSourceCFG_OLD {
    Write-log "Function: Select-EditSourceCFG"
    If (($servercfgdir) -and ($servercfg )) {
        # Write-Host "***  Editing Default server.cfg  ***" -F M -B Black
        Write-log "Editing Default server.cfg"
        #  -and ($appid -ne 17505) -and ($appid -ne 232250) -and ($appid -ne 276060) -and ($appid -ne 222860) -and ($appid -ne 317670) -and ($appid -ne 232370) -and ($appid -ne 985050) -and ($appid -ne 346680) -and ($appid -ne 228780) -and ($appid -ne 475370) -and ($appid -ne 383410) -and ($appid -ne 238430) -and ($appid -ne 740) -and ($appid -ne 232290) -and ($appid -ne 17585) -and ($appid -ne 295230) -and ($appid -ne 4020)
        $servercfgcomment = @(237410, 462310 )
        If ($servercfgcomment -contains $appid) {
            if ($HOSTNAME) {
                ((Get-Content  $servercfgdir\$servercfg -Raw) -replace "\bSERVERNAME\b", "$HOSTNAME") | Set-Content  $servercfgdir\$servercfg
                ((Get-Content  $servercfgdir\$servercfg -Raw) -replace "\bhostname\b", '//hostname') | Set-Content  $servercfgdir\$servercfg            
            } 
        }
        Else {
            ((Get-Content  $servercfgdir\$servercfg -Raw) -replace "\bSERVERNAME\b", "$HOSTNAME") | Set-Content  $servercfgdir\$servercfg
        }
        If ($RCONPASSWORD) {
            ((Get-Content  $servercfgdir\$servercfg -Raw) -replace "\bADMINPASSWORD\b", "$RCONPASSWORD") | Set-Content  $servercfgdir\$servercfg
        }    
    }
}
Function Edit-ServerConfig {
    If (${servercfg}) {
        If (${servercfgdir}) {
            switch ($appid) {
                # '294420' { $line = 5; Set-ServerConfig }
                # '237410' { $line = 10; Set-ServerConfig }
                '407480' { $line = 1205; Set-ServerConfig }
                # '17515' { $line = 9; Set-ServerConfig }
                # '376030' { $line = 97; Set-ServerConfig }
                # '233780' { $line = 16; Set-ServerConfig }
                Default { Set-ServerConfig }
            }
        }
    }
    Write-log "Function: Edit-ServerConfig"
}

Function Set-ServerConfig {
    Write-log "Function: Set-ServerConfig"
    $removelinenumber = @( 407480 )
    $readserverconfig = Get-Content ${servercfgdir}\${servercfg}
    If ( $removelinenumber -contains $appid ) {
        $deleteline = $readserverconfig[$line]
    }
    ElseIf (($readserverconfig | Select-String -SimpleMatch "SessionName")) {
        $deleteline = ($readserverconfig | Select-String -SimpleMatch "SessionName")
    }
    ElseIf (($readserverconfig | Select-String -SimpleMatch "hostname")) {
        $deleteline = ($readserverconfig | Select-String -SimpleMatch "hostname" | Where Line -NotMatch '//'  )
    } 
    ElseIf (($readserverconfig | Select-String -SimpleMatch "ServerName")) {
        $deleteline = ($readserverconfig | Select-String -SimpleMatch "ServerName")
        $deleteline2 = ($readserverconfig | Select-String -SimpleMatch "<property name=`"ServerPort`"")
    }
    If ($deleteline.Count -gt 1 ) {
        Write-log "Failed: Edit ServerConfig Hostname. Multiple Lines"
    }
   Write-log "$deleteline -like `"*hostname*`" -or $deleteline -like `"*SERVERNAME*`" -and $deleteline -notmatch `"$hostname`""
    If ($deleteline -like "*hostname*" -or $deleteline -like "*SERVERNAME*" -or $deleteline -like "*SessionName*" -and $deleteline -notmatch "$hostname"  ) {
       Write-log "$deleteline -like `"*hostname*`" -or $deleteline -like `"*SERVERNAME*`" -and $deleteline -notmatch `"$hostname`""
        switch ($appid) {
            '294420' { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "`t<property name=`"ServerName`"						value=`"$hostname`"`/>" | Set-Content "${servercfgdir}\${servercfg}" }
            '294420' { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline2", "`t<property name=`"ServerPort`"						value=`"$port`"`/>" | Set-Content "${servercfgdir}\${servercfg}";Break }
            { @( '407480', '443030', '232130', '629800', '412680', '1420710' ) -contains $_ } { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "ServerName=$hostname" | Set-Content "${servercfgdir}\${servercfg}";Break }
            { @( '403240', '261020' ) -contains $_ } { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "ServerName=`"$hostname`"" | Set-Content "${servercfgdir}\${servercfg}";Break }
            { @('17515', '237410', '232250', '276060', '346680', '228780', '475370', '383410', '238430', '740', '232290', '462310', '317800', '460040', '17585', '17555', '295230', '4020', '232370', '222860', '332670', '17505', '329710') -contains $_ } { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "hostname `"$hostname`"" | Set-Content "${servercfgdir}\${servercfg}";Break }
            '233780' { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "hostname = `"$hostname`";" | Set-Content "${servercfgdir}\${servercfg}";Break }
            '343050' { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "cluster_name = $hostname" | Set-Content "${servercfgdir}\${servercfg}";Break }
            '376030' { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "SessionName=$hostname" | Set-Content "${servercfgdir}\${servercfg}";Break }
            Default { Write-log "Failed: Edit ServerConfig Hostname" }
        }
    }
    Else {
        Write-log "Failed: Edit ServerConfig Hostname" 
    }
}
Function New-ServerLog {
    Write-log "Function: New-ServerLog"
    If ($consolelogging -eq "on") { 
        If ($consolelog  ) {
            If (Test-Path $logdirectory\$consolelog  ) {
                Write-log "Found $consolelog"
                $log = (Get-ChildItem $logdirectory -Filter $consolelog | Sort-Object LastWriteTime -Descending | Select-Object -First 1).Name
                Copy-Item  $logdirectory\$log -Destination "$currentdir\log\$serverfiles-$date.log" -Force
                If ($?) {
                    If ($pastebinconsolelog -eq "on") { 
                        Out-Pastebin  -InputObject $(Get-Content "$logdirectory\$log") -PasteTitle "$serverfiles" -ExpiresIn $pastebinexpires -Visibility Unlisted
                        Write-log "Sent Pastebin"
                    }
                    if ($log) {
                        Rename-Item -Path $logdirectory\$log -NewName ("Backup" + " - " + $date + " - " + $log) -Force -ea SilentlyContinue
                    }
                    If (!$?) {
                        Write-log "Rename-Item Failed"
                    }
                }
            }
        }
    }
    Remove-SteamerLogs
    Remove-ServerconsoleLogs
    Remove-backupLogs
}
Function Remove-backupLogs {
    Write-log "Function: Remove-backupLogs"
    Write-log "Removing logs over $consolelogcount backup_$serverfiles-*.log"
    If (Test-Path $logdir\backup_$serverfiles-*.log) {
        Get-Childitem $logdir\$serverfiles-*.log -Recurse | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
    }
}
Function Remove-ServerconsoleLogs {
    Write-log "Function: Remove-ServerconsoleLogs"
    Write-log "Removing logs over $consolelogcount $serverfiles-*.log"
    If (Test-Path $logdir\$serverfiles-*.log) {
        Get-Childitem $logdir\$serverfiles-*.log -Recurse | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
    }
}
Function Remove-SteamerLogs {
    Write-log "Function: Remove-SteamerLogs"
    Write-log "Removing logs over $consolelogcount $ssmlogdir\ssm-*.log"
    If (Test-Path $ssmlogdir\*.log) {
        Get-Childitem $ssmlogdir -Recurse | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
    }
}
Function Send-Paste_OLD {
    Write-log "Function: "
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
    Write-log "Function: New-ServerBackupLog"
    If ($backuplogs -eq "on") { Copy-Item "$sevenzipdirectory\[b]*.log", -Destination "$logdir\backup_$serverfiles-$date.log" -ea SilentlyContinue }
    Get-Childitem $logdir -Recurse | where-object name -like backup_$serverfiles-*.log | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
}
Function Get-Appid {
    Write-log "Function: Get-Appid"
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
            Get-Infomessage "****   Requires Steam Login    *****"'warning'
            Write-log "Requires Steam Login"
        }
        Else {
            Write-Host "        App Name: $game" -F Y 
            Write-Host "        App ID: $AppID" -F Y
        }        
    }
}
Function Get-MCBRWebrequest {
    Write-log "Function: Get-MCBRWebrequest"
    # get latest download
    $global:mcbrWebResponse = ((Invoke-WebRequest "https://www.minecraft.net/en-us/download/server/bedrock/" -UseBasicParsing).Links | Where-Object { $_.href -like "https://minecraft.azureedge.net/bin-win/*" })
    If (!$? -or !$mcbrWebResponse) {
        Write-log "Failed: Get-MCBRWebrequest"
        Exit
    }
}
Function Get-MCWebrequest {
    Write-log "Function: Get-MCWebrequest"
    # check latest version
    $mcvWebResponse = Invoke-WebRequest "https://launchermeta.mojang.com/mc/game/version_manifest.json" -UseBasicParsing | ConvertFrom-Json
    $global:mcvWebResponse = $mcvWebResponse.Latest.release
    If (!$? -or !$mcvWebResponse) {
        Write-log "Failed: Get-MCWebrequest"
        Exit
    }
}
Function Get-SourceMetaModWebrequest {
    Write-log "Function: Get-SourceMetaModWebrequest"
    # $mmWebResponse = Invoke-WebRequest "https://mms.alliedmods.net/mmsdrop/$metamodmversion/mmsource-latest-windows" -UseBasicParsing -ea SilentlyContinue
    # $mmWebResponse = $mmWebResponse.content
    # $global:metamodurl = "https://mms.alliedmods.net/mmsdrop/$metamodmversion/$mmWebResponse"
    $metamoddownloadurl = "https://www.metamodsource.net/latest.php?os=windows&version=${metamodmversion}"
    $global:metamodurl = "${metamoddownloadurl}"
    # $smWebResponse = Invoke-WebRequest "https://sm.alliedmods.net/smdrop/$sourcemodmversion/sourcemod-latest-windows" -UseBasicParsing -ErrorAction SilentlyContinue
    # $smWebResponse = $smWebResponse.content
    # $global:sourcemodurl = "https://sm.alliedmods.net/smdrop/$sourcemodmversion/$smWebResponse"
    $sourcemoddownloadurl = "https://www.sourcemod.net/latest.php?os=windows&version=${sourcemodmversion}"
    $global:sourcemodurl = "${sourcemoddownloadurl}"
    If (!$metamodurl -or !$sourcemodurl) {
        Write-log "Failed: Get-SourceMetaModWebrequest"
        Exit
    }
}
Function Get-PreviousInstall {
    Write-log "Function: Get-PreviousInstall"
    If (Test-Path $currentdir\$serverfiles\Variables-*.ps1) {
        $check = (Get-Childitem $currentdir\$serverfiles | Where-Object { $_.Name -like 'Variables-*' } -ea SilentlyContinue)
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
    process { 
        If ($package -eq $true ) {
            Write-Host $_ -ForegroundColor Green -NoNewline 
        } 
        ElseIf ($package -eq $false ) {
            Write-Host $_ -ForegroundColor Red -NoNewline 
        } 
        ElseIf ($package -eq 'update' ) {
            Write-Host $_ -ForegroundColor Cyan -NoNewline 
        }
        ElseIf ($package -eq 'warning' ) {
            Write-Host $_ -ForegroundColor Magenta -NoNewline 
        }
        ElseIf ($package -eq 'info' ) {
            Write-Host $_ -ForegroundColor Yellow -NoNewline 
        } 
        ElseIf ($package -eq 'start' ) {
            Write-Host $_ -ForegroundColor Yellow -NoNewline 
        }
        ElseIf ($package -eq 'done' ) {
            Write-Host $_ -ForegroundColor Green -NoNewline 
        }
        Else {
            Write-Host $_ -ForegroundColor Green -NoNewline 
        }   
    }
}
function Receive-bracket {
    process { Write-Host $_ -ForegroundColor White -NoNewline }
}
function Receive-Message {
    process { Write-Host $_ -ForegroundColor $textcolor -NoNewline }
}
Function compare-SteamExit {
    Write-log "Function: compare-SteamExit"
    If ($ssmlog -and $loggingdate) {
        If ($appinstalllog) {
            If ($appinstalllog -Like "Steam Guard code:FAILED*") {
                Get-Infomessage "****   Failed Logon Requires set_steam_guard_code ****" $false
                Set-Location $steamdirectory
                .\steamCMD +login $username $password +force_install_dir $currentdir\$serverfiles +app_update $APPID $Branch +Exit
                New-TryagainSteam
            }
            ElseIf ($appinstalllog -Like "*Invalid Password*") {
                Get-Infomessage "****   Failed Password   ****" $false
                Write-log "Failed Password"
                New-TryagainNew 
            }
            ElseIf ($appinstalllog -Like "*No subscription*") {
                Get-Infomessage "****  No subscription, Requires steamcmd login   ****" $false
                Write-log "No subscription, Requires steamcmd login"
                New-TryagainNew 
            }
            ElseIf ($appinstalllog -Like "*Success*") {
                Get-Infomessage "****   Downloading  server succeeded   ****" 
                Write-log "Downloading  server succeeded"
            }   
            ElseIf (($appinstalllog -Like "* Failed *") -or ($appinstalllog -Like "*FAILED*")) {
                Get-Infomessage "****   Downloading  server Failed   ****" $false
                Write-log "Downloading  server Failed"
                New-TryagainNew 
            }
            Else {
                New-TryagainSteam
            }
        }
    }
}
Function Test-PSversion {
    $global:psSeven = ( $PSVersionTable.PSVersion.Major -eq 7 ) 
    If ($psSeven -eq $true ) {
        $psSeven = 1
    }
    Else {
        $psSeven = $null
    }
}
Function Set-SteamerSettingLog {
    Write-log "Function: Set-SteamerSettingLog"
    Write-log "Setting: Show Backup Console = $Showbackupconsole "
    Write-log "Setting: backup log open = $backuplogopen"
    Write-log "Setting: backup logs  = $backuplogs "
    Write-log "Setting: app data backup log open = $appdatabackuplogopen"
    Write-log "Setting: Appdata backup = $appdatabackup "
    Write-log "Setting: max backups  = $maxbackups "
    Write-log "Setting: Stop On Backup = $stoponbackup "
    Write-log "Setting: logo = $logo "
    Write-log "Setting: Admin message = $admincheckmessage  "
    Write-log "Setting: Update on start = $updateonstart "
    Write-log "Setting: Check Update on start = $checkupdateonstart"
    Write-log "Setting: Stop on Update on start = $stoponupdateonstart"
    Write-log "Setting: check scheduled Task = $Checktask  "
    Write-log "Setting: Discord Alert = $DiscordAlert  "
    Write-log "Setting: Discord backup Alert = $DiscordBackupAlert "
    Write-log "Setting: Discord Update Alert  = $DiscordUpdateAlert "
    Write-log "Setting: Discord Restart Alert  = $DiscordRestartAlert"
    Write-log "Setting: Use private IP for Query and mcrcon  = $Useprivate  "
    Write-log "Setting: consolelogging   = $consolelogging "
    Write-log "Setting: consolelogging count  = $consolelogcount "
    Write-log "Setting: ssmlogging  = $ssmlogging   "
    Write-log "Setting: ssmlogging count   = $ssmlogcount   "
    Write-log "Setting: Console Text Color   = $textcolor  "
    Write-log "Setting: Version  = $Version  "
    Write-log "Setting: Server List Directory   = $serverlistdir"
    Write-log "Setting: Backup Directory  = $backupdir"
    write-log "Setting: ssm log Directory   = $ssmlogdir"
    Write-log "Setting: log Directory  = $logdir"
    Write-log "Setting: SSM Log  = $ssmlog"
    Write-log "Setting: MC Version   = $mcversion"
    Write-log "Setting: Steam Master    = $steammastercheck "
    Write-log "Setting: Pastebin  = $pastebinconsolelog"
    Write-log "Setting: Discord Webhook    = $discordwebhook  "
    Write-log "Setting: Discord Display IP  = $discorddisplayip  "
}
Function Test-VariablesNull {
    Write-Log "Function: Get-VariablesNull"
    If ( $testvariable -eq "on" ) {
        Get-Variable | Where-Object Value -Like $null | ForEach-Object { if ($_.Name -notlike "ConsoleFileName" -and $_.Name -notlike "null" -and $_.Name -notlike "PSCommandPath" -and $_.Name -notlike "PSEmailServer" -and $_.Name -notlike "PSScriptRoot" -and $_.Name -notlike "discorddisplayip" -and $_.Name -notlike "discordwebhook" -and $_.Name -notlike "PastebinDeveloperKey" -and $_.Name -notlike "PastebinPassword" -and $_.Name -notlike "PastebinUsername" -and $_.Name -notlike "steamcmdparmas" -and $_.Name -notlike "`$" -and $_.Name -notlike "`^" -and $_.Name -notlike "StackTrace" -and $_.Name -notlike "option3" -and $_.Name -notlike "option2") { 
                $name = $_.Name ; Write-log "WARNING: $name is empty variable"
            }
        }
    }
}
Function Get-CustomSettings {
    Write-Log "Function Get-CustomSettings"
    New-LocalFolder
    If (Test-Path "$currentdir\$configlocal\local_settings.ps1") {
        .$currentdir\$configlocal\local_settings.ps1
        Import-CustomSetting
    } 
    Else {
        Set-Customsettings
        .$currentdir\$configlocal\local_settings.ps1
        Import-CustomSetting
    }
}
Function Set-Customsettings {
    Write-Log "Function Set-Customsettings"
    New-Item "$currentdir\$configlocal\local_settings.ps1" -Force | Out-File -Append -Encoding Default  $ssmlog
    Add-Content "$currentdir\$configlocal\local_settings.ps1" `
        "Function Import-CustomSetting {
    Write-log `"Function: Import-CustomSetting`"
    #                               ####  Steamer Settings #######
    #                               Show Backup Console
    `$global:Showbackupconsole       = `"$Showbackupconsole`"
    #                               backup log open
    `$global:backuplogopen           = `"$backuplogopen`"
    #                               backup logs
    `$global:backuplogs              = `"$backuplogs`"
    #                               app data backup log open 
    `$global:appdatabackuplogopen    = `"$appdatabackuplogopen`"
    #                               Appdata backup 
    `$global:appdatabackup           = `"$appdatabackup`"
    #                               max backups  
    `$global:maxbackups              = `"$maxbackups`"
    #                               Stop On Backup
    `$global:stoponbackup            = `"$stoponbackup`"
    #                               logo 
    `$global:logo                    = `"$logo`"
    #                               Admin message
    `$global:admincheckmessage       = `"$admincheckmessage`"
    #                               Update on start
    `$global:updateonstart           = `"$updateonstart`"
    #                               Stop on Update on start 
    `$global:stoponupdateonstart     = `"$stoponupdateonstart`"
    #                               Check Update on start
    `$global:checkupdateonstart      = `"$checkupdateonstart`"
    #                               check scheduled Task
    `$global:Checktask               = `"$Checktask`"
    #                               Discord Alert
    `$global:DiscordAlert            = `"$DiscordAlert`"
    #                               Discord backup Alert
    `$global:DiscordBackupAlert      = `"$DiscordBackupAlert`"
    #                               Discord Update Alert 
    `$global:DiscordUpdateAlert      = `"$DiscordUpdateAlert`"
    #                               Discord Restart Alert 
    `$global:DiscordRestartAlert     = `"$DiscordRestartAlert`"
    #                               Use private IP for Query and mcrcon
    `$global:Useprivate              = `"$Useprivate`"
    #                               consolelogging
    `$global:consolelogging          = `"$consolelogging`"
    #                               consolelogging count 
    `$global:consolelogcount         = `"$consolelogcount`"
    #                               ssmlogging
    `$global:ssmlogging              = `"$ssmlogging`"
    #                               ssmlogging count 
    `$global:ssmlogcount             = `"$ssmlogcount`"
    #                               Console Text Color 
    `$global:textcolor               = `"$textcolor`" # DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
    #                               Version  0 prompt for input, 1 no prompt during install
    `$global:Version                 = `"$Version`"
    #                               Server List Directory
    `$global:serverlistdir           = `"$serverlistdir`"
    #                               Backup Directory
    `$global:backupdir               = `"$backupdir`"
    #                               ssm log Directory
    `$global:ssmlogdir               = `"$ssmlogdir`"
    #                               log Directory
    `$global:logdir                  = `"$logdir`"
    #                               Empty Variable checking
    `$global:testvariable            = `"$testvariable`"
    #                               MC Version
    `$global:mcversion               = `"$mcversion`"
    #                               Test Connection to Steam Master
    `$global:steammastercheck        = `"$steammastercheck`"
    #                               Server Console log to Pastebin
    `$global:pastebinconsolelog      = `"$pastebinconsolelog`"
    #                               Pastebin Time -  Never: N, 10 Minutes: 10M, 1 Hour: 1H, 1 Day: 1D, 1 Week: 1W, 2 Weeks: 2W, 1 Month: 1M
    `$global:pastebinexpires         = `"$pastebinexpires`"
    #                               Pastebin username
    `$global:PastebinUsername        = `"$PastebinUsername`"
    #                               Pastebin pwd
    `$global:PastebinPassword        = `"$PastebinPassword`"
    #                               Pastebin Dev Key
    `$global:PastebinDeveloperKey    = `'$PastebinDeveloperKey`'
    #                               Discord Webhook 
    `$global:discordwebhook          = `"$discordwebhook`"
    #                               Discord Display IP and Steam API IP.
    `$global:discorddisplayip        = `"$discorddisplayip`"
    Set-SteamerSettingLog
}"
}

Function Import-localConfig {
    Write-log "Function: Import-localConfig"
    If ($getlocalssmname) {
        If ((Test-Path $currentdir\config-local\$getlocalssmname)) {
            Write-log "Import:  .$currentdir\config-local\$getlocalssmname"
            .$currentdir\config-local\$getlocalssmname
            Set-LaunchScript
        }
        ElseIf (Test-Path $currentdir\config-default\$getlocalssmname) {
            Write-log "Import: .$currentdir\config-default\$getlocalssmname"
            .$currentdir\config-default\$getlocalssmname
            Set-LaunchScript
        }
        Else {
            Write-log "ERROR: No Config found to Import" ; Break
        }
    } 
    Else {
        Write-log "Failed: Import-localConfig"
    }
}
Function Measure-stats {
    $startTime = get-date
    $endTime = $startTime.addMinutes(1.0)
    $timeSpan = new-timespan $startTime $endTime
    $cpulast2min = @()
    #   $cpucookedlast2min = @()
    $memorylast2min = @()
    #  $NetaverageBandwidth = @()

    while ($timeSpan -gt 0) {
       #   $gamecpucooked = [math]::Truncate(((Get-Counter '\Process(*)\% Processor Time' -ea SilentlyContinue).CounterSamples | Where-Object InstanceName -like $process).CookedValue)
      
      if ($psSeven -eq $true ) {
            $window32processor = Get-CimInstance Win32_processor
            $windows32 = Get-CimInstance Win32_OperatingSystem
       #      $colInterfaces = Get-CimInstance -class Win32_PerfFormattedData_Tcpip_NetworkInterface | select BytesTotalPersec, CurrentBandwidth, PacketsPersec | where { $_.PacketsPersec -gt 0 }
        }
        Else {
            $window32processor = Get-WmiObject Win32_processor
            $windows32 = Get-WmiObject Win32_OperatingSystem
       #      $colInterfaces = Get-WmiObject -class Win32_PerfFormattedData_Tcpip_NetworkInterface | select BytesTotalPersec, CurrentBandwidth, PacketsPersec | where { $_.PacketsPersec -gt 0 }
       # }
       #  foreach ($interface in $colInterfaces) {
       #     $bitsPerSec = $interface.BytesTotalPersec * 8
       #     $totalBits = $interface.CurrentBandwidth / 10
       #     # Exclude Nulls (any WMI failures)
       #     if ($totalBits -gt 0) {
       #         $result = (( $bitsPerSec / $totalBits) * 100)
       #         $totalBandwidth = $totalBandwidth + $result
       #         $count++
       #     }
         }
        cls
        [console]::CursorVisible=$false
        Get-Logo
        $bar++
        $bar | % { if ($_ % 2 -eq 0 ) { Write-Host "Fetch stats 1Min...[-]       " } }
        $bar | % { if ($_ % 2 -eq 1 ) { Write-Host "Fetch stats 1Min...[x]       " } }
       #     $averageBandwidth = $totalBandwidth / $count
       #  $NetaverageBandwidth += $averageBandwidth
        $cpulast2min += $window32processor.LoadPercentage
        $maxmemory = [System.Math]::Round($windows32.TotalVisibleMemorySize /1MB)
        $memoryleft = [System.Math]::Round((( $windows32.TotalVisibleMemorySize - $windows32.FreePhysicalMemory) / 1MB )) 
        $memorylast2min += ($memoryleft/$maxmemory).ToString("P").Replace("%","")
       #   $cpucookedlast2min += $gamecpucooked
        $timeSpan = new-timespan $(Get-Date) $endTime
        $minutes++
        Show-Graph -Datapoints $cpulast2min -YAxisTitle "Percentage" -XAxistitle "Seconds" -GraphTitle "CPU"
       # Show-Graph -Datapoints $memorylast2min -YAxisTitle "Percentage" -XAxistitle "Seconds" -GraphTitle "Memory" 
       # Show-Graph -Datapoints $cpucookedlast2min -YAxisTitle "Percentage" -XAxistitle "Time" -GraphTitle "CPU Cooked"
       # Show-Graph -Datapoints $NetaverageBandwidth -YAxisTitle "Avg" -XAxistitle "Time" -GraphTitle "Network"
    }
    # > uncomment next two lines for test show-graph
    # $data = 1..100 | Get-Random -Count 50
    # Show-Graph -Datapoints $Data -GraphTitle 'CPU'
      cls
      Get-logo
      Show-Graph -Datapoints $cpulast2min -YAxisTitle "Percentage" -XAxistitle "Seconds" -GraphTitle "CPU"
      # Show-Graph -Datapoints $cpucookedlast2min -YAxisTitle "Percentage" -XAxistitle "Time" -GraphTitle "CPU Cooked"
      Show-Graph -Datapoints $memorylast2min -YAxisTitle "Percentage" -XAxistitle "Seconds" -GraphTitle "Memory"
      #  Show-Graph -Datapoints $NetaverageBandwidth -YAxisTitle "Avg" -XAxistitle "Time" -GraphTitle "Net"
}
<###############################################################################################################
.SYNOPSIS
ps-menu 1.0.6
Powershell module to generate interactive console menu
https://www.powershellgallery.com/packages/ps-menu/1.0.6
@chrisseroka
.DESCRIPTION
Long description

.PARAMETER pos
Parameter description

.PARAMETER selection
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>#    
function DrawMenu {
    param ($menuItems, $menuPosition, $Multiselect, $selection)
    $l = $menuItems.length
    for ($i = 0; $i -le $l;$i++) {
		if ($menuItems[$i] -ne $null){
			$item = $menuItems[$i]
			if ($Multiselect)
			{
				if ($selection -contains $i){
					$item = '[x] ' + $item
				}
				else {
					$item = '[ ] ' + $item
				}
			}
			if ($i -eq $menuPosition) {
				Write-Host "$($circle) $($item)" -ForegroundColor White
			} else {
				Write-Host "  $($item)" -F Cyan
			}
		}
    }
}
function Toggle-Selection {
	param ($pos, [array]$selection)
	if ($selection -contains $pos){ 
		$result = $selection | where {$_ -ne $pos}
	}
	else {
		$selection += $pos
		$result = $selection
	}
	$result
}

function Menu {
    param ([array]$menuItems, [switch]$ReturnIndex=$false, [switch]$Multiselect)
    $vkeycode = 0
    $pos = 0
    $selection = @()
    $cur_pos = [System.Console]::CursorTop
    [console]::CursorVisible=$false #prevents cursor flickering
    if ($menuItems.Length -gt 0)
	{
		DrawMenu $menuItems $pos $Multiselect $selection
		While ($vkeycode -ne 13 -and $vkeycode -ne 27) {
			$press = $host.ui.rawui.readkey("NoEcho,IncludeKeyDown")
			$vkeycode = $press.virtualkeycode
			If ($vkeycode -eq 38 -or $press.Character -eq 'k') {$pos--}
			If ($vkeycode -eq 40 -or $press.Character -eq 'j') {$pos++}
			If ($press.Character -eq ' ') { $selection = Toggle-Selection $pos $selection }
			if ($pos -lt 0) {$pos = 0}
			If ($vkeycode -eq 27) {$pos = $null }
			if ($pos -ge $menuItems.length) {$pos = $menuItems.length -1}
			if ($vkeycode -ne 27)
			{
				[System.Console]::SetCursorPosition(0,$cur_pos)
				DrawMenu $menuItems $pos $Multiselect $selection
			}
		}
	}
	else 
	{
		$pos = $null
	}
    [console]::CursorVisible=$true

    if ($ReturnIndex -eq $false -and $pos -ne $null)
	{
		if ($Multiselect){
			return $menuItems[$selection]
		}
		else {
			return $menuItems[$pos]
		}
	}
	else 
	{
		if ($Multiselect){
			return $selection
		}
		else {
			return $pos
		}
	}
}
<################################################################################################################################################################
.SYNOPSIS
Draws graph in the Powershell console

.DESCRIPTION
Consumes datapoints and draws colored coded fully customizable graph in the Powershell console

.PARAMETER Datapoints
Array of data points which is to be plotted on the graph

.PARAMETER XAxisTitle
Defines text label on x-axis

.PARAMETER YAxisTitle
Defines text label on x-axis

.PARAMETER GraphTitle
Title of the graph

.PARAMETER XAxisStep
Define value of step on x-axis

.PARAMETER YAxisStep
Define value of step on y-axis

.PARAMETER Type
Choose type of the graph [bar, line, scatter]

.PARAMETER ColorMap
Hash table that defines the range of color codes

.PARAMETER HorizontalLines
Add horizontal lines to the graph area

.EXAMPLE
$data = 1..100 | Get-Random -Count 50
Show-Graph -Datapoints $Data -GraphTitle 'CPU'

.EXAMPLE
$data = 1..100 | Get-Random -Count 50
Show-Graph -Datapoints $Data -Type Line

.EXAMPLE
$data = 1..100 | Get-Random -Count 50
Show-Graph -Datapoints $Data -Type Scatter

.EXAMPLE
$data = 1..100 | Get-Random -Count 50
Show-Graph -Datapoints $Data -YAxisTitle "Percentage" -XAxistitle "Time"

.NOTES
Blog: https://RidiCurious.com/
Github: https://github.com/PrateekKumarSingh/Graphical
Author: https://twitter.com/SinghPrateik

Features and Benefits:
- Independent of PowerShell version, and Works on PowerShell Core (Windows\Linux)
- Color-coded output depending upon the Value of data point
- Colors codes can be customized by passing a color-map hash table
- Custom X an Y-Axis labels
- Graph in console is independent and fully customizable, not like Task Manager (Performance Tab)
- Could be incorporated in Powershell scripts
- Can consume data points generated during script run or Pre stored data like in a file or database.

#$Datapoints = (211..278|Get-Random -Count 50)
#Show-Graph -Datapoints $Datapoints -GraphTitle "Avg. CPU utilization" -YAxisTitle "Percent" `
#    -Type Bar -YAxisStep 10 -XAxisStep 10 -AddHorizontalLines -ColorMap @{230 = 'red'; 250 = 'cyan'; 270 = 'green'}
#Show-Graph -Datapoints $Datapoints -XAxisTitle "Avg. CPU utilization" -YAxisTitle "data a lot" `
#    -Type Scatter -YAxisStep 10 -XAxisStep 25 -AddHorizontalLines -ColorMap @{220 = 'red'; 240 = 'cyan'; 270 = 'green'; 290="Blue"}

#>
Function Show-Graph {
    [cmdletbinding()]
    [alias("Graph")]
    Param(
            # Parameter help description
            [Parameter(Mandatory=$true, ValueFromPipeline)] [int[]] $Datapoints,
            [String] $XAxisTitle,
            [String] $YAxisTitle,
            [String] $GraphTitle = 'Untitled',
            [ValidateScript({
                if($_ -le 5){
                Throw "Can not set XAxisStep less than or equals to 5"
                }
                else{
                    $true
                }
            })] [Int] $XAxisStep = 10,
            [Int] $YAxisStep = 10,
            [ValidateSet("Bar","Scatter","Line")] [String] $Type = 'Bar',
            [Hashtable] $ColorMap,
            [Switch] $HorizontalLines,
            $max
    )

    # graph boundary marks
    $TopLeft = [char]9484
    $BottomLeft = [char]9492
    $TopRight = [char]9488
    $BottomRight = [char]9496
    $VerticalEdge = [char]9474
    $TopEdge = $BottomEdge = [char]9472

    # Calculate Max, Min and Range of Y axis
    $NumOfDatapoints = $Datapoints.Count
    $Metric = $Datapoints | Measure-Object -Maximum -Minimum
    if ($command -eq 'stats') { 
        $EndofRange = 100
        $StartOfRange = 0

    }
    Else {
        $EndofRange = $Metric.Maximum + ($YAxisStep - $Metric.Maximum % $YAxisStep)
        $StartOfRange = $Metric.Minimum - ($Metric.Minimum % $YAxisStep)
    }

    $difference =  $EndofRange - $StartOfRange
    $NumOfRows = $difference/($YAxisStep)

    # Calculate label lengths
    $NumOfLabelsOnYAxis = $NumOfRows
    $LengthOfMaxYAxisLabel = (($Datapoints | Measure-Object -Maximum).Maximum).tostring().length
    
    $YAxisTitleAlphabetCounter = 0
    $YAxisTitleStartIdx, $YAxisTitleEndIdx = CenterAlignStringReturnIndices -String $YAxisTitle -Length $NumOfRows
    
    If($YAxisTitle.Length -gt $NumOfLabelsOnYAxis){
        Write-Warning "No. Alphabets in YAxisTitle [$($YAxisTitle.Length)] can't be greator than no. of Labels on Y-Axis [$NumOfLabelsOnYAxis]"
        Write-Warning "YAxisTitle will be cropped"
    }
    
    # Create a 2D Array to save datapoints  in a 2D format
    switch($Type){
        'Bar'       {$Array = Get-BarPlot -Datapoints $Datapoints -Step $YAxisStep -StartOfRange $StartOfRange -EndofRange $EndofRange }
        'Scatter'   {$Array = Get-ScatterPlot -Datapoints $Datapoints -Step $YAxisStep -StartOfRange $StartOfRange -EndofRange $EndofRange }
        'Line'      {$Array = Get-LinePlot -Datapoints $Datapoints -Step $YAxisStep -StartOfRange $StartOfRange -EndofRange $EndofRange }
    }
    
    # Preparing the step markings on the X-Axis
    $Increment = $XAxisStep
    $XAxisLabel = " " * ($LengthOfMaxYAxisLabel + 4)
    $XAxis = " " * ($LengthOfMaxYAxisLabel + 3) + [char]9492
    
    For($Label =1;$Label -le $NumOfDatapoints;$Label++){
        if ([math]::floor($Label/$XAxisStep) ){
            $XAxisLabel +=  $Label.tostring().PadLeft($Increment)
            $XAxis += ([char]9516).ToString()
            $XAxisStep+=$Increment
        }
        else{
            $XAxis += [Char]9472
        }
    }

    # calculate boundaries of the graph
    $TopBoundaryLength = $XAxis.Length - $GraphTitle.Length
    $BottomBoundaryLength = $XAxis.Length + 2
    
    # draw top boundary
    [string]::Concat($TopLeft," ",$GraphTitle," ",$([string]$TopEdge * $TopBoundaryLength),$TopRight)
    [String]::Concat($VerticalEdge,$(" "*$($XAxis.length+2)),$VerticalEdge) # extra line to add space between top-boundary and the graph
    
    # draw the graph
    For($i=$NumOfRows;$i -gt 0;$i--){
        $Row = ''
        For($j=0;$j -lt $NumOfDatapoints;$j++){
            $Cell = $Array[$i,$j]
            if([String]::IsNullOrWhiteSpace($Cell)){
                if($AddHorizontalLines){
                    $String = [Char]9472
                }
                else{
                    $String = ' '
                }
                #$String = [Char]9532
            }else{
                $String = $Cell
            }
            $Row = [string]::Concat($Row,$String)
        }
        
        $YAxisLabel = $StartOfRange + $i*$YAxisStep
        
        
        # add Y-Axis title alphabets if it exists in a row
        If($i -in $YAxisTitleStartIdx..$YAxisTitleEndIdx -and $YAxisTitle){
            $YAxisLabelAlphabet = $YAxisTitle[$YAxisTitleAlphabetCounter]
            $YAxisTitleAlphabetCounter++
        }
        else {
            $YAxisLabelAlphabet = ' '
        }
        

        If($ColorMap){

            $Keys = $ColorMap.Keys| Sort-Object
            $LowerBound = $StartOfRange
            $Map=@()

            $Map += For($k=0;$k -lt $Keys.count;$k++){
                [PSCustomObject]@{
                    LowerBound  = $LowerBound
                    UpperBound  = $Keys[$k]
                    Color       = $ColorMap[$Keys[$k]]
                }
                $LowerBound = $Keys[$k]+1
            }
            
            $Color = $Map.ForEach({
                if($YAxisLabel -in $_.LowerBound..$_.UpperBound){
                    $_.Color
                }
            })

            if ([String]::IsNullOrEmpty($Color)) {$Color = "White"}
            
            Write-Graph $YAxisLabelAlphabet $YAxisLabel $Row $Color 'DarkYellow'

        }
        else{
            # Default coloring mode divides the datapoints in percentage range
            # and color code them automatically 
            # i.e, 
            # 1-40% -> Green
            # 41-80% -> Yellow
            # 81-100% -> Red

            $RangePercent = $i/$NumOfRows * 100
            # To color the graph depending upon the datapoint value
            If ($RangePercent -gt 80) {
                Write-Graph $YAxisLabelAlphabet $YAxisLabel $Row 'Red' 'DarkYellow'
            }
            elseif($RangePercent-le 80 -and $RangePercent -gt 40) {
                Write-Graph $YAxisLabelAlphabet $YAxisLabel $Row 'Yellow' 'DarkYellow' 
            }
            elseif($RangePercent -le 40 -and $RangePercent -ge 1) {
                Write-Graph $YAxisLabelAlphabet $YAxisLabel $Row 'Green' 'DarkYellow'
            }
            else {
                #Write-Host "$YAxisLabel|"
                #Write-Host "$($YAxisLabel.PadLeft($LengthOfMaxYAxisLabel+2))|"
            }
        }
        
    }
    
    # draw bottom boundary
    $XAxisLabel +=" "*($XAxis.Length-$XAxisLabel.Length) # to match x-axis label length with x-axis length
    [String]::Concat($VerticalEdge,$XAxis,"  ",$VerticalEdge) # Prints X-Axis horizontal line
    [string]::Concat($VerticalEdge,$XAxisLabel,"  ",$VerticalEdge) # Prints X-Axis step labels

    
    if(![String]::IsNullOrWhiteSpace($XAxisTitle)){
        # Position the x-axis label at the center of the axis
        $XAxisTitle = " "*$LengthOfMaxYAxisLabel + (CenterAlignString $XAxisTitle $XAxis.Length)        
        Write-Host $VerticalEdge -NoNewline
        Write-Host $XAxisTitle -ForegroundColor DarkYellow -NoNewline # Prints XAxisTitle
        Write-Host $(" "*$(($LengthOfMaxYAxisLabel + $XAxis.length) - $XAxisTitle.Length - 2)) $VerticalEdge
    }
    
    # bottom boundary
    [string]::Concat($BottomLeft,$([string]$BottomEdge * $BottomBoundaryLength),$BottomRight)
    
}

Function Get-BarPlot {
    [cmdletbinding()]
    [alias("bar")]
    Param(
            # Parameter help description
            [Parameter(Mandatory=$true)]
            [int[]] $Datapoints,
            [int] $StartOfRange,
            [int] $EndofRange,
            [int] $Step = 10
    )
    $Difference = $EndofRange - $StartOfRange

    $NumOfDatapoints = $Datapoints.Count
    $HalfStep = [Math]::Ceiling($Step/2)
    $Marker = [char] 9608

    # Create a 2D Array to save datapoints  in a 2D format
    $NumOfRows = $difference/($Step) + 1
    $Array = New-Object 'object[,]' $NumOfRows,$NumOfDatapoints

    For($i = 0;$i -lt $Datapoints.count;$i++){
        # Fit datapoint in a row, where, a row's data range = Total Datapoints / Step
        $RowIndex = [Math]::Ceiling($($Datapoints[$i]-$StartOfRange)/$Step)
        # use a half marker is datapoint falls in less than equals half of the step
        $HalfMark = $Datapoints[$i]%$Step -in $(1..$HalfStep)
        
        if($HalfMark){
            $Array[($RowIndex),$i] = [char] 9604
        }else{
            $Array[($RowIndex),$i] = $Marker
        }
        
        # To get a bar fill all the same row indices of 2D array under and including datapoint
        For($j=0;$j -lt $RowIndex;$j++){
            $Array[$j,$i] = $Marker
        }
    }

    # return the 2D array of plots
    return ,$Array
}
Function Get-LinePlot {
    [cmdletbinding()]
    [alias("line")]
    Param(
            # Parameter help description
            [Parameter(Mandatory=$true)]
            [int[]] $Datapoints,
            [int] $StartOfRange,
            [int] $EndofRange,
            [int] $Step = 10
    )
    $Difference = $EndofRange - $StartOfRange
    $NumOfDatapoints = $Datapoints.Count

    
    # Create a 2D Array to save datapoints  in a 2D format
    $NumOfRows = $difference/($Step) + 1
    $Array = New-Object 'object[,]' $NumOfRows,$NumOfDatapoints

    $Marker = [char] 9608
    $Line = [char] 9616

    For($i = 0;$i -lt $Datapoints.count;$i++){
        # Fit datapoint in a row, where, a row's data range = Total Datapoints / Step
        $RowIndex = [Math]::Ceiling($($Datapoints[$i]-$StartOfRange)/$Step) 
        $RowIndexNextItem = [Math]::Ceiling($($Datapoints[$i+1]-$StartOfRange)/$Step)

        # to decide the direction of line joining two data points
        if($RowIndex -gt $RowIndexNextItem){
            Foreach($j in $($RowIndex-1)..$($RowIndexNextItem+1)){
                $Array[$j,$i] = $Line # add line
            }
        }elseif($RowIndex -lt $RowIndexNextItem){
            Foreach($j in $($RowIndex)..$($RowIndexNextItem-1)){
                $Array[$j,$i] = $Line # add line
            }
        }
        $Array[$RowIndex,$i] = [char] $Marker # data point
    }
    # return the 2D array of plots
    return ,$Array
}
Function Get-ScatterPlot {
    [cmdletbinding()]
    [alias("scatter")]
    Param(
            # Parameter help description
            [Parameter(Mandatory=$true)]
            [int[]] $Datapoints,
            [int] $StartOfRange,
            [int] $EndofRange,
            [int] $Step = 10
            #[ValidateSet("square","dot","triangle")] [String] $Marker = 'dot'
    )

    # Create a 2D Array to save datapoints  in a 2D format
    $Difference = $EndofRange - $StartOfRange
    $NumOfRows = $difference/($Step) + 1
    $NumOfDatapoints = $Datapoints.Count
    $Array = New-Object 'object[,]' ($NumOfRows),$NumOfDatapoints


    For($i = 0;$i -lt $Datapoints.count;$i++){
        # Fit datapoint in a row, where, a row's data range = Total Datapoints / Step
        $RowIndex = [Math]::Ceiling($($Datapoints[$i]-$StartOfRange)/$Step) 

        # use a half marker is datapoint falls in less than equals half of the step
        $LowerHalf = $Datapoints[$i]%$Step -in $(1..$HalfStep)
        
        if($LowerHalf){
            $Array[$RowIndex,$i] = [char] 9604
        }else{
            $Array[$RowIndex,$i] = [char] 9600
        }
        
    }

    # return the 2D array of plots
    return ,$Array
}
Function CenterAlignString ($String, $Length) {
    $Padding = [math]::Round( $Length/2 + [math]::round( $String.length/2)  )
    return $String.PadLeft($Padding)
}
Function CenterAlignStringReturnIndices ($String, $Length) {
    $StartIdx = [Math]::Round(($Length + ($String.Length -1)) / 2 )
    $EndIdx = $StartIdx - ($String.Length -1)
    return $StartIdx, $EndIdx
}

Function Write-Graph($YAxisLabelAlphabet, $YAxisLabel, $Row, $RowColor, $LabelColor)
{
Write-Host $([char]9474) -NoNewline
Write-Host $YAxisLabelAlphabet -ForegroundColor $LabelColor -NoNewline
Write-Host "$($YAxisLabel.tostring().PadLeft($LengthOfMaxYAxisLabel+2) + [Char]9508)" -NoNewline
##Write-Host "$YAxisLabel|" -NoNewline
Write-Host $Row -ForegroundColor $RowColor -NoNewline
Write-Host " " $([char]9474) 
}
#################################################################################################################################################################


