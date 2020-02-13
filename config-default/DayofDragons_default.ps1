Function New-LaunchScriptDofDserverPS {
    # Day of Dragons - Dedicated Server
    # APP ID # 1088320
    # https://survivalservers.com/wiki/index.php?title=How_to_Create_a_Day_of_Dragons_Server_Guide
    ################## Change Default Variables #################

    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    ##############################/\##############################
    # Add an incoming rule to your Windows Firewall 
    # to allow UDP port 27015 as well as 27016, and 7777
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "DragonsServer"
    $global:EXEDIR = ""
    $global:GAME = "protocol-valve"
    $global:PROCESS = "DragonsServer"
    $global:SERVERCFGDIR = "Dragons/Saved/Config/WindowsServer/"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = "Game.ini"


    
    $global:launchParams = '@("$global:EXE -SteamServerName=`"${global:HOSTNAME}`" -log")'
} 