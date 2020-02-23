Function New-LaunchScriptDofDserverPS {
    # Day of Dragons - Dedicated Server
    # APP ID # 1088320
    # https://survivalservers.com/wiki/index.php?title=How_to_Create_a_Day_of_Dragons_Server_Guide
    ################## Change Default Variables #################

    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    ##############################/\##############################
    # Add an incoming rule to your Windows Firewall 
    # to allow UDP port 27015 as well as 27016, and 7777
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "DragonsServer"
    $global:executabledir = "$serverdir"
    $global:querytype = "protocol-valve"
    $global:process = "DragonsServer"
    $global:servercfgdir = "$serverdir\Dragons\Saved\Config\WindowsServer"
    $global:logdirectory = "$serverdir"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = "Game.ini"


    
    $global:launchParams = '@("$executable -SteamServerName=`"${hostname}`" -log")'
} 