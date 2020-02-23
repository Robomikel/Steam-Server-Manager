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
    $global:defaultmap      = "dow_kaysersberg"

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "DaysOfWarServer-Win64-Shipping"
    $global:executabledir = "$serverdir\DaysOfWar\Binaries\Win64"
    $global:querytype = "protocol-valve"
    $global:process = "DaysOfWarServer-Win64-Shipping"
    $global:servercfgdir = "$serverdir\DaysOfWar\Saved\Config\WindowsServer"
    $global:logdirectory = "$serverdir"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = "Game.ini"

    
    # Get-Servercfg
    # Select-EditSourceCFG
    
    $global:launchParams = '@("$executable ${defaultmap} -Port=${port} -QueryPort=${queryport} -LOG")'

} 