#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-CreatedVaribles {
    Write-Host "****   Getting Server Variables   *****" -F Y -B Black  
    .$serverdir\Variables-$serverfiles.ps1
    Get-CheckForError
}
Function Get-ClearVariables {
    Write-Host "****   Clearing Variables   *****" -F Y -B Black
    $vars = "process", "ip", "port", "sourcetvport", "clientport", "defaultmap", "tickrate", "gslt", "maxplayers", "workshop", "hostname", "queryport", "saves", "appid", "rconport", "rconpassword", "sv_pure", "scenario", "gametype", "gamemode", "mapgroup", "wscollectionid", "wsstartmap", "wsapikey", "webhook", "executabledir", "querytype", "servercfgdir", "gamedirname", "servercfg", "config2", "config3", "config4", "config5", "systemdir", "status", "CpuCores", "cpu", "avmem", "totalmem", "mem", "backups", "backupssize", "stats", "gameresponse", "os", "results,", "disks", "computername", "ANON", "ALERT", "launchParams", "coopplayers", "sv_lan", "diff", "galaxyname", "adminpassword", "username", "logdir", "mods", "reg_appID", "wsmods", "servermods", "wsmoddir", "appid", "serverfiles", "logdirectory", "executable","password"
    Foreach ($vars in $vars) {
        Clear-Variable $vars -Scope Global -ea SilentlyContinue
        Remove-Variable $vars -Scope Global -ea SilentlyContinue
    }
}

