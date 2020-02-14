Function New-LaunchScriptminecraft_serverPS {
    # Minecraft
    # 11500000


    ################## Change Default Variables #################

    ###########################/\#################################

    
    # 25565 TCP/UDP IPV4
    
    
    ###################### Do not change below #####################
    Get-MCjavaBinaries
    $global:MODDIR = ""
    $global:EXE = "server.jar"
    # $global:EXE          = "forge-*.jar"
    $global:EXEDIR = ""
    $global:GAME = "minecraft"
    $global:SAVES = ""
    $global:PROCESS = "java"
    $global:SERVERCFGDIR = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = ""

    # java -jar forge-installer.jar --installServer
    # java -Xms1G -Xmx2G     
    $global:launchParams = '@("java -Xms1024M -Xmx1024M -jar $global:EXE nogui")'

}