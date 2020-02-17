Function New-LaunchScriptSEserverPS {
    # Space Engineers Dedicated Server
    # 298740
    # https://www.spaceengineersgame.com/dedicated-servers.html
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP} = "${global:IP}"
    #                       Server Port
    ${global:PORT} = "27015"
    #                       Maxplayers
    $global:MAXPLAYERS = "20"

  
    ##############################/\##############################
    
   # You can run SpaceEngineersDedicated.exe with the following arguments
   # -console: skips instance selection dialog, dedicated server configuration dialog, and goes directly to console application
   #  -noconsole: will run without black console window
   # -path: will load config and store all files in path specified ("D:\Whatever\Something" in example)
   #  -ignorelastsession: ignores last automatic save of the world and uses values from config file
   #  -maxPlayers : overrides maximum players that can be in session
   # -ip:  overrides ip address of dedicated server stored in config file
   #  -port: overrides port value stored in config file

   # taskkill /IM SpaceEngineersDedicated.exe
   # This will stop the dedicated server correctly, saving the world etc.
   # To stop it immediately add argument "/f", which will kill the server without asking to stop and without saving the world.
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXEDIR = "DedicatedServer64"
    $global:EXE = "SpaceEngineersDedicated"
    $global:GAME = "protocol-valve"
    $global:SAVES = ""
    $global:PROCESS = "SpaceEngineersDedicated"
    $global:SERVERCFGDIR = ""
    $global:LOGDIR = ""
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = ""
    $global:config1 = ""
    # Get-Servercfg
    # Select-RenameSource
    # game config
    # Select-EditSourceCFG
    $global:launchParams = '@(""$global:EXEDIR\$global:EXE -console -ip ${global:IP} -port ${global:PORT} -maxPlayers $global:MAXPLAYERS")'
}   