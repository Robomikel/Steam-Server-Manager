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
    Write-log "Function: $($MyInvocation.Mycommand)"
    If (Test-Path $serverdir\Variables-$serverfiles.ps1 ) {
        . { 
            Invoke-Expression $serverdir\Variables-$serverfiles.ps1

        } 
    }
    Else {
        Get-warnmessage "fn_InstallServerFiles"
    }
}
Function Get-help {
    Write-log "Function: $($MyInvocation.Mycommand)"
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
    If ($debuglog -eq 'on') {
        #$error | Out-File -Append -Encoding Default $ssmerrorlog
        $error > $ssmerrorlog
    }
    Write-log "Function: $($MyInvocation.Mycommand)"
    if ($disableclearvariable -ne $true) {
        $var = (Get-Variable * -scope global).Name
        Write-log "Removing Variables $var" 
        Remove-Variable * -Scope Global  -ea SilentlyContinue -Force
        # Write-log " Variables $var"
    }
}
Function Get-TestInterger {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($APPID) {
        If ( $APPID -notmatch '^[0-9]+$') { 
            Get-warnmessage "invalidnumbers"
            
        }
    }
}
Function Get-TestString {
    Write-log "Function: $($MyInvocation.Mycommand)"
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
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ( $logo -ne "off") {
        Clear-Host
        $host.ui.RawUi.WindowTitle = "...::: Steam-Server-Manager :::..."
        [console]::ForegroundColor = "White"
        [console]::BackgroundColor = "Black"
        $host.PrivateData.VerboseForegroundColor = 'White'
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
    Else {
        $host.ui.RawUi.WindowTitle = "...::: Steam-Server-Manager :::..."
        [console]::ForegroundColor = "Green"
        [console]::BackgroundColor = "Black"
        $host.PrivateData.VerboseForegroundColor = 'White'
    }
}
Function Get-Logo {
    Write-log "Function: $($MyInvocation.Mycommand)"
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
    Write-log "Function: $($MyInvocation.Mycommand)"
    If (!$command) {
        Select-Steamer 
    }
    else {
        Select-Steamer $command $serverfiles
    }
}
Function Set-VariablesPS {
    Write-log "Function: $($MyInvocation.Mycommand)"
    clear-hostline 1
    Get-Infomessage "creating" 'info'
    New-Item $serverdir\Variables-$serverfiles.ps1 -Force
}

Function Get-Savelocation {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ( !$saves ) {
        Write-log "No saves located in App Data" 
    }
    Else {
        if ($saves) {
            if (test-path $($env:APPDATA + '\' + $saves)) {
                Write-log "Info: Found Appdata Roaming save"
                $savedata = "$env:APPDATA"
            }
            ElseIf (test-path $($env:LOCALAPPDATA + '\' + $saves)) {
                Write-log "Info: Found Appdata local save"
                $savedata = "$env:LOCALAPPDATA"
            }
            ElseIf (test-path $($env:LOCALAPPDATA + $saves)) {
                Write-log "Info: Found Appdata locallow save?"
                $savedata = "$env:LOCALAPPDATA"
            }
            else{
                Write-log "could not find path for AppData roaming,local,locallow"
                return
            }
        }
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
    Write-log "Function: $($MyInvocation.Mycommand)"
    # Write-Host "***  Renaming srcds.exe to $executable to avoid conflict with local source Engine (srcds.exe) server  ***" -F M -B Black
    Write-log "Renaming srcds.exe to $executable to avoid conflict with local source Engine (srcds.exe) server"
    Rename-Item  "$executabledir\srcds.exe" -NewName "$executabledir\$executable.exe" >$null 2>&1
    Rename-Item  "$executabledir\srcds_x64.exe" -NewName "$executabledir\$executable-x64.exe" >$null 2>&1
}
Function Select-EditSourceCFG {
    Write-log "Function: $($MyInvocation.Mycommand)"
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
    Write-log "Function: $($MyInvocation.Mycommand)"
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
                '1670340' { $line = 2; Set-ServerConfig }
                # '17515' { $line = 9; Set-ServerConfig }
                # '376030' { $line = 97; Set-ServerConfig }
                # '233780' { $line = 16; Set-ServerConfig }
                Default { Set-ServerConfig }
            }
        }
    }
    Write-log "Function: $($MyInvocation.Mycommand)"
}

Function Set-ServerConfig {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $removelinenumber = @( 407480,1670340 )
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
    Write-log "$deleteline -like `"*hostname*`" -or $deleteline -like `"*SERVERNAME*`" -or $deleteline -like `"*name*`" -and $deleteline -notmatch `"$hostname`""
    If ($deleteline -like "*hostname*" -or $deleteline -like "*SERVERNAME*" -or $deleteline -like "*SessionName*" -or $deleteline -like "*name*" -and $deleteline -notmatch "$hostname"  ) {
        Write-log "$deleteline -like `"*hostname*`" -or $deleteline -like `"*SERVERNAME*`" -and $deleteline -notmatch `"$hostname`""
        switch ($appid) {
            '294420' { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "`t<property name=`"ServerName`"						value=`"$hostname`"`/>" | Set-Content "${servercfgdir}\${servercfg}" }
            '294420' { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline2", "`t<property name=`"ServerPort`"						value=`"$port`"`/>" | Set-Content "${servercfgdir}\${servercfg}"; Break }
            { @( '407480', '443030', '232130', '629800', '412680', '1420710', '728470' ) -contains $_ } { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "ServerName=$hostname" | Set-Content "${servercfgdir}\${servercfg}"; Break }
            { @( '403240', '261020', '418480', '696120', '1141420' ) -contains $_ } { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "ServerName=`"$hostname`"" | Set-Content "${servercfgdir}\${servercfg}"; Break }
            { @('17515', '237410', '232250', '276060', '346680', '228780', '475370', '383410', '238430', '740', '232290', '462310', '317800', '460040', '17585', '17555', '295230', '4020', '232370', '222860', '332670', '17505', '329710') -contains $_ } { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "hostname `"$hostname`"" | Set-Content "${servercfgdir}\${servercfg}"; Break }
            '233780' { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "hostname = `"$hostname`";" | Set-Content "${servercfgdir}\${servercfg}"; Break }
            '343050' { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "cluster_name = $hostname" | Set-Content "${servercfgdir}\${servercfg}"; Break }
            '376030' { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "SessionName=$hostname" | Set-Content "${servercfgdir}\${servercfg}"; Break }
            '1064780' { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "SERVERNAME=$hostname" | Set-Content "${servercfgdir}\${servercfg}"; Break }
            '1180760' { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "sv_hostname `"$hostname`"" | Set-Content "${servercfgdir}\${servercfg}"; Break }
            '1670340' { ( gc ${servercfgdir}\${servercfg} ) -replace "$deleteline", "name=$hostname" | Set-Content "${servercfgdir}\${servercfg}"; Break }
            Default { Write-log "Failed: Edit ServerConfig Hostname" }
        }
    }
    Else {
        Write-log "Failed: Edit ServerConfig Hostname" 
    }
}
Function New-ServerLog {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($consolelogging -eq "on") { 
        If ($consolelog  ) {
            If (Test-Path $logdirectory\$consolelog  ) {
                Write-log "Found $consolelog"
                $log = (Get-ChildItem -Depth 1 $logdirectory -Filter $consolelog | Sort-Object LastWriteTime -Descending | Select-Object -First 1).Name
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
    Write-log "Function: $($MyInvocation.Mycommand)"
    Write-log "Removing logs over $consolelogcount backup_$serverfiles-*.log"
    If (Test-Path $logdir\backup_$serverfiles-*.log) {
        Get-Childitem -Depth 1 $logdir\$serverfiles-*.log -Recurse | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
    }
}
Function Remove-ServerconsoleLogs {
    Write-log "Function: $($MyInvocation.Mycommand)"
    Write-log "Removing logs over $consolelogcount $serverfiles-*.log"
    If (Test-Path $logdir\$serverfiles-*.log) {
        Get-Childitem -Depth 1 $logdir\$serverfiles-*.log -Recurse | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
    }
}
Function Remove-SteamerLogs {
    Write-log "Function: $($MyInvocation.Mycommand)"
    Write-log "Removing logs over $consolelogcount $ssmlogdir\ssm-*.log"
    If (Test-Path $ssmlogdir\*.log) {
        Get-Childitem -Depth 1 $ssmlogdir -Recurse | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
    }
}
Function Send-Paste_OLD {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($serverfiles) {
        If (Test-Path $currentdir\log\$serverfiles-*.log) {
            Set-Location $logdir
            $paste = Get-Childitem -Depth 1 $logdir -Filter $serverfiles-*.log | Sort-Object LastWriteTime -Descending | Select-Object -First 1
            Out-Pastebin  -InputObject $(Get-Content "$paste") -PasteTitle "$serverfiles" -ExpiresIn 10M -Visibility Unlisted
            Set-Location $currentdir
        }

    }
}
Function New-ServerBackupLog {
    Write-log "Function: $($MyInvocation.Mycommand)"
    #If ($backuplogs -eq "on") { Copy-Item "$sevenzipdirectory\[b]*.log", -Destination "$logdir\backup_$serverfiles-$date.log" -ea SilentlyContinue }
    Get-Childitem -Depth 1 $logdir -Recurse | where-object name -like backup_$serverfiles-*.log | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
}
Function New-ServerAppDataBackupLog {
    Write-log "Function: $($MyInvocation.Mycommand)"
    #If ($backuplogs -eq "on") { Copy-Item "$sevenzipdirectory\[A]*.log", -Destination "$logdir\AppDatabackup_$serverfiles-$date.log" -ea SilentlyContinue }
    Get-Childitem -Depth 1 $logdir -Recurse | where-object name -like AppDatabackup_$serverfiles-*.log | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
}
Function Get-Appid {
    Write-log "Function: $($MyInvocation.Mycommand)"
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
    try {
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        $global:mcbrWebResponse = ((Invoke-WebRequest "https://www.minecraft.net/en-us/download/server/bedrock/" -UseBasicParsing).Links | Where-Object { $_.href -like "https://minecraft.azureedge.net/bin-win/*" })
        if ($?) {
            # Get-Infomessage "Downloaded" 'SteamCMD'
        }
    }
    catch {
        If (!$? -or !$mcbrWebResponse) {
            Write-log "$($_.Exception.Message)"
            Write-log "Failed: Get-MCBRWebrequest"
            Exit
        }
    }
}
Function Get-MCWebrequest {
    Write-log "Function: Get-MCWebrequest"
    # check latest version
    try {
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        $mcvWebResponse = Invoke-WebRequest "https://launchermeta.mojang.com/mc/game/version_manifest.json" -UseBasicParsing | ConvertFrom-Json
        $global:mcvWebResponse = $mcvWebResponse.Latest.release
    }
    catch {
        If (!$? -or !$mcvWebResponse) {
            Write-log "Failed: Get-MCWebrequest"
            Exit
        }
    }
}
Function Get-MetaModWebrequest {
    Write-log "Function: $($MyInvocation.Mycommand)"
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    if ($appid = 346680) {
        $metamodlatest = iwr "https://www.sourcemm.net/downloads.php?branch=1.11-dev&all=1"
        $metamodlatestlist = ($metamodlatest.Links.href | Get-Unique | select-string -SimpleMatch 1143 | select-string -SimpleMatch 'windows.zip')
    }
    else {
        $metamodlatest = iwr "http://www.metamodsource.net/downloads.php?branch=$mmversion"
        $metamodlatestlist = ($metamodlatest.Links.href | Get-Unique | select-string -SimpleMatch 'windows.zip')
    }
    
    # $metamodmversion = $($metamodlatestlist -split '/')[4]
    $global:metamodmversionzip = $($metamodlatestlist -split '/')[5]
    $global:metamodlatestlisturl = $metamodlatestlist[0]
    $global:metamodmversionfolder = $metamodmversionzip.Replace('.zip', '')
    # $mmWebResponse = Invoke-WebRequest "https://mms.alliedmods.net/mmsdrop/$metamodmversion/mmsource-latest-windows" -UseBasicParsing -ea SilentlyContinue
    # $mmWebResponse = $mmWebResponse.content
    # $global:metamodurl = "https://mms.alliedmods.net/mmsdrop/$metamodmversion/$mmWebResponse"
    # $metamoddownloadurl = "https://www.metamodsource.net/latest.php?os=windows&version=${metamodmversion}"
    # $global:metamodurl = "${metamoddownloadurl}"
    If (!$metamodlatestlisturl -or !$metamodmversionfolder) {
        Write-log "Failed: Get-SourceMetaModWebrequest"
        Exit
    }
}

Function Get-Sourcemodwebrequest {
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    if ($appid = 346680) {
        $sourcemodlatest = iwr "https://www.sourcemod.net/downloads.php?branch=1.11-dev&all=1"
        $sourcemodlatestlist = ($sourcemodlatest.Links.href | Get-Unique | select-string -SimpleMatch 6874 | select-string -SimpleMatch 'windows.zip')
    }
    else {
        $sourcemodlatest = iwr "https://www.sourcemod.net/downloads.php?branch=$smversion"
        $sourcemodlatestlist = ($sourcemodlatest.Links.href | Get-Unique | select-string -SimpleMatch 'windows.zip')
    }
    # $sourcemodmversion = $($sourcemodlatestlist -split '/')[4]
    $global:sourcemodmversionzip = $($sourcemodlatestlist -split '/')[5]
    $global:sourcemodlatestlisturl = $sourcemodlatestlist[0]
    $global:sourcemodmversionfolder = $sourcemodmversionzip.Replace('.zip', '') 
    # $smWebResponse = Invoke-WebRequest "https://sm.alliedmods.net/smdrop/$sourcemodmversion/sourcemod-latest-windows" -UseBasicParsing -ErrorAction SilentlyContinue
    # $smWebResponse = $smWebResponse.content
    # $global:sourcemodurl = "https://sm.alliedmods.net/smdrop/$sourcemodmversion/$smWebResponse"
    # $sourcemoddownloadurl = "https://www.sourcemod.net/latest.php?os=windows&version=${sourcemodmversion}"
    # $global:sourcemodurl = "${sourcemoddownloadurl}"
    If (!$sourcemodlatestlisturl -or !$sourcemodmversionfolder) {
        Write-log "Failed: Get-SourceMetaModWebrequest"
        Exit
    }
}
Function Get-PreviousInstall {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If (Test-Path $serverdir\Variables-*.ps1) {
        $check = (Get-Childitem -Depth 1 $serverdir | Where-Object { $_.Name -like 'Variables-*' } -ea SilentlyContinue)
        If ($check) {
            Get-createdvaribles
            If ( $process ) {
                Get-StopServerInstall
                # Get-ClearVariables
            }
        }
    }
    Else {
        Get-ExtIP
    }
}

Function compare-SteamExit {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($ssmlog -and $loggingdate) {
        If ($appinstalllog) {
            If ($appinstalllog -Like "Steam Guard code:FAILED*") {
                Get-Infomessage "****   Failed Logon Requires set_steam_guard_code ****" $false
                push-location
                Set-Location $steamdirectory
                .\steamCMD +login $username $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)) +force_install_dir $serverdir +app_update $APPID $Branch +Exit
                pop-location
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
    Write-log "Function: $($MyInvocation.Mycommand)"
    $global:psSeven = ( $PSVersionTable.PSVersion.Major -eq 7 ) 
    If ($psSeven -eq $true ) {
        $psSeven = 1
    }
    Else {
        $psSeven = $null
    }
}
Function Set-SteamerSettingLog {
    Write-log "Function: $($MyInvocation.Mycommand)"
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
    Write-Log "Settings: Monitor Query  = $monquery"
    Write-log "Setting: consolelogging   = $consolelogging "
    Write-log "Setting: consolelogging count  = $consolelogcount "
    Write-log "Setting: ssmlogging  = $ssmlogging   "
    Write-log "Setting: ssmlogging count   = $ssmlogcount   "
    Write-log "Setting: Console Text Color   = $textcolor  "
    Write-log "Setting: advanced  = $advanced "
    Write-log "Setting: Server List Directory   = $serverlistdir"
    Write-log "Setting: SSM Directory  = $currentdir "
    Write-log "Setting: Backup Directory  = $bwd "
    Write-log "Setting: Serverfiles Directory  = $sfwd"
    write-log "Setting: ssm log Directory   = $ssmlogdir"
    Write-log "Setting: log Directory  = $logdir"
    Write-log "Setting: SSM Log  = $ssmlog"
    Write-log "Setting: MC Version   = $mcversion"
    Write-log "Setting: Steam Master    = $steammastercheck "
    Write-log "Setting: Pastebin  = $pastebinconsolelog"
    Write-log "Setting: Discord Webhook    = $discordwebhook  "
    Write-log "Setting: Discord Display IP  = $discorddisplayip  "
    Write-Log "Settings: Backup Directory   = $currentdir "
    Write-Log "Settings: Serverfiles Directory = $currentdir"
    Write-Log "Settings: Serverdir = $sfwd\$serverfiles"
    Write-Log "Settings: Backups Directory = $bwd\backups"
}
Function Test-VariablesNull {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ( $testvariable -eq "on" ) {
        Get-Variable | Where-Object Value -Like $null | ForEach-Object { if ($_.Name -notlike "ConsoleFileName" -and $_.Name -notlike "null" -and $_.Name -notlike "PSCommandPath" -and $_.Name -notlike "PSEmailServer" -and $_.Name -notlike "PSScriptRoot" -and $_.Name -notlike "discorddisplayip" -and $_.Name -notlike "discordwebhook" -and $_.Name -notlike "PastebinDeveloperKey" -and $_.Name -notlike "PastebinPassword" -and $_.Name -notlike "PastebinUsername" -and $_.Name -notlike "steamcmdparmas" -and $_.Name -notlike "`$" -and $_.Name -notlike "`^" -and $_.Name -notlike "StackTrace" -and $_.Name -notlike "option3" -and $_.Name -notlike "option2") { 
                $name = $_.Name ; Write-log "WARNING: $name is empty variable"
            }
        }
    }
}
Function Get-CustomSettings {
    Write-log "Function: $($MyInvocation.Mycommand)"
    New-LocalFolder
    Write-log "Test-Path $currentdir\$configlocal\local_settings.ps1"

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
    Write-log "Function: $($MyInvocation.Mycommand)"
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
    #                               Monitor Query
    `$global:monquery                = `"$monquery`"
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
    #                               Advanced Mode: Pauses during Install to allow a manual edit of config-local\*_default.ps1 
    `$global:advanced                = `"$advanced`"
    #                               Server List Directory
    `$global:serverlistdir           = `"$serverlistdir`"
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
    #                               SourceMod Version
    `$global:smversion               = `"$smversion`" # stable / dev
    #                               MetaMod Version
    `$global:mmversion               = `"$mmversion`" # stable / master 
    #############   Custom Directories        ###############
    #                                Backup Directory 
    `$global:bwd                     = `"$currentdir`"
    #                               Serverfiles Directory
    `$global:sfwd                    = `"$currentdir`"
    #########################################################
    #                                 Do Not Change
    `$global:serverdir               = `"`$sfwd\`$serverfiles`"
    #                               Backups Directory
    `$global:backupdir               = `"`$bwd\backups`"
    Set-SteamerSettingLog
}"
}

Function Import-localConfig {
    Write-log "Function: $($MyInvocation.Mycommand)"
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
    Write-log "Function: $($MyInvocation.Mycommand)"
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
        [console]::CursorVisible = $false
        Get-Logo
        $bar++
        $bar | % { if ($_ % 2 -eq 0 ) { Write-Host "Fetch stats 1Min...[-]       " } }
        $bar | % { if ($_ % 2 -eq 1 ) { Write-Host "Fetch stats 1Min...[x]       " } }
        #     $averageBandwidth = $totalBandwidth / $count
        #  $NetaverageBandwidth += $averageBandwidth
        $cpulast2min += $window32processor.LoadPercentage
        $maxmemory = [System.Math]::Round($windows32.TotalVisibleMemorySize / 1MB)
        $memoryleft = [System.Math]::Round((( $windows32.TotalVisibleMemorySize - $windows32.FreePhysicalMemory) / 1MB )) 
        $memorylast2min += ($memoryleft / $maxmemory).ToString("P").Replace("%", "")
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
    for ($i = 0; $i -le $l; $i++) {
        if ($menuItems[$i] -ne $null) {
            $item = $menuItems[$i]
            if ($Multiselect) {
                if ($selection -contains $i) {
                    $item = '[x] ' + $item
                }
                else {
                    $item = '[ ] ' + $item
                }
            }
            if ($i -eq $menuPosition) {
                Write-Host "$($circle) $($item)" -ForegroundColor White
            }
            else {
                Write-Host "  $($item)" -F Cyan
            }
        }
    }
}
function Toggle-Selection {
    param ($pos, [array]$selection)
    if ($selection -contains $pos) { 
        $result = $selection | where { $_ -ne $pos }
    }
    else {
        $selection += $pos
        $result = $selection
    }
    $result
}

function Menu {
    param ([array]$menuItems, [switch]$ReturnIndex = $false, [switch]$Multiselect)
    $vkeycode = 0
    $pos = 0
    $selection = @()
    $cur_pos = [System.Console]::CursorTop
    [console]::CursorVisible = $false #prevents cursor flickering
    if ($menuItems.Length -gt 0) {
        DrawMenu $menuItems $pos $Multiselect $selection
        While ($vkeycode -ne 13 -and $vkeycode -ne 27) {
            $press = $host.ui.rawui.readkey("NoEcho,IncludeKeyDown")
            $vkeycode = $press.virtualkeycode
            If ($vkeycode -eq 38 -or $press.Character -eq 'k') { $pos-- }
            If ($vkeycode -eq 40 -or $press.Character -eq 'j') { $pos++ }
            If ($press.Character -eq ' ') { $selection = Toggle-Selection $pos $selection }
            if ($pos -lt 0) { $pos = 0 }
            If ($vkeycode -eq 27) { $pos = $null }
            if ($pos -ge $menuItems.length) { $pos = $menuItems.length - 1 }
            if ($vkeycode -ne 27) {
                [System.Console]::SetCursorPosition(0, $cur_pos)
                DrawMenu $menuItems $pos $Multiselect $selection
            }
        }
    }
    else {
        $pos = $null
    }
    [console]::CursorVisible = $true

    if ($ReturnIndex -eq $false -and $pos -ne $null) {
        if ($Multiselect) {
            return $menuItems[$selection]
        }
        else {
            return $menuItems[$pos]
        }
    }
    else {
        if ($Multiselect) {
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
        [Parameter(Mandatory = $true, ValueFromPipeline)] [int[]] $Datapoints,
        [String] $XAxisTitle,
        [String] $YAxisTitle,
        [String] $GraphTitle = 'Untitled',
        [ValidateScript( {
                if ($_ -le 5) {
                    Throw "Can not set XAxisStep less than or equals to 5"
                }
                else {
                    $true
                }
            })] [Int] $XAxisStep = 10,
        [Int] $YAxisStep = 10,
        [ValidateSet("Bar", "Scatter", "Line")] [String] $Type = 'Bar',
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

    $difference = $EndofRange - $StartOfRange
    $NumOfRows = $difference / ($YAxisStep)

    # Calculate label lengths
    $NumOfLabelsOnYAxis = $NumOfRows
    $LengthOfMaxYAxisLabel = (($Datapoints | Measure-Object -Maximum).Maximum).tostring().length
    
    $YAxisTitleAlphabetCounter = 0
    $YAxisTitleStartIdx, $YAxisTitleEndIdx = CenterAlignStringReturnIndices -String $YAxisTitle -Length $NumOfRows
    
    If ($YAxisTitle.Length -gt $NumOfLabelsOnYAxis) {
        Write-Warning "No. Alphabets in YAxisTitle [$($YAxisTitle.Length)] can't be greator than no. of Labels on Y-Axis [$NumOfLabelsOnYAxis]"
        Write-Warning "YAxisTitle will be cropped"
    }
    
    # Create a 2D Array to save datapoints  in a 2D format
    switch ($Type) {
        'Bar' { $Array = Get-BarPlot -Datapoints $Datapoints -Step $YAxisStep -StartOfRange $StartOfRange -EndofRange $EndofRange }
        'Scatter' { $Array = Get-ScatterPlot -Datapoints $Datapoints -Step $YAxisStep -StartOfRange $StartOfRange -EndofRange $EndofRange }
        'Line' { $Array = Get-LinePlot -Datapoints $Datapoints -Step $YAxisStep -StartOfRange $StartOfRange -EndofRange $EndofRange }
    }
    
    # Preparing the step markings on the X-Axis
    $Increment = $XAxisStep
    $XAxisLabel = " " * ($LengthOfMaxYAxisLabel + 4)
    $XAxis = " " * ($LengthOfMaxYAxisLabel + 3) + [char]9492
    
    For ($Label = 1; $Label -le $NumOfDatapoints; $Label++) {
        if ([math]::floor($Label / $XAxisStep) ) {
            $XAxisLabel += $Label.tostring().PadLeft($Increment)
            $XAxis += ([char]9516).ToString()
            $XAxisStep += $Increment
        }
        else {
            $XAxis += [Char]9472
        }
    }

    # calculate boundaries of the graph
    $TopBoundaryLength = $XAxis.Length - $GraphTitle.Length
    $BottomBoundaryLength = $XAxis.Length + 2
    
    # draw top boundary
    [string]::Concat($TopLeft, " ", $GraphTitle, " ", $([string]$TopEdge * $TopBoundaryLength), $TopRight)
    [String]::Concat($VerticalEdge, $(" " * $($XAxis.length + 2)), $VerticalEdge) # extra line to add space between top-boundary and the graph
    
    # draw the graph
    For ($i = $NumOfRows; $i -gt 0; $i--) {
        $Row = ''
        For ($j = 0; $j -lt $NumOfDatapoints; $j++) {
            $Cell = $Array[$i, $j]
            if ([String]::IsNullOrWhiteSpace($Cell)) {
                if ($AddHorizontalLines) {
                    $String = [Char]9472
                }
                else {
                    $String = ' '
                }
                #$String = [Char]9532
            }
            else {
                $String = $Cell
            }
            $Row = [string]::Concat($Row, $String)
        }
        
        $YAxisLabel = $StartOfRange + $i * $YAxisStep
        
        
        # add Y-Axis title alphabets if it exists in a row
        If ($i -in $YAxisTitleStartIdx..$YAxisTitleEndIdx -and $YAxisTitle) {
            $YAxisLabelAlphabet = $YAxisTitle[$YAxisTitleAlphabetCounter]
            $YAxisTitleAlphabetCounter++
        }
        else {
            $YAxisLabelAlphabet = ' '
        }
        

        If ($ColorMap) {

            $Keys = $ColorMap.Keys | Sort-Object
            $LowerBound = $StartOfRange
            $Map = @()

            $Map += For ($k = 0; $k -lt $Keys.count; $k++) {
                [PSCustomObject]@{
                    LowerBound = $LowerBound
                    UpperBound = $Keys[$k]
                    Color      = $ColorMap[$Keys[$k]]
                }
                $LowerBound = $Keys[$k] + 1
            }
            
            $Color = $Map.ForEach( {
                    if ($YAxisLabel -in $_.LowerBound..$_.UpperBound) {
                        $_.Color
                    }
                })

            if ([String]::IsNullOrEmpty($Color)) { $Color = "White" }
            
            Write-Graph $YAxisLabelAlphabet $YAxisLabel $Row $Color 'DarkYellow'

        }
        else {
            # Default coloring mode divides the datapoints in percentage range
            # and color code them automatically 
            # i.e, 
            # 1-40% -> Green
            # 41-80% -> Yellow
            # 81-100% -> Red

            $RangePercent = $i / $NumOfRows * 100
            # To color the graph depending upon the datapoint value
            If ($RangePercent -gt 80) {
                Write-Graph $YAxisLabelAlphabet $YAxisLabel $Row 'Red' 'DarkYellow'
            }
            elseif ($RangePercent -le 80 -and $RangePercent -gt 40) {
                Write-Graph $YAxisLabelAlphabet $YAxisLabel $Row 'Yellow' 'DarkYellow' 
            }
            elseif ($RangePercent -le 40 -and $RangePercent -ge 1) {
                Write-Graph $YAxisLabelAlphabet $YAxisLabel $Row 'Green' 'DarkYellow'
            }
            else {
                #Write-Host "$YAxisLabel|"
                #Write-Host "$($YAxisLabel.PadLeft($LengthOfMaxYAxisLabel+2))|"
            }
        }
        
    }
    
    # draw bottom boundary
    $XAxisLabel += " " * ($XAxis.Length - $XAxisLabel.Length) # to match x-axis label length with x-axis length
    [String]::Concat($VerticalEdge, $XAxis, "  ", $VerticalEdge) # Prints X-Axis horizontal line
    [string]::Concat($VerticalEdge, $XAxisLabel, "  ", $VerticalEdge) # Prints X-Axis step labels

    
    if (![String]::IsNullOrWhiteSpace($XAxisTitle)) {
        # Position the x-axis label at the center of the axis
        $XAxisTitle = " " * $LengthOfMaxYAxisLabel + (CenterAlignString $XAxisTitle $XAxis.Length)        
        Write-Host $VerticalEdge -NoNewline
        Write-Host $XAxisTitle -ForegroundColor DarkYellow -NoNewline # Prints XAxisTitle
        Write-Host $(" " * $(($LengthOfMaxYAxisLabel + $XAxis.length) - $XAxisTitle.Length - 2)) $VerticalEdge
    }
    
    # bottom boundary
    [string]::Concat($BottomLeft, $([string]$BottomEdge * $BottomBoundaryLength), $BottomRight)
    
}

Function Get-BarPlot {
    [cmdletbinding()]
    [alias("bar")]
    Param(
        # Parameter help description
        [Parameter(Mandatory = $true)]
        [int[]] $Datapoints,
        [int] $StartOfRange,
        [int] $EndofRange,
        [int] $Step = 10
    )
    $Difference = $EndofRange - $StartOfRange

    $NumOfDatapoints = $Datapoints.Count
    $HalfStep = [Math]::Ceiling($Step / 2)
    $Marker = [char] 9608

    # Create a 2D Array to save datapoints  in a 2D format
    $NumOfRows = $difference / ($Step) + 1
    $Array = New-Object 'object[,]' $NumOfRows, $NumOfDatapoints

    For ($i = 0; $i -lt $Datapoints.count; $i++) {
        # Fit datapoint in a row, where, a row's data range = Total Datapoints / Step
        $RowIndex = [Math]::Ceiling($($Datapoints[$i] - $StartOfRange) / $Step)
        # use a half marker is datapoint falls in less than equals half of the step
        $HalfMark = $Datapoints[$i] % $Step -in $(1..$HalfStep)
        
        if ($HalfMark) {
            $Array[($RowIndex), $i] = [char] 9604
        }
        else {
            $Array[($RowIndex), $i] = $Marker
        }
        
        # To get a bar fill all the same row indices of 2D array under and including datapoint
        For ($j = 0; $j -lt $RowIndex; $j++) {
            $Array[$j, $i] = $Marker
        }
    }

    # return the 2D array of plots
    return , $Array
}
Function Get-LinePlot {
    [cmdletbinding()]
    [alias("line")]
    Param(
        # Parameter help description
        [Parameter(Mandatory = $true)]
        [int[]] $Datapoints,
        [int] $StartOfRange,
        [int] $EndofRange,
        [int] $Step = 10
    )
    $Difference = $EndofRange - $StartOfRange
    $NumOfDatapoints = $Datapoints.Count

    
    # Create a 2D Array to save datapoints  in a 2D format
    $NumOfRows = $difference / ($Step) + 1
    $Array = New-Object 'object[,]' $NumOfRows, $NumOfDatapoints

    $Marker = [char] 9608
    $Line = [char] 9616

    For ($i = 0; $i -lt $Datapoints.count; $i++) {
        # Fit datapoint in a row, where, a row's data range = Total Datapoints / Step
        $RowIndex = [Math]::Ceiling($($Datapoints[$i] - $StartOfRange) / $Step) 
        $RowIndexNextItem = [Math]::Ceiling($($Datapoints[$i + 1] - $StartOfRange) / $Step)

        # to decide the direction of line joining two data points
        if ($RowIndex -gt $RowIndexNextItem) {
            Foreach ($j in $($RowIndex - 1)..$($RowIndexNextItem + 1)) {
                $Array[$j, $i] = $Line # add line
            }
        }
        elseif ($RowIndex -lt $RowIndexNextItem) {
            Foreach ($j in $($RowIndex)..$($RowIndexNextItem - 1)) {
                $Array[$j, $i] = $Line # add line
            }
        }
        $Array[$RowIndex, $i] = [char] $Marker # data point
    }
    # return the 2D array of plots
    return , $Array
}
Function Get-ScatterPlot {
    [cmdletbinding()]
    [alias("scatter")]
    Param(
        # Parameter help description
        [Parameter(Mandatory = $true)]
        [int[]] $Datapoints,
        [int] $StartOfRange,
        [int] $EndofRange,
        [int] $Step = 10
        #[ValidateSet("square","dot","triangle")] [String] $Marker = 'dot'
    )

    # Create a 2D Array to save datapoints  in a 2D format
    $Difference = $EndofRange - $StartOfRange
    $NumOfRows = $difference / ($Step) + 1
    $NumOfDatapoints = $Datapoints.Count
    $Array = New-Object 'object[,]' ($NumOfRows), $NumOfDatapoints


    For ($i = 0; $i -lt $Datapoints.count; $i++) {
        # Fit datapoint in a row, where, a row's data range = Total Datapoints / Step
        $RowIndex = [Math]::Ceiling($($Datapoints[$i] - $StartOfRange) / $Step) 

        # use a half marker is datapoint falls in less than equals half of the step
        $LowerHalf = $Datapoints[$i] % $Step -in $(1..$HalfStep)
        
        if ($LowerHalf) {
            $Array[$RowIndex, $i] = [char] 9604
        }
        else {
            $Array[$RowIndex, $i] = [char] 9600
        }
        
    }

    # return the 2D array of plots
    return , $Array
}
Function CenterAlignString ($String, $Length) {
    $Padding = [math]::Round( $Length / 2 + [math]::round( $String.length / 2)  )
    return $String.PadLeft($Padding)
}
Function CenterAlignStringReturnIndices ($String, $Length) {
    $StartIdx = [Math]::Round(($Length + ($String.Length - 1)) / 2 )
    $EndIdx = $StartIdx - ($String.Length - 1)
    return $StartIdx, $EndIdx
}

Function Write-Graph($YAxisLabelAlphabet, $YAxisLabel, $Row, $RowColor, $LabelColor) {
    Write-Host $([char]9474) -NoNewline
    Write-Host $YAxisLabelAlphabet -ForegroundColor $LabelColor -NoNewline
    Write-Host "$($YAxisLabel.tostring().PadLeft($LengthOfMaxYAxisLabel+2) + [Char]9508)" -NoNewline
    ##Write-Host "$YAxisLabel|" -NoNewline
    Write-Host $Row -ForegroundColor $RowColor -NoNewline
    Write-Host " " $([char]9474) 
}
#################################################################################################################################################################
Function Get-ExtIP {
    Write-log "Function: $($MyInvocation.Mycommand)"
    ${global:EXTIP} = If ((((${global:EXTIP} = (Resolve-DnsName -Name o-o.myaddr.l.google.com  -Server 8.8.8.8 -DnsOnly TXT).Strings).Count) -gt 1) -or ($extip -notmatch $ipv4)) { (Invoke-WebRequest "http://ifconfig.me/ip" -UseBasicParsing -ea SilentlyContinue ).Content } Else { $extip[0] }
}
Function Get-GithubRestAPI {
    param ($owner, $repo) 
    Write-log "Function: $($MyInvocation.Mycommand)"
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    $githubrepo = iwr "https://api.github.com/repos/$owner/$repo/releases" -Method Get -Headers @{'Accept' = 'application/vnd.github.v3+json' }
    If (!$?) {
        Write-log "Get-GithubRestAPI: Repo Request failed"
        return
    }
    If ($githubrepo) {
        $githubrepoJSON = $githubrepo.Content | ConvertFrom-Json
    }
    Else {
        Write-log "Get-GithubRestAPI: Repo convert from json failed"
        return
    }
    if ($githubrepoJSON.assets.browser_download_url -like "*zip*" ) {
        $global:githubrepoziplink = ($githubrepoJSON.assets.browser_download_url | select-string -SimpleMatch "zip" |  Select-String -NotMatch "Linux" | select -Index 0).Line
    }
    # if ( $githubrepoJSON | select zipball_url) {
    #     $global:githubrepoziplink = ($githubrepoJSON | select zipball_url | select -Index 0).zipball_url
    # }
    Else {
        Write-log "Get-GithubRestAPI: No zip download link found"
        return
    }
    if ($githubrepoJSON.assets.name) {
        $global:githubrepozipname = ($githubrepoJSON.assets.name  | select-string -SimpleMatch "zip" |  Select-String -NotMatch "Linux" | select -Index 0).Line
    } 
    Else {
        Write-log "Get-GithubRestAPI: No zip download file found"
        return
    }
    If ($githubrepozipname) {
        $global:githubrepofolder = $githubrepozipname.Replace('.zip', '')
    }
    Else {
        Write-log "Get-GithubRestAPI: No zip file found"
        return
    }
    #    iwr $githubrepoziplink -O $githubrepozipname
    #If (!$?) {
    #    Write-log "Get-GithubRestAPI: Repo WebRequest failed"
    #    return
    #}
}
Function Add-Modtolist {
    param($modname, $modfile)
    Write-log "Function: $($MyInvocation.Mycommand)"
    if (!$installedmods) {
        Write-log "Create Mods object"
        #$installedmods = @()
        $script:installedmods = New-Object -TypeName psobject
    }
    # $installedmods += New-Object pscustomobject -Property @{"$modname" = "$modfile" }
    Write-log "Add Object $modname = $modfile"
    $installedmods | Add-Member -MemberType NoteProperty -Name $modname -Value $modfile
    
}
Function Get-installedMods {    
    Write-log "Function: $($MyInvocation.Mycommand)"
    If (Test-Path "$serverdir\mods.json") {
        $script:installedmods = Get-Content -Path $serverdir\mods.json | ConvertFrom-Json
    }
    Else {
        Write-log "No $serverfiles\mod.json found"
    }
}
Function New-modlist {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($installedmods) {
        If ($mods.Mods) {
            $mods | ConvertTo-Json | Set-Content -Path $serverdir\mods.json -Force
            Write-log "Edit mods.mods $($mods.Mods) mods.json"
        }
        ElseIf ($installedmods.Mods) {
            $installedmods | ConvertTo-Json | Set-Content -Path $serverdir\mods.json -Force
            Write-log "Edit mods.mods $($installedmods.Mods) mods.json"
        }
        Else {
            $script:mods = @{ Mods = $installedmods };
            $mods | ConvertTo-Json | Set-Content -Path $serverdir\mods.json -Force
            Write-log "New $mods mods.json"
        }
    }
}
Function Edit-Modlist {
    Param($modname, $modfile)
    Write-log "Function: $($MyInvocation.Mycommand)"
    If (Test-Path $serverdir\mods.json) {
        If ($installedmods) {
            #            If ($($installedmods.Mods) -like "*$modname*") {
            #                $($installedmods.Mods).$modname = "$modfile"
            If ($installedmods.Mods -like "*$modname*") {
                $installedmods.Mods.$modname = "$modfile"
                write-log "Edit-Member $($installedmods.Mods).$modname"
            }
            Else {
                if ($mods.Mods) {
                    $mods.Mods | Add-Member -MemberType NoteProperty -Name $modname -Value $modfile
                    write-log "Add-Member $($script:mods.Mods)"
                }
                Else {
                    if ($installedmods.Mods) {
                        $installedmods.Mods | Add-Member -MemberType NoteProperty -Name $modname -Value $modfile
                        write-log "Add-Member $($script:installedmods.Mods)"
                    }
                }
            }
        }
    }
    Else {
        Add-Modtolist $modname $modfile
    }
    New-modlist
}

Function Compare-Modlist {
    Param($modname, $modfile)
    Write-log "Function: $($MyInvocation.Mycommand)"
    Write-log " Param($modname, $modfile)"
    If (Test-Path $serverdir\mods.json) {
        Get-installedMods
        Write-log "($($installedmods.Mods.$modname) -eq $modfile)"
        If ($installedmods.Mods.$modname -eq $modfile) {
            write-log "No Mod udpate"
            $script:nomodupdate = $true
        } 
        ELse {
            $script:nomodupdate = $false
        }
    }
}

Function start-pode {
    Write-log "Function: $($MyInvocation.Mycommand)"
    $config = (gc config.json) | ConvertFrom-Json 
    $t = $null
    Do {
        $t++
        Write-log "Waiting for Port $($config.server.webport) to become available"
        start-sleep 3
        If ($t -eq 10) {
            Write-log "Failed: Port $($config.server.webport) not available. "
            Write-log "Recommend Reboot "
            return
        }
    } While ( $((Get-NetTCPConnection -LocalPort $config.server.webport).OwningProcess))
    # (Get-NetTCPConnection -LocalPort $config.server.webport).OwningProcess
    sajb -Name 'Pode' -ScriptBlock { param($podedirectory)
        Start-Process -FilePath PowerShell -ArgumentList "-Command Import-Module $podedirectory\Pode.psm1; pode start  "
    } -ArgumentList $podedirectory      
    sajb -Name 'DiscordJS' -ScriptBlock {
        Start-Process -FilePath PowerShell -ArgumentList "-Command node discord_bot.js "
    }
}
# Function stop-pode {
#     if ($(get-Job Pode).Name -eq 'Pode') {
#         Receive-Job Pode
#         stop-job Pode
#         remove-job Pode
#     }
#     if ($(get-Job DiscordJS).Name -eq 'DiscordJS') {
#         Receive-Job DiscordJS
#         stop-job DiscordJS
#         remove-job DiscordJS
#     }
# }
