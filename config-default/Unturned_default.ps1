Function New-LaunchScriptunturnedserverPS {
    # Unturned Dedicated Server
    # APP ID # 1110390
    # https://steamcommunity.com/sharedfiles/filedetails/?id=876902574
    ################## Change Default Variables ################# 
    #                   Server Port 
    $global:port        = "27018"
    #                   Server Name
    $global:hostname    = "$env:USERNAME"
    ###########################/\#################################
    
    
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "Unturned"
    $global:executabledir = ""
    $global:querytype = "protocol-valve"
    $global:saves = ""
    $global:process = "Unturned"
    $global:servercfgdir = "Servers\$hostname\Server"
    $global:logdir = "Logs"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = "Commands.dat"

    

    
    $global:launchParams = '@("$executable -batchmode -nographics -Port ${port} +InternetServer/$hostname")'
    #$global:launchParams = '@("$executable")'
}