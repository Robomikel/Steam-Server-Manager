Function New-LaunchScriptceserverPS {
    # Conan: Exiles Dedicated server
    # APP ID # 443030        
    #  http://cdn.funcom.com/downloads/exiles/DedicatedServerLauncher1044.exe
    ################## Change Default Variables ################# 
    #'*** N+1 PORTS 7777,27015 - 7778,27016 - etc.. *****'
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Maxplayers
    $global:maxplayers      = "50"
    #                       Server Password
    $global:serverpassword  = ""
    #                       Admin Password
    $global:adminpassword   = "$global:RANDOMPASSWORD"
    #                       Rcon Port
    $global:rconport        = "27103"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    ###########################/\#################################
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "ConanSandboxServer"
    $global:executabledir = ""
    $global:querytype = "conanexiles"
    $global:process = "ConanSandboxServer-Win64-Test"
    $global:servercfgdir = "ConanSandbox\Saved\Config\WindowsServer"
    $global:logdir = ""

    
    Get-StopServerInstall
    Write-Host "***  Editing Default Engine.ini   ***" -ForegroundColor Magenta -BackgroundColor Black
    Add-Content -Path $currentdir\$serverfiles\$servercfgdir\Engine.ini -Value "ServerPassword=$SERVERPASSWORD"
    Add-Content -Path $currentdir\$serverfiles\$servercfgdir\Engine.ini -Value "ServerName=$hostname"
    Write-Host "***  Editing Default ServerSettings.ini   ***" -ForegroundColor Magenta -BackgroundColor Black
    Add-Content -Path $currentdir\$serverfiles\$servercfgdir\ServerSettings.ini -Value "AdminPassword=$ADMINPASSWORD"
    $global:launchParams = '@("$executable -log  -MaxPlayers=${maxplayers} -Port=${port} -QueryPort=${QUERYPORT} -RconEnabled=1 -RconPassword=${RCONPASSWORD} -RconPort=${RCONPORT}")'
}