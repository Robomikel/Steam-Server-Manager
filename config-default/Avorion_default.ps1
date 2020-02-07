Function  New-LaunchScriptavserverPS {
        # Avorion Dedicated Server
        # APP ID # 565060  
        $global:MODDIR = ""
        $global:EXE = "AvorionServer"
        $global:EXEDIR = "bin"
        $global:GAME = "protocol-valve"
        $global:SAVES = "Avorion"
        $global:PROCESS = "AvorionServer"
        Get-StopServerInstall
        Write-Host '*** Configure Instance *****' -ForegroundColor Yellow -BackgroundColor Black
        Write-Host 'Input server name: ' -ForegroundColor Cyan -NoNewline
        $global:HOSTNAME = Read-host
        Write-Host 'Input galaxy name: ' -ForegroundColor Cyan -NoNewline
        $global:GALAXYNAME = Read-host
        Write-Host "Enter Admin Steam ID64  for admin: " -ForegroundColor Cyan -BackgroundColor Black
        $global:steamID64 = Read-Host
        if (($global:DIFF = Read-Host -Prompt (Write-Host "Input Difficulty (-3 - 3), Press enter to accept default value [0]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:DIFF = "0" }else { $global:DIFF }
        if (($global:MAXPLAYERS = Read-Host -Prompt (Write-Host "Input Server Maxplayers, Press enter to accept default value [10]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:MAXPLAYERS = "10" }else { $global:MAXPLAYERS } 
        $global:launchParams = '@("$global:EXEDIR\$global:EXE --server-name `"${global:HOSTNAME}`" --admin ${$global:steamID64} --galaxy-name ${global:GALAXYNAME} --difficulty ${global:DIFF} --max-players ${global:MAXPLAYERS}")'
}