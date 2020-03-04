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
    $global:hostname        = "SERVERNAME"
    #                       Maxplayers
    $global:maxplayers      = "50"
    #                       Server Password
    $global:serverpassword  = ""
    #                       Admin Password
    $global:adminpassword   = "$RANDOMPASSWORD"
    #                       Rcon Port
    $global:rconport        = "27103"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    ###########################/\#################################

    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\ConanSandbox\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "ConanSandboxServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "conanexiles"
    #                       Game Process
    $global:process         = "ConanSandboxServer-Win64-Test"
    #                       Log Directory 
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog             = "ConanSandbox.log"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -log  -MaxPlayers=${maxplayers} -Port=${port} -QueryPort=${queryport} -RconEnabled=1 -RconPassword=${rconpassword} -RconPort=${rconport}")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Install Adjustment
    Set-Location $serverdir
    Start-Process cmd "/c StartServer.bat"
    Start-Sleep 3
    Get-StopServer
    Add-Content $ssmlog "[$logdate] Editing Default Engine.ini "
    Add-Content -Path $servercfgdir\Engine.ini -Value "ServerPassword=$SERVERPASSWORD"
    Add-Content -Path $servercfgdir\Engine.ini -Value "ServerName=$hostname"
    Add-Content $ssmlog "[$logdate] Editing Default ServerSettings.ini"
    Add-Content -Path $servercfgdir\ServerSettings.ini -Value "AdminPassword=$ADMINPASSWORD"
    Set-Location $currentdir
}