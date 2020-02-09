Function New-LaunchScriptcsgoserverPS {
        #----------   CSGO Server Install Function   -------------------
        # APP ID # 740
        ################## Change Default Variables #################
        #                       Server IP 
        ${global:IP}            = "${global:IP}"
        #                       Server Port
        $global:PORT            = "27015"
        #                       Client Port
        $global:CLIENTPORT      = "27005"
        #                       Source TV Port
        $global:SOURCETVPORT    = "27020"
        #                       Tickrate
        $global:TICKRATE        = "64"
        #                       Game Server Token required for public servers
        $global:GSLT            = "GameServerTokenHere"
        #                       Map
        $global:MAP             = "de_inferno"
        #                       Maxplayers
        $global:MAXPLAYERS      = "32"
        #                       Server Name
        $global:HOSTNAME        = "$env:USERNAME"
        #                       Rcon Password
        $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
        #                       Game type
        $global:GAMETYPE        = "0"
        #                       Game Mode
        $global:GAMEMODE        = "0"
        #                       Map Group
        $global:MAPGROUP        = "mg_active"
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
        
        $global:MODDIR = "csgo"
        $global:EXEDIR = ""
        $global:EXE = "csgo"
        $global:GAME = "csgo"
        $global:PROCESS = "csgo"
        $global:SERVERCFGDIR = "csgo\cfg"
        $global:RCONPORT = "$global:PORT"
        $global:ANON = "yes"
        $global:username = ""  
        Get-StopServerInstall
        $global:gamedirname = "CounterStrikeGlobalOffensive"
        $global:config1 = "server.cfg"
        Get-Servercfg
        Select-RenameSource
        Select-EditSourceCFG
        $global:launchParams = '@("$global:EXE -game csgo -console -usercon -strictportbind -ip ${global:IP} -port ${global:PORT} +clientport  ${global:CLIENTPORT} +tv_port ${global:SOURCETVPORT} +sv_setsteamaccount ${global:GSLT} -tickrate ${global:TICKRATE} +map ${global:MAP} -maxplayers_override ${global:MAXPLAYERS} +mapgroup ${global:MAPGROUP} +game_type ${global:GAMETYPE} +game_mode ${global:GAMEMODE} +host_workshop_collection ${wscollectionid} +workshop_start_map ${WSSTARTMAP} -authkey ${WSAPIKEY} -nobreakpad +net_public_adr ${global:EXTIP} -condebug")'
        #Get-SourceMetMod
}