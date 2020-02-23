Function New-LaunchScriptSdtdserverPS {
    #----------   7 Days to Die Server Install Function   -------
    # APP ID # 294420
    ################## Change Install Variables ################# 
    #                       Server Port 
    $global:port            = "26900"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ###########################/\#################################
    ###################### Do not change below ###################
    #                       System Directory 
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable 
    $global:executable      = "7DaysToDieServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Appdata\Roaming Directory
    $global:saves           = "7DaysToDie"
    #                       Gamedig Query
    $global:querytype       = "7d2d"
    #                       Game Process
    $global:process         = "7daystodieserver"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Game-Server-Config Directory 
    $global:gamedirname     = "7DaysToDie"
    #                       Game-Server-Config
    $global:servercfg       = "serverconfig.xml"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -logfile $servercfgdir\server.log -quit -batchmode -nographics -configfile=serverconfig.xml -dedicated")'
    # Install Adjustments
    Get-InstallChanges7d2d
}

Function Get-InstallChanges7d2d {
    IF (Test-Path $executabledir\7DaysToDieServer.exe){
    }Else{
        $global:executable = "7DaysToDie"
    }
    ((Get-Content -path $servercfgdir\$servercfg -Raw) -replace "My game Host", "$hostname") | Set-Content -Path $servercfgdir\$servercfg 
    ((Get-Content -path $servercfgdir\$servercfg -Raw) -replace '26900', "$port") | Set-Content -Path $servercfgdir\$servercfg 
    ((Get-Content -path $servercfgdir\startdedicated.bat -Raw) -replace 'pause', 'exit') | Set-Content -Path $servercfgdir\startdedicated.bat        
}