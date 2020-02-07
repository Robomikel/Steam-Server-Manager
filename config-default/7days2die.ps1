#----------   7 Days to Die Server Install Function   -------------------
Function New-LaunchScriptSdtdserverPS {
    # - - - - - - - - - Change Default Variables ------------
    # Server Port 
    $global:PORT = "26900"
    # Server Name
    $global:HOSTNAME = "My Game Host"

    # - - - - - - - Do not change below - - - - - - - - -
    $global:MODDIR = ""
    $global:EXE = "startdedicated.bat"
    $global:EXEDIR = ""
    $global:GAME = "7d2d"
    $global:SAVES = "7DaysToDie"
    $global:PROCESS = "7daystodieserver"
    $global:SERVERCFGDIR = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = "serverconfig.xml"


    ((Get-Content -path $global:currentdir\$global:server\$global:config1 -Raw) -replace "My Game Host", "$global:HOSTNAME") | Set-Content -Path $global:currentdir\$global:server\$global:config1 
    ((Get-Content -path $global:currentdir\$global:server\$global:config1 -Raw) -replace '26900', "$global:PORT") | Set-Content -Path $global:currentdir\$global:server\$global:config1 
    ((Get-Content -path $global:currentdir\$global:server\startdedicated.bat -Raw) -replace 'pause', 'exit') | Set-Content -Path $global:currentdir\$global:server\startdedicated.bat        
    
    $global:launchParams = '@("$global:EXE")'
}