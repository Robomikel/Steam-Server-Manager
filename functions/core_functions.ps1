Function Get-CreatedVaribles {
    Write-Host "****   Getting Server Variables   *****" -F Y -B Black  
    .$global:currentdir\$global:server\Variables-$global:server.ps1
    Get-CheckForError
}
Function Get-ClearVariables {
    Write-Host "****   Clearing Variables   *****" -F Y -B Black
    $global:vars = "PROCESS", "IP", "PORT", "SOURCETVPORT", "CLIENTPORT", "MAP", "TICKRATE", "GSLT", "MAXPLAYERS", "WORKSHOP", "HOSTNAME", "QUERYPORT", "SAVES", "APPID", "RCONPORT", "RCONPASSWORD", "SV_PURE", "SCENARIO", "GAMETYPE", "GAMEMODE", "MAPGROUP", "WSCOLLECTIONID", "WSSTARTMAP", "WSAPIKEY", "WEBHOOK", "EXEDIR", "GAME", "SERVERCFGDIR", "gamedirname", "config1", "config2", "config3", "config4", "config5", "MODDIR", "status", "CpuCores", "cpu", "avmem", "totalmem", "mem", "backups", "backupssize", "stats", "gameresponse", "os", "results,", "disks", "computername", "ANON", "ALERT", "launchParams", "COOPPLAYERS", "SV_LAN", "DIFF", "GALAXYNAME", "ADMINPASSWORD", "username", "LOGDIR"
    Foreach ($global:vars in $global:vars) {
        Clear-Variable $global:vars -Scope Global -ea SilentlyContinue
        Remove-Variable $global:vars -Scope Global -ea SilentlyContinue
    }
}

Function Get-TestInterger {
    If ( $global:APPID -notmatch '^[0-9]+$') { 
        Write-Host "$global:DIAMOND $global:DIAMOND Input App ID Valid Numbers only! $global:DIAMOND $global:DIAMOND" -F R -B Black
        pause
        Exit
    }
}
Function Get-TestString {
    If ( $global:server -notmatch "[a-z,A-Z]") { 
        Write-Host "$global:DIAMOND $global:DIAMOND Input Alpha Characters only! $global:DIAMOND $global:DIAMOND" -F R -B Black
        pause
        Exit
    }
}




Function Set-Console {
    Clear-Host
    $host.ui.RawUi.WindowTitle = "-------- STEAMER ------------"
    [console]::ForegroundColor = "Green"
    [console]::BackgroundColor = "Black"
    [console]::WindowWidth = 150; [console]::WindowHeight = 125; [console]::BufferWidth = [console]::WindowWidth
    #$host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(200,5000)
    If ($global:admincheckmessage -eq "1") {
        Get-AdminCheck
        Get-Logo
    }
    Else {
        Get-Logo
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
    If ($null -eq $global:command) {
        Select-Steamer 
    }
    else {
        Select-Steamer $global:command $global:server
    }
}
Function Set-VariablesPS {
    Write-Host "***  Creating Variables and adding launch params  ***" -F M -B Black
    New-Item $global:currentdir\$global:server\Variables-$global:server.ps1 -Force
}

Function Get-Savelocation {
    If (("" -eq $global:saves) -or ($null -eq $global:saves )) {
        Write-Host "****   No saves located in App Data   ****" -F Y -B Black 
    }
    Else {
        New-AppDataSave
    }
}
Function Select-RenameSource {
    Write-Host "***  Renaming srcds.exe to $global:EXE to avoid conflict with local source Engine (srcds.exe) server  ***" -F M -B Black
    Rename-Item  "$global:currentdir\$global:server\$global:EXEDIR\srcds.exe" -NewName "$global:currentdir\$global:server\$global:EXEDIR\$global:EXE.exe" >$null 2>&1
    Rename-Item  "$global:currentdir\$global:server\$global:EXEDIR\srcds_x64.exe" -NewName "$global:currentdir\$global:server\$global:EXEDIR\$global:EXE-x64.exe" >$null 2>&1
}
Function Select-EditSourceCFG {
    Write-Host "***  Editing Default server.cfg  ***" -F M -B Black
    ((Get-Content  $global:currentdir\$global:server\$global:SERVERCFGDIR\$global:config1 -Raw) -replace "\bSERVERNAME\b", "$global:HOSTNAME") | Set-Content  $global:currentdir\$global:server\$global:SERVERCFGDIR\$global:config1
    ((Get-Content  $global:currentdir\$global:server\$global:SERVERCFGDIR\$global:config1 -Raw) -replace "\bADMINPASSWORD\b", "$global:RCONPASSWORD") | Set-Content  $global:currentdir\$global:server\$global:SERVERCFGDIR\$global:config1 -ea SilentlyContinue
}
Function New-ServerLog {
    $logdirectory = "$global:currentdir\$global:server\$global:LOGDIR"
    If ($global:log -eq "1") { Copy-Item "$logdirectory\[cs]*.log" -Destination "$global:currentdir\log\$global:server-$global:date.log" -ea SilentlyContinue }
    Get-Childitem $global:currentdir\log\ -Recurse | where-object name -like Steamer-*.log | Sort-Object CreationTime -desc | Select-Object -Skip $global:logcount | Remove-Item -Force -ea SilentlyContinue
    Get-Childitem $global:currentdir\log\ -Recurse | where-object name -like $global:server-*.log | Sort-Object CreationTime -desc | Select-Object -Skip $global:logcount | Remove-Item -Force -ea SilentlyContinue
}

Function Get-Appid {

    $searchTerm = "\b$global:server\b"
    $results = Get-Content -path $global:currentdir\data\serverlist.csv  | Select-String  -Pattern $searchTerm
    $results = "`"$results`""
    $results = $results.Split(",")[3]
    $global:AppID = "$results"
    $global:AppID

    If (($null -eq $global:AppID) -or ("" -eq $global:AppID)){
        Write-Host 'Input Steam Server App ID: ' -F C -N 
        $global:AppID = Read-host
        Write-Host 'Add Argument?, -beta... or leave Blank for none: ' -F C -N 
        $global:Branch = Read-host
        Get-TestInterger
    }
}