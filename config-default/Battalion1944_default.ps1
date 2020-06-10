Function New-LaunchScriptBT1944serverPS {
    #* * Add to Read-AppID in fn_Actions.ps1 * *
    # Battalion 1944 Dedicated Server
    # APP ID # 805140
    # 
    ################## Change Default Variables #################
    #                       Server IP 
    $global:ip              = "${ip}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "7780"
    ##############################/\##############################
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdi"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\Windows"
    #                       Server Executable 
    $global:executable      = "BattalionServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Windows\Battalion\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "BattalionServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\Windows\Battalion\Saved\Logs"
    #                       Server Log
    $global:consolelog      = ""  
    #                       Game-Server-Config Directory 
    $global:gamedirname     = "Battalion1944"
    #                       Game-Server-Config
    $global:servercfg       = "DefaultGame.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable}  /Game/Maps/Final_Maps/Derailed?Game=/Script/ShooterGame.WartideGameMode?listen -broadcastip=`"${extip}`" -PORT=${port} -QueryPort=${queryport} -log -defgameini=`"..\..\..\DefaultGame.ini`"")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
}