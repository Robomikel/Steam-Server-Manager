Function New-LaunchScriptcsgoserverPS {
        #----------   CSGO Server Install Function   -------------------
        # APP ID # 740
        ################## Change Default Variables #################
        #                       Server IP 
        ${global:IP}            = "${ip}"
        #                       Server Port
        $global:port            = "27015"
        #                       Client Port
        $global:clientport      = "27005"
        #                       Source TV Port
        $global:sourcetvport    = "27020"
        #                       Tickrate
        $global:tcikrate        = "64"
        #                       Game Server Token required for public servers
        $global:gslt            = "GameServerTokenHere"
        #                       Map
        $global:defaultmap      = "de_inferno"
        #                       Maxplayers
        $global:maxplayers      = "32"
        #                       Server Name
        $global:hostname        = "SERVERNAME"
        #                       Rcon Password
        $global:rconpassword    = "$RANDOMPASSWORD"
        #                       Game type
        $global:gametype        = "0"
        #                       Game Mode
        $global:gamemode        = "0"
        #                       Map Group
        $global:mapgroup        = "mg_active"
        ##############################/\##############################
        ############################## Notes ##############################
        # "Get Auth Token from this website https://steamcommunity.com/dev/managegameservers Note use App ID 730: 
        # required for public servers
        #   GameMode and Game Type -
        #"
        #       * Competitive / Scrimmage: +game_type 0 +game_mode 1
        #        * Wingman:              +game_type 0 +game_mode 2
        #        * Custom:               +game_type 3 +game_mode any (?)
        #        * Guardian:             +game_type 4 +game_mode 0
        #        * Co-op Strike:         +game_type 4 +game_mode 1
        #        * Danger Zone:          +game_type 6 +game_mode 0
        #        * Deathmatch:           +game_type 1 +game_mode 2
        #        * Demolition:           +game_type 1 +game_mode 1
        #        * Arms Race:            +game_type 1 +game_mode 0
        #        * Classic Competitive:  +game_type 0 +game_mode 1
        #        * Classic Casual:       +game_type 0 +game_mode 0"
        #"  MAPGROUPS -
        #       * mg_skirmish_demolition                * mg_deathmatch         * mg_skirmish_triggerdiscipline         * mg_active
        #       * mg_skirmish_flyingscoutsman           * mg_op_breakout        * mg_skirmish_headshots                 * mg_casualdelta
        #       * mg_skirmish_stabstabzap               * mg_op_op05            * mg_skirmish_huntergatherers           * mg_casualsigma
        #       * mg_lowgravity                         * mg_op_op06            * mg_skirmish_heavyassaultsuit          * mg_reserves
        #       * mg_demolition                         * mg_op_op07            * mg_skirmish_armsrace                  * mg_hostage
        #       * mg_armsrace                           * mg_op_op08
        
        ###################### Do not change below #####################
        #                       System Directory
        $global:systemdir       = "$serverdir\csgo"
        #                       Server Config Directory
        $global:servercfgdir    = "$serverdir\csgo\cfg"
        #                       Server Executable
        $global:executable      = "csgo"
        #                       Server Executable Directory
        $global:executabledir   = "$serverdir"
        #                       Gamedig Query
        $global:querytype       = "csgo"
        #                       Game Process
        $global:process         = "csgo"
        #                       Log Directory
        $global:logdirectory    = "$serverdir\csgo"
        #                       Game-Server-Config Directory
        $global:gamedirname     = "CounterStrikeGlobalOffensive"
        #                       Game-Server-Config
        $global:servercfg       = "server.cfg"
        #                       Server Launch Command
        $global:launchParams    = '@("$executable -game csgo -console -usercon -strictportbind -ip ${ip} -port ${port} +clientport  ${clientport} +tv_port ${sourcetvport} +sv_setsteamaccount ${gslt} -tickrate ${TICKRATE} +map ${defaultmap} -maxplayers_override ${maxplayers} +mapgroup ${mapgroup} +game_type ${gametype} +game_mode ${gamemode} +host_workshop_collection ${wscollectionid} +workshop_start_map ${wsstartmap} -authkey ${wsapikey} -nobreakpad +net_public_adr ${extip} -condebug")'
          # Get User Input version must be set to 0
        Get-UserInput
        Get-Servercfg
        # Edit Server Game-Server-Config
        Select-EditSourceCFG
        # Rename Source $executable.exe
        Select-RenameSource
        # Install Adjustment
}