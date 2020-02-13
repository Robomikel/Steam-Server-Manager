Function New-LaunchScriptacserverPS {
    # Assetto Corsa Dedicated Server
    # 	302550
    # https://www.assettocorsa.net/forum/index.php?faq/dedicated-server-manual.28/
    #$global:MODDIR="Assetto Corsa\Server"
    ################## Change Default Variables #################
    
    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "acServer.bat"
    $global:EXEDIR = "Assetto Corsa\Server"
    $global:GAME = "protocol-valve"
    $global:PROCESS = "acServer"

    
    Get-StopServerInstall
    $global:launchParams = '@("$global:EXEDIR\$global:EXE")'
}