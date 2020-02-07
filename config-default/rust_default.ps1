# Version 2.5
#----------   Rust Server Install Function   -------------------
Function New-LaunchScriptRustPS {
    # Requiered Dont change 
    # # Version 2.0
    $global:MODDIR = "RustDedicated_Data"
    $global:EXEDIR = ""
    $global:EXE = "RustDedicated"
    $global:GAME = "rust"
    $global:PROCESS = "RustDedicated"
    $global:SERVERCFGDIR = "server\my_server_identity\cfg"
    Get-StopServerInstall
    # Game-server-configs \/
    $global:gamedirname = "Rust"
    $global:config1 = "server.cfg"
    Get-Servercfg
    # # Version 2.0
    # Game Specific
    $global:RANDOMSEED = Get-Random -Minimum 1 -Maximum 2147483647  
    

    If ( $global:Version -eq "1" ) {
            # - Version 1
            
            Write-Host '*** Configure Instance *****' -ForegroundColor Yellow -BackgroundColor Black
            Write-Host 'Input Server local IP: ' -ForegroundColor Cyan -NoNewline
            ${global:IP} = Read-host
            if (($global:PORT = Read-Host -Prompt (Write-Host "Input Server Port,Press enter to accept default value [28015]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:PORT = "28015" }else { $global:PORT }
            if (($global:RCONPORT = Read-Host -Prompt (Write-Host "Input Server Rcon Port,Press enter to accept default value [28016]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:RCONPORT = "28016" }else { $global:RCONPORT }
            if (($global:RCONPASSWORD = Read-Host -Prompt (Write-Host "Input Server Rcon Password,Press enter to accept default value [$global:RANDOMPASSWORD]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:RCONPASSWORD = "$global:RANDOMPASSWORD" }else { $global:RCONPASSWORD }
            if (($global:RCONWEB = Read-Host -Prompt (Write-Host "Input Server Rcon Web,Press enter to accept default value [1]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:RCONWEB = "1" }else { $global:RCONWEB }
            Write-Host 'Input Server name: ' -ForegroundColor Cyan -NoNewline
            $global:HOSTNAME = Read-host
            Write-Host 'Input maxplayers: ' -ForegroundColor Cyan -NoNewline
            $global:MAXPLAYERS = Read-host
            if (($global:SEED = Read-Host -Prompt (Write-Host "Input Server seed,Press enter to accept default value [$global:RANDOMSEED]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:SEED = "$global:RANDOMSEED" }else { $global:SEED }
            if (($global:WORLDSIZE = Read-Host -Prompt (Write-Host "Input Server WorldSize,Press enter to accept default value [3000]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:WORLDSIZE = "3000" }else { $global:WORLDSIZE }
            if (($global:SAVEINTERVAL = Read-Host -Prompt (Write-Host "Input Server Save Interval,Press enter to accept default value [300]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:SAVEINTERVAL = "300" }else { $global:SAVEINTERVAL }
            if (($global:TICKRATE = Read-Host -Prompt (Write-Host "Input Server Tickrate,Press enter to accept default value [30]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:TICKRATE = "30" }else { $global:TICKRATE }  
    }
    ElseIf ( $global:Version -eq "2" ) {
            #  Edit Vars here \/ \/ \/
            ${global:IP} = "${global:IP}"
            $global:PORT = "28015"
            $global:RCONPORT = "28016"
            $global:RCONPASSWORD = "$global:RANDOMPASSWORD"
            $global:RCONWEB = "1"
            $global:HOSTNAME = "PS steamer"
            $global:MAXPLAYERS = "32"
            $global:SEED = "$global:RANDOMSEED"
            $global:WORLDSIZE = "3000"
            $global:SAVEINTERVAL = "300"
            $global:TICKRATE = "30"
            #  Edit Vars here     /\ /\ /\
    }
    ElseIf ( $global:Version -eq "0" ) {
            Get-UserInput 1 1 0 1 1 1 0 1
            $global:RCONWEB = "1"
            $global:SEED = "$global:RANDOMSEED"
            $global:WORLDSIZE = "3000"
            $global:SAVEINTERVAL = "300"
            $global:TICKRATE = "30"
    }
    #  Version 2 Launch Param
    $global:launchParams = '@("$global:EXE -batchmode +server.ip ${global:IP}  +server.port ${global:PORT} +server.tickrate ${global:TICKRATE} +server.hostname `"${global:HOSTNAME}`" +server.maxplayers ${global:MAXPLAYERS} +server.worldsize ${global:WORLDSIZE} +server.saveinterval ${global:SAVEINTERVAL} +rcon.web ${global:RCONWEB} +rcon.ip 0.0.0.0 +rcon.port ${global:RCONPORT} +rcon.password ${global:RCONPASSWORD} -logfile $global:currentdir\$global:server\Serverlog-$date.log")'
    # adding to server.cfg                   server.hostname "server"
    #Add-Content -Path $global:currentdir\$global:server\$global:SERVERCFGDIR\$global:config1 -Value "server.hostname `"$global:HOSTNAME`""
    Get-OxideQ
    
}




