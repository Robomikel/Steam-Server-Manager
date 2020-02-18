Function New-LaunchScriptdowserverPS {
    # Days of War Dedicated Server
    # APP ID # 541790
    # Wiki
    ################## Change Default Variables #################

    #                       Server Port
    $global:PORT            = "7777"
    #                       Query Port
    $global:QUERYPORT       = "27015"
    #                       Map
    $global:MAP             = "dow_kaysersberg"

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "DaysOfWarServer-Win64-Shipping"
    $global:EXEDIR = "DaysOfWar\Binaries\Win64"
    $global:GAME = "protocol-valve"
    $global:PROCESS = "DaysOfWarServer-Win64-Shipping"
    $global:SERVERCFGDIR = "DaysOfWar\Saved\Config\WindowsServer"
    $global:LOGDIR = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = "Game.ini"

    
    # Get-Servercfg
    # Select-EditSourceCFG
    
    $global:launchParams = '@("$global:EXEDIR\$global:EXE ${global:MAP} -Port=${global:PORT} -QueryPort=${global:QUERYPORT} -LOG")'

} 