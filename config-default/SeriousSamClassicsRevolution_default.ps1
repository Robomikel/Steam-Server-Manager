Function New-LaunchScriptSeriousSamserverPS {
    # Serious Sam Classics: Revolution Dedicated Server
    # APP ID # 299310
    ################## Change Default Variables ################# 
    #                       Game Mode
    $global:GAMEMODE = "DefaultCoop"
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
    $global:MODDIR = ""
    $global:EXE = "DedicatedServer"
    $global:EXEDIR = "Bin"
    $global:GAME = "protocol-valve"
    $global:SAVES = ""
    $global:PROCESS = "DedicatedServer"
    $global:SERVERCFGDIR = "Scripts\Dedicated\$global:GAMEMODE"
    $global:LOGDIR = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = "init.ini"

    


    $global:launchParams = '@("$global:EXEDIR\$global:EXE $global:GAMEMODE")'

}