Function Get-TestInterger {
    If ( $APPID -notmatch '^[0-9]+$') { 
        Write-Host "$DIAMOND $DIAMOND Input App ID Valid Numbers only! $DIAMOND $DIAMOND" -F R -B Black
        pause
        Exit
    }
}
Function Get-TestString {
    If ( $serverfiles -notmatch "[a-z,A-Z]") { 
        Write-Host "$DIAMOND $DIAMOND Input Alpha Characters only! $DIAMOND $DIAMOND" -F R -B Black
        pause
        Exit
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
    If ($null -eq $command) {
        Select-Steamer 
    }
    else {
        Select-Steamer $command $serverfiles
    }
}
Function Set-VariablesPS {
    Write-Host "***  Creating Variables and adding launch params  ***" -F M -B Black
    New-Item $serverdir\Variables-$serverfiles.ps1 -Force
}

Function Get-Savelocation {
    If (("" -eq $saves) -or ($null -eq $saves )) {
        Write-Host "****   No saves located in App Data   ****" -F Y -B Black 
    }
    Else {
        # New-AppDataSave
        New-backupAppdata
    }
}
Function Select-RenameSource {
    Write-Host "***  Renaming srcds.exe to $executable to avoid conflict with local source Engine (srcds.exe) server  ***" -F M -B Black
    Rename-Item  "$executabledir\srcds.exe" -NewName "$executabledir\$executable.exe" >$null 2>&1
    Rename-Item  "$executabledir\srcds_x64.exe" -NewName "$executabledir\$executable-x64.exe" >$null 2>&1
}
Function Select-EditSourceCFG {
    Write-Host "***  Editing Default server.cfg  ***" -F M -B Black
    ((Get-Content  $servercfgdir\$servercfg -Raw) -replace "\bSERVERNAME\b", "$HOSTNAME") | Set-Content  $servercfgdir\$servercfg
    ((Get-Content  $servercfgdir\$servercfg -Raw) -replace "\bADMINPASSWORD\b", "$RCONPASSWORD") | Set-Content  $servercfgdir\$servercfg -ea SilentlyContinue
}
Function New-ServerLog {
    If ($consolelogging -eq "on") { Copy-Item "$logdirectory\[csg]*.log", "$logdirectory\[i]*.log" -Destination "$currentdir\log\$serverfiles-$date.log" -ea SilentlyContinue }
    If (($AppID -eq 294420) -and ($consolelogging -eq "on")) { Copy-Item "$logdirectory\[s]*.log" -Destination "$currentdir\log\$serverfiles-$date.log" -ea SilentlyContinue }
    If (($AppID -eq 233780) -and ($consolelogging -eq "on")) { Copy-Item "$logdirectory\$server_*.rpt" -Destination "$currentdir\log\$serverfiles-$date.log" -ea SilentlyContinue }
    If (($AppID -eq 298740) -and ($consolelogging -eq "on")) { Copy-Item "$logdirectory\[s]*.log" -Destination "$currentdir\log\$serverfiles-$date.log" -ea SilentlyContinue }
    If (($AppID -eq 367970) -and ($consolelogging -eq "on")) { Copy-Item "$logdirectory\[m]*.log" -Destination "$currentdir\log\$serverfiles-$date.log" -ea SilentlyContinue }
    If (($AppID -eq 748090) -and ($consolelogging -eq "on")) { Copy-Item "$logdirectory\[1-9]*.txt" -Destination "$currentdir\log\$serverfiles-$date.log" -ea SilentlyContinue }
    If (($AppID -eq 299310) -and ($consolelogging -eq "on")) { Copy-Item "$logdirectory\*.log" -Destination "$currentdir\log\$serverfiles-$date.log" -ea SilentlyContinue }
    If (($AppID -eq 1110390) -and ($consolelogging -eq "on")) { Copy-Item "$logdirectory\Server_$HOSTNAME.log" -Destination "$currentdir\log\$serverfiles-$date.log" -ea SilentlyContinue }
    If (($AppID -eq 1222650) -and ($consolelogging -eq "on")) { Copy-Item "$logdirectory\[o]*.txt" -Destination "$currentdir\log\$serverfiles-$date.log" -ea SilentlyContinue }
    If (($AppID -eq 565060) -and ($consolelogging -eq "on")) { Copy-Item "$logdirectory\[s]*.txt" -Destination "$currentdir\log\$serverfiles-$date.log" -ea SilentlyContinue }
    # Get-Childitem $currentdir\log\ssm\ -Recurse | where-object name -like Steamer-*.log | Sort-Object CreationTime -desc | Select-Object -Skip $consolelogcount | Remove-Item -Force -ea SilentlyContinue
    # "$logdirectory\[so]*.txt",
    # If ($ssmlogging -eq "on") { Get-Childitem $currentdir\log\ -Recurse | where-object name -like $serverfiles-*.log | Sort-Object CreationTime -desc | Select-Object -Skip $ssmlogcount | Remove-Item -Force -ea SilentlyContinue }
}

Function Remove-SteamerLogs {
    Get-Childitem $ssmlogdir -Recurse | where-object name -like Steamer-*.log | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
}
Function New-ServerBackupLog {
    If ($backuplogs -eq "on") { Copy-Item "$sevenzipdirectory\[b]*.log", -Destination "$logdir\backup_$serverfiles-$date.log" -ea SilentlyContinue }
    Get-Childitem $logdir -Recurse | where-object name -like backup_$serverfiles-*.log | Sort-Object CreationTime -desc | Select-Object -Skip "$consolelogcount" | Remove-Item -Force -ea SilentlyContinue
}

Function Get-Appid {

    $searchTerm = "\b$serverfiles\b"
    $results = Get-Content -path $serverlistdir\serverlist.csv | Select-String  -Pattern $searchTerm
    $results = "`"$results`""
    $results = $results.Split(",")[3]
    $global:AppID = "$results"
    If (($null -eq $AppID) -or ("" -eq $AppID)) {
        Write-Host 'Input Steam Server App ID: ' -F C -N 
        $global:AppID = Read-host
        Write-Host 'Add Argument?, -beta... or leave Blank for none: ' -F C -N 
        $global:Branch = Read-host
        Get-TestInterger
    }
    Else { 
        Write-Host "        App ID: $AppID" -F Y
    }
    If (( $AppID -eq 985050) -or ($AppID -eq 233780)) {
        Write-Host "****   Requires Steam Login    *****" -F Y
    }
}

Function Get-MCBRWebrequest {
    # get latest download
    $global:mcbrWebResponse = ((Invoke-WebRequest "https://www.minecraft.net/en-us/download/server/bedrock/" -UseBasicParsing).Links | Where-Object { $_.href -like "https://minecraft.azureedge.net/bin-win/*" })
}
Function Get-MCWebrequest {
    # check latest version
    $mcvWebResponse = Invoke-WebRequest "https://launchermeta.mojang.com/mc/game/version_manifest.json" -UseBasicParsing | ConvertFrom-Json
    $global:mcvWebResponse = $mcvWebResponse.Latest.release
}
Function Get-SourceMetaModWebrequest {
    $mmWebResponse = Invoke-WebRequest "https://mms.alliedmods.net/mmsdrop/$metamodmversion/mmsource-latest-windows" -UseBasicParsing -ea SilentlyContinue
    $mmWebResponse = $mmWebResponse.content
    $global:metamodurl = "https://mms.alliedmods.net/mmsdrop/$metamodmversion/$mmWebResponse"

    $smWebResponse = Invoke-WebRequest "https://sm.alliedmods.net/smdrop/$sourcemodmversion/sourcemod-latest-windows" -UseBasicParsing -ErrorAction SilentlyContinue
    $smWebResponse = $smWebResponse.content
    $global:sourcemodurl = "https://sm.alliedmods.net/smdrop/$sourcemodmversion/$smWebResponse"
}

Function Get-PreviousInstall {
    If (!(Test-Path $currentdir\$serverfiles\Variables-*.ps1)) { }Else {
        $check = (Get-Childitem $currentdir\$serverfiles\ | Where-Object { $_.Name -like 'Variables-*' } -ea SilentlyContinue)
        If ($null -ne $check ) {
            Get-createdvaribles
            Get-StopServerInstall
            Get-ClearVariables
        }
    }
}
