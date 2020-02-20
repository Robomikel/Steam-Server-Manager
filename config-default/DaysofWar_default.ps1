Function New-LaunchScriptdowserverPS {
    # Days of War Dedicated Server
    # APP ID # 541790
    # Wiki
    ################## Change Default Variables #################

    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Map
    $global:defaultmap             = "dow_kaysersberg"

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "DaysOfWarServer-Win64-Shipping"
    $global:executabledir = "DaysOfWar\Binaries\Win64"
    $global:querytype = "protocol-valve"
    $global:process = "DaysOfWarServer-Win64-Shipping"
    $global:servercfgdir = "DaysOfWar\Saved\Config\WindowsServer"
    $global:logdir = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = "Game.ini"

    
    # Get-Servercfg
    # Select-EditSourceCFG
    
    $global:launchParams = '@("$executabledir\$executable ${defaultmap} -Port=${port} -QueryPort=${queryport} -LOG")'

} 