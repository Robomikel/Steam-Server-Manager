Function New-LaunchScriptSdtdserverPS {
    #----------   7 Days to Die Server Install Function   -------
    # APP ID # 294420
    ################## Change Default Variables ################# 
    #                   Server Port 
    $global:PORT        = "26900"
    #                   Server Name
    $global:HOSTNAME    = "$env:USERNAME"
    ###########################/\#################################
    
    
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    #$global:EXE = "startdedicated.bat"
    $global:EXE = "7DaysToDieServer"
    $global:EXEDIR = ""
    $global:GAME = "7d2d"
    $global:SAVES = "7DaysToDie"
    $global:PROCESS = "7daystodieserver"
    $global:SERVERCFGDIR = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = "serverconfig.xml"

    

    IF (Test-Path $global:currentdir\$global:server\7DaysToDieServer.exe){
    }Else{
        $global:EXE = "7DaysToDie"
    }

    ((Get-Content -path $global:currentdir\$global:server\$global:config1 -Raw) -replace "My Game Host", "$global:HOSTNAME") | Set-Content -Path $global:currentdir\$global:server\$global:config1 
    ((Get-Content -path $global:currentdir\$global:server\$global:config1 -Raw) -replace '26900', "$global:PORT") | Set-Content -Path $global:currentdir\$global:server\$global:config1 
    ((Get-Content -path $global:currentdir\$global:server\startdedicated.bat -Raw) -replace 'pause', 'exit') | Set-Content -Path $global:currentdir\$global:server\startdedicated.bat        
    
    
    $global:launchParams = '@("$global:EXE -logfile $global:currentdir\$global:server\server.log -quit -batchmode -nographics -configfile=serverconfig.xml -dedicated")'
    #$global:launchParams = '@("$global:EXE")'
}