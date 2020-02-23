Function New-LaunchScriptminecraft_serverPS {
    # Minecraft
    # 11500000


    ################## Change Default Variables #################

    ###########################/\#################################

    
    # 25565 TCP/UDP IPV4
    
    
    ###################### Do not change below #####################
    Get-MCjavaBinaries
    $global:systemdir = ""
    $global:executable = "server.jar"
    # $global:executable          = "forge-*.jar"
    $global:executabledir = "$serverdir"
    $global:querytype = "minecraft"
    $global:saves = ""
    $global:process = "java"
    $global:servercfgdir = "$serverdir"
    
    $global:gamedirname = ""
    $global:servercfg = ""

    # java -jar forge-installer.jar --installServer
    # java -Xms1G -Xmx2G     
    $global:launchParams = '@("java -Xms1024M -Xmx1024M -jar $executable nogui")'

}