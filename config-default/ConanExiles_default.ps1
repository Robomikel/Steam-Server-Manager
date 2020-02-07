Function New-LaunchScriptceserverPS {
    # Conan: Exiles Dedicated server
    # APP ID # 443030        
    #  http://cdn.funcom.com/downloads/exiles/DedicatedServerLauncher1044.exe
    $global:MODDIR = ""
    $global:EXE = "ConanSandboxServer"
    $global:EXEDIR = ""
    $global:GAME = "conanexiles"
    $global:PROCESS = "ConanSandboxServer-Win64-Test"
    $global:SERVERCFGDIR = "ConanSandbox\Saved\Config\WindowsServer"
    Get-StopServerInstall
    Write-Host '*** Configure Instance *****' -ForegroundColor Yellow -BackgroundColor Black
    Write-Host '*** N+1 PORTS 7777,27015 - 7778,27016 - etc.. *****' -ForegroundColor Yellow -BackgroundColor Black
    if (($global:PORT = Read-Host -Prompt (Write-Host "Input Server Port,Press enter to accept default value [7777]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:PORT = "7777" }else { $global:PORT }
    if (($global:QUERYPORT = Read-Host -Prompt  (Write-Host "Input Server Query Port, Press enter to accept default value [27015]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:QUERYPORT = "27015" }else { $global:QUERYPORT }
    Write-Host 'Input hostname: ' -ForegroundColor Cyan -NoNewline
    $global:HOSTNAME = Read-host
    if (($global:MAXPLAYERS = Read-Host -Prompt (Write-Host "Input maxplayers, Press enter to accept default value [50]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:MAXPLAYERS = "50" }else { $global:MAXPLAYERS }
    Write-Host 'Input SERVER PASSWORD: ' -ForegroundColor Cyan -NoNewline
    $global:SERVERPASSWORD = Read-host
    if (($global:ADMINPASSWORD = Read-Host -Prompt (Write-Host "Input ADMIN password Alpha Numeric:, Press enter to accept Random String value [$global:RANDOMPASSWORD]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:ADMINPASSWORD = "$global:RANDOMPASSWORD" }else { $global:ADMINPASSWORD }
    if (($global:RCONPORT = Read-Host -Prompt (Write-Host "Input Server Rcon Port,Press enter to accept default value [27103]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:RCONPORT = "27103" }else { $global:RCONPORT }
    $global:RANDOMPASSWORD = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 11 | ForEach-Object { [char]$_ })
    if (($global:RCONPASSWORD = Read-Host -Prompt (Write-Host "Input RCON password Alpha Numeric:, Press enter to accept Random String value [$global:RANDOMPASSWORD]: "-ForegroundColor Cyan -NoNewline)) -eq '') { $global:RCONPASSWORD = "$global:RANDOMPASSWORD" }else { $global:RCONPASSWORD }
    Write-Host "***  Editing Default Engine.ini   ***" -ForegroundColor Magenta -BackgroundColor Black
    Add-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\Engine.ini -Value "ServerPassword=$global:SERVERPASSWORD"
    Add-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\Engine.ini -Value "ServerName=$global:HOSTNAME"
    Write-Host "***  Editing Default ServerSettings.ini   ***" -ForegroundColor Magenta -BackgroundColor Black
    Add-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\ServerSettings.ini -Value "AdminPassword=$global:ADMINPASSWORD"
    $global:launchParams = '@("$global:EXE -log  -MaxPlayers=${global:MAXPLAYERS} -Port=${global:PORT} -QueryPort=${global:QUERYPORT} -RconEnabled=1 -RconPassword=${global:RCONPASSWORD} -RconPort=${global:RCONPORT}")'
}