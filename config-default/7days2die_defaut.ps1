Function New-LaunchScriptSdtdserverPS {
    #----------   7 Days to Die Server Install Function   -------
    # APP ID # 294420
    ################## Change Default Variables ################# 
    #                   Server Port 
    $global:port        = "26900"
    #                   Server Name
    $global:hostname    = "$env:USERNAME"
    ###########################/\#################################
    
    
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    #$global:executable = "startdedicated.bat"
    $global:executable = "7DaysToDieServer"
    $global:executabledir= "$serverdir"
    $global:querytype = "7d2d"
    $global:saves = "7DaysToDie"
    $global:process = "7daystodieserver"
    $global:servercfgdir = "$serverdir"
    $global:logdirectory = "$serverdir"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = "serverconfig.xml"

    

    IF (Test-Path $executabledir\7DaysToDieServer.exe){
    }Else{
        $global:executable = "7DaysToDie"
    }

    ((Get-Content -path $servercfgdir\$servercfg -Raw) -replace "My game Host", "$hostname") | Set-Content -Path $servercfgdir\$servercfg 
    ((Get-Content -path $servercfgdir\$servercfg -Raw) -replace '26900', "$port") | Set-Content -Path $servercfgdir\$servercfg 
    ((Get-Content -path $servercfgdir\startdedicated.bat -Raw) -replace 'pause', 'exit') | Set-Content -Path $servercfgdir\startdedicated.bat        
    
    
    $global:launchParams = '@("$executable -logfile $servercfgdir\server.log -quit -batchmode -nographics -configfile=serverconfig.xml -dedicated")'
    #$launchParams = '@("$executable")'
}