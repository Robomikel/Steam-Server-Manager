Function New-LaunchScriptunturnedserverPS {
    # Unturned Dedicated Server
    # APP ID # 1110390
    # https://steamcommunity.com/sharedfiles/filedetails/?id=876902574
    ################## Change Default Variables ################# 
    #                   Server Port 
    $global:port        = "27018"
    #                   Server Name
    $global:hostname    = "SERVERNAME"
    ###########################/\#################################
    
    ###################### Do not change below #####################
    #                           System Directory 
    $global:systemdir           = "$serverdir"
    #                           Server Config Directory
    $global:servercfgdir        = "$serverdir\Servers\$hostname\Server"
    #                           Server Executable 
    $global:executable          = "Unturned"
    #                           Server Executable Directory
    $global:executabledir       = "$serverdir"
    #                           Gamedig Query
    $global:querytype           = "protocol-valve"
    #                           Game Process
    $global:process             = "Unturned"
    #                           Log Directory
    $global:logdirectory        = "$serverdir\Logs"
    #                           Server Log
    $global:consolelog          = "Server_$hostname.log"
    #                           Game-Server-Config Directory
    $global:gamedirname         = ""
    #                           Game-Server-Config
    $global:servercfg           = "Commands.dat"
    #                           Server Launch Command
    $global:launchParams        = '@("${executable} -batchmode -nographics -Port ${port} +InternetServer/${hostname}")'
    # Get User Input version must be set to 0
    Get-UserInput
}