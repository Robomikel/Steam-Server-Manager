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
    $global:executabledir= ""
    $global:querytype = "7d2d"
    $global:saves = "7DaysToDie"
    $global:process = "7daystodieserver"
    $global:servercfgdir = ""
    $global:logdir = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = "serverconfig.xml"

    

    IF (Test-Path $currentdir\$serverfiles\7DaysToDieServer.exe){
    }Else{
        $global:executable = "7DaysToDie"
    }

    ((Get-Content -path $currentdir\$serverfiles\$servercfg -Raw) -replace "My game Host", "$hostname") | Set-Content -Path $currentdir\$serverfiles\$servercfg 
    ((Get-Content -path $currentdir\$serverfiles\$servercfg -Raw) -replace '26900', "$port") | Set-Content -Path $currentdir\$serverfiles\$servercfg 
    ((Get-Content -path $currentdir\$serverfiles\startdedicated.bat -Raw) -replace 'pause', 'exit') | Set-Content -Path $currentdir\$serverfiles\startdedicated.bat        
    
    
    $launchParams = '@("$executable -logfile $currentdir\$serverfiles\server.log -quit -batchmode -nographics -configfile=serverconfig.xml -dedicated")'
    #$launchParams = '@("$executable")'
}