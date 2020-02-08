Function New-LaunchScriptceserverPS {
    # Conan: Exiles Dedicated server
    # APP ID # 443030        
    #  http://cdn.funcom.com/downloads/exiles/DedicatedServerLauncher1044.exe
    ################## Change Default Variables ################# 
    #'*** N+1 PORTS 7777,27015 - 7778,27016 - etc.. *****'
    #                       Server Port
    $global:PORT            = "7777"
    #                       Query Port
    $global:QUERYPORT       = "27015"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Maxplayers
    $global:MAXPLAYERS      = "50"
    #                       Server Password
    $global:SERVERPASSWORD  = ""
    #                       Admin Password
    $global:ADMINPASSWORD   = "$global:RANDOMPASSWORD"
    #                       Rcon Port
    $global:RCONPORT        = "27103"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
    ###########################/\#################################
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "ConanSandboxServer"
    $global:EXEDIR = ""
    $global:GAME = "conanexiles"
    $global:PROCESS = "ConanSandboxServer-Win64-Test"
    $global:SERVERCFGDIR = "ConanSandbox\Saved\Config\WindowsServer"
    $global:ANON = "yes"
    $global:username = ""
    Get-StopServerInstall
    Write-Host "***  Editing Default Engine.ini   ***" -ForegroundColor Magenta -BackgroundColor Black
    Add-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\Engine.ini -Value "ServerPassword=$global:SERVERPASSWORD"
    Add-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\Engine.ini -Value "ServerName=$global:HOSTNAME"
    Write-Host "***  Editing Default ServerSettings.ini   ***" -ForegroundColor Magenta -BackgroundColor Black
    Add-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\ServerSettings.ini -Value "AdminPassword=$global:ADMINPASSWORD"
    $global:launchParams = '@("$global:EXE -log  -MaxPlayers=${global:MAXPLAYERS} -Port=${global:PORT} -QueryPort=${global:QUERYPORT} -RconEnabled=1 -RconPassword=${global:RCONPASSWORD} -RconPort=${global:RCONPORT}")'
}