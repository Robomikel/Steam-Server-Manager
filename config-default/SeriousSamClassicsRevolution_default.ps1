Function New-LaunchScriptSeriousSamserverPS {
    # Serious Sam Classics: Revolution Dedicated Server
    # APP ID # 299310
    ################## Change Default Variables ################# 
    #                       Game Mode
    $global:gamemode        = "DefaultCoop"
    ###########################/\#################################
    
    # DefaultCoop
    # DefaultFragmatchSE
    # DefaultScorematchSE
    
    ### init.ini #####
    # change server name
    # gam_strSessionName = "Dedicated Coop Game";
    # change port
    # net_iPort = 27015;
    
    ### Dedicated_startup.ini ###
    # net_strLocalHost = "10.1.10.200";
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\Scripts\Dedicated\$GAMEMODE"
    #                       Server Executable
    $global:executable      = "DedicatedServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Bin"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "DedicatedServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "init.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable ${gamemode}")'
}