Function New-LaunchScriptunturnedserverPS {
    # Unturned Dedicated Server
    # APP ID # 1110390
    # https://steamcommunity.com/sharedfiles/filedetails/?id=876902574
    ################## Change Default Variables ################# 
    #                   Server Port 
    $global:PORT        = "27018"
    #                   Server Name
    $global:HOSTNAME    = "$env:USERNAME"
    ###########################/\#################################
    
    
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "Unturned"
    $global:EXEDIR = ""
    $global:GAME = "protocol-valve"
    $global:SAVES = ""
    $global:PROCESS = "Unturned"
    $global:SERVERCFGDIR = "Servers\$global:HOSTNAME\Server"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = "Commands.dat"

    

    
    $global:launchParams = '@("$global:EXE -batchmode -nographics -Port $global:PORT +InternetServer/$global:HOSTNAME")'
    #$global:launchParams = '@("$global:EXE")'
}