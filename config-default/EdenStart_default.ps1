Function New-LaunchScriptEdenStartPS {
    # Eden Star Dedicated Server
    # APP ID # 419790
    # https://steamcommunity.com/sharedfiles/filedetails/?id=558853246
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27017"
    #                       Rcon Port
    $global:rconport        = "27020"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    #                       Server Password
    $global:serverpassword  = " "
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################
    # Example of saving every 5 minutes :
    # <install_dir>\EdenGameServer.exe -ServerAutoSaveInterval=300

    # Example of use loading from slot :
    # <install_dir>\EdenGameServer.exe -ServerLoadSlot=4
    
    # If you are still having problems then it might be something to do with the server exe not being able to locate the steam client dlls on the server machine. 
    # A way to remedy this until we get a fix in place is to copy the .dll\ files from
    # Engine/Binaries/ThirdParty/Steamworks/Steamv132
    # to 
    # EdenGame/Binaries/Win64

    # -RCONPort=8890 -RCONPassword="<MyRCONPassword>" 
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\EdenGame\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "EdenGameServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\EdenGame\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "EdenGameServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\EdenGame\Saved\Logs"
    #                       Server Log
    $global:consolelog      = "EdenGame.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = ""
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -log -multihome=${ip} -Port=${port} -QueryPort=${queryport} -ServerMaxPlayers=${maxplayers} -ServerName=${hostname} -ServerPassword=${serverpassword} -RCONPort=${rconport} -RCONPassword=$rconpassword")'
      # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
} 