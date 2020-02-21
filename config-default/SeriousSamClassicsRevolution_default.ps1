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
    
    # init.ini
    # change server name
    # gam_strSessionName = "Dedicated Coop Game";
    # change port
    # net_iPort = 27015;
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "DedicatedServer"
    $global:executabledir = "$serverdir\Bin"
    $global:querytype = "protocol-valve"
    $global:saves = ""
    $global:process = "DedicatedServer"
    $global:servercfgdir = "$serverdir\Scripts\Dedicated\$global:GAMEMODE"
    $global:logdirectory = "$serverdir"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = "init.ini"

    


    $global:launchParams = '@("$executable ${gamemode}")'

}