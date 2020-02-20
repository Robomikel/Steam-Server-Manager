Function New-LaunchScriptStormworksserverPS {
    # Stormworks Dedicated Server
    # APP ID # 1247090
    ################## Change Default Variables ################# 
    #                       Server Port 
    $global:port            = "25564"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Maxplayers
    $global:maxplayers      = "20"
    #                       Server Password
    $global:serverpassword  = ""
    ###########################/\#################################
    
    # port="25564" set the game and query ports that will be used for the server 
    # name="Stormworks" set the name of the server 
    # seed="" set the seed that will be used for the world generation (empty is random) 
    # save_name="" set the world save name that will be used for save and 
    # loading max_players="32" set the max number of the players for 
    # server password="" set the password (empty means no password) 
    # day_night_length="60" set the length of the day in minutes
    # base_island="" set what player base will be owned on start (empty is start base)
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "server"
    $global:executabledir = ""
    $global:querytype = ""
    $global:saves = "Stormworks"
    $global:process = "server"
    $global:servercfgdir = "$env:APPDATA\$global:saves\"
    $global:logdir = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = "server_config.xml"

    

    $global:launchParams = '@("$executable")'

}