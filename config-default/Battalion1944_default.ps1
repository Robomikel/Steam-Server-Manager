Function New-LaunchScriptBT1944serverPS {
    #* * Add to Read-AppID in fn_Actions.ps1 * *
    # Battalion 1944 Dedicated Server
    # APP ID # 805140
    # 
    ################## Change Default Variables #################
    #                       Server IP 
    $global:ip              = "${global:IP}"
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:QUERYPORT       = "7780"
    ##############################/\##############################
    
    
    
    ###################### Do not change below #####################
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = ""
    #--->Exe NOT in root server folder \/\/
    $global:EXEDIR = "Windows\Battalion\Binaries\Win64"
    #--->rename srcds to this name \/\/
    $global:EXE = "BattalionServer"
    #--->Requieres \/ \/ game dig
    $global:GAME = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:SAVES = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "BattalionServer"
    #--->game config folder
    $global:SERVERCFGDIR = "Windows"
    $global:LOGDIR = "Windows\Battalion\Saved\Logs"  

    

    $global:RCONPORT        = "${global:PORT}"
    #--->Stop existing process if running 
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "Battalion1944"
    #--->Game-server-manger config name \/
    $global:config1 = "DefaultGame.ini"
    #--->Get game-server-config \/\/
    Get-Servercfg

    #--->input questions 1 1 0 0 0 0 0 1 0 1 1 0 0
    #Get-UserInput 1 1 0 0 0 0 0 1 0 1 0 0 0
    #--->rename srcds.exe \/\/
    # Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    # Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$global:EXEDIR\$global:EXE  /Game/Maps/Final_Maps/Derailed?Game=/Script/ShooterGame.WartideGameMode?listen -broadcastip=`"$EXTIP`" -PORT=7777 -QueryPort=7780 -log -defgameini=`"..\..\..\DefaultGame.ini`"")'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}