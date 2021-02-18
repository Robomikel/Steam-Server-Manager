#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-CreateVariables {
    Write-log "Function: New-CreateVariables"
    Write-log "Creating Variables Script"
    New-Item $ssmwd\$serverfiles\Variables-$serverfiles.ps1 -Force | Out-File -Append -Encoding Default  $ssmlog
    #        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Discord Webhook "
    #        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:discordwebhook      = `"$global:discordwebhook`""
    If ($appid) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            App ID  "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:appid               = `"$global:appid`""
    }
    If ($branch) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            branch   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:branch              = `"$global:branch`""
    }
    If ($username) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Steam username "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:username            = `"$global:username`""
    }
    If ($anon) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Steam Anonymous user  "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:anon                = `"$global:anon`""
    }
    If ($hostname) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Server Name "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:hostname            = `"$global:hostname`""
    }
    If (($serverpassword)-and ($serverpassword -ne " ")) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Server password "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:serverpassword      = `"$global:serverpassword`""
    }
    If ($serverfiles) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            serverfiles dir "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:serverfiles         = `"$global:serverfiles`""
    }
    If ($moddir) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Workshop Mod dir "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:moddir              = `"$global:moddir`""
    }
    If ($reg_appID) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Regular Game App ID "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:reg_appID           = `"$global:reg_appID`""
    }
    If ($wsmods) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            WorkShop Mod IDs "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:wsmods              = $global:wsmods"
    }
    If ($mods) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Mods for launch param "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:mods                = `"$global:mods`""
    }
    If ($servermods) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Server Mods for launch param "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:servermods          = `"$global:servermods`""
    }
    If ($executable) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Exe "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:executable          =   `"$global:executable`""
    }
    If ($executabledir) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Exe dir "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:executabledir       = `"$global:executabledir`""
    }
    If ($servercfg) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Game-Server-Config"
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:servercfg           = `"$global:servercfg`""
    }
    If ($servercfgdir) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            server cfg dir "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:servercfgdir        = `"$global:servercfgdir`""
    }
    If ($systemdir) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            System Dir for SM or Oxide"
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:systemdir           = `"$global:systemdir`""
    }
    If ($querytype) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            querytype name used by Gamedig "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:querytype           = `"$global:querytype`""
    }
    If ($process) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            process name "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:process             = `"$global:process`""
    }
    If (${ip}) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Server IP "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`${global:ip}                = `"${global:ip}`""
    }
    If (${extip}) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Server Public IP "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`${global:extip}             = `"${global:extip}`""
    }
    If (${port}) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Server port "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`${global:port}              = `"${global:port}`""
    }
    If (${queryport}) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            query port "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`${global:queryport}         = `"${global:queryport}`""
    }
    If ($clientport) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            server client port"
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:clientport          = `"$global:clientport`""
    }
    If ($beaconport) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            server Beacon port"
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:beaconport          = `"$global:beaconport`""
    }
    If ($peerport) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Peer Port "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:peerport            = `"$global:peerport`""
    }
    If ($sourcetvport) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Source TV Port "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:sourcetvport        = `"$global:sourcetvport`""
    }
    If ($steamport) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            server steamport port"
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:steamport           = `"$global:steamport`""
    }
    If ($sv_lan) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Server sv_lan "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:sv_lan              = `"$global:sv_lan`""
    }
    If (${diff}) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Server Difficulty "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`${global:diff}              = `"${global:diff}`""
    }
    If (($steamid64) -and ($steamid64 -ne " ")) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            steamid64"
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:steamid64           = `"$global:steamid64`""
    }
    If ($lighting) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Map Lighting"
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:lighting           = `"$global:lighting`""
    }
    If (($modsenabled) -and (($modsenabled -ne $false))) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Mods enabled"
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:modsenabled           = `"$global:modsenabled`""
    }
    If ($oauthtoken) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Mods OAuth"
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:oauthtoken           = `"$global:oauthtoken`""
    }
    If ($defaultmap) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            default Map"
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:defaultmap          = `"$global:defaultmap`""
    }
    If ($galaxyname) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            default galaxyname"
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:galaxyname          = `"$global:galaxyname`""
    }
    If ($tickrate) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            server tick rate "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:tickrate            = `"$global:tickrate`""
    } 
    If (($gslt) -and ($gslt -ne "GameServerToken")) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Gamer Server token "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:gslt                = `"$global:gslt`""
    }
    If ($maxplayers) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Max Players  "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:maxplayers          = `"$global:maxplayers`""
    }
    If ($numplayers) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            number of Players  "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:numplayers          = `"$global:numplayers`""
    }
    If ($coopplayers) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            coopplayers Players  "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:coopplayers         = `"$global:coopplayers`""
    }
    If ($workshop) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Workshop Enabled 1 "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:workshop            = `"$global:workshop`""
    }
    If ($saves) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            local Appdata saves folder "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:saves               = `"$global:saves`""
    }
    If ($rconport) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Rcon Port  "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:rconport            = `"$global:rconport`""
    }
    If ($rconpassword) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Rcon Password "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:RCONPASSWORD        = `"$global:RCONPASSWORD`""
    }
    If ($adminpassword) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            adminpassword  HERE "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:adminpassword       = `"$global:adminpassword`""
    }
    If ($sv_pure) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            sv Pure "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:sv_pure             = `"$global:sv_pure`""
    }
    If ($scenario) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            scenario   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:scenario            = `"$global:scenario`""
    }
    If ($saveinterval) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            saveinterval   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:saveinterval        = `"$global:saveinterval`""
    }
    If ($worldsize) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            worldsize  "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:worldsize           = `"$global:worldsize`""
    }
    If ($seed) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            seed   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:seed                = `"$global:seed`""
    }
    If ($rconweb) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            rconweb   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:rconweb             = `"$global:rconweb`""
    }
    If ($gametype) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Gametype   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:gametype            = `"$global:gametype`""
    }
    If ($gamemode) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Gamemode   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:gamemode            = `"$global:gamemode`""
    }
    If ($mapgroup) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            mapgroup   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:mapgroup            = `"$global:mapgroup`""
    }
    If ($gamedirname) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            gamedirname   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:gamedirname         = `"$global:gamedirname`""
    }
    If ($cluster) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            cluster   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:cluster             = `"$global:cluster`""
    }
    If ($shard) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            shard   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:shard               = `"$global:shard`""
    }
    If ($persistentstorageroot) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                              persistentstorageroot   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:persistentstorageroot = `"$global:persistentstorageroot`""
    }
    If ($wscollectionid) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            wscollectionid   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:wscollectionid      = `"$global:wscollectionid`""
    }
    If ($wsstartmap) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            wsstartmap  "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:wsstartmap          = `"$global:wsstartmap`""
    }
    If ($wsapikey) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            wsapikey   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:wsapikey            = `"$global:wsapikey`""
    }
    If ($logdirectory) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            log directory   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:logdirectory         = `"$global:logdirectory`""
    }
    If ($consolelog) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            consolelog directory   "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:consolelog         = `"$global:consolelog`""
    }
    If ($launchParams) {
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "#                            Server Launch Params "
        Add-Content  $ssmwd\$serverfiles\Variables-$serverfiles.ps1  "`$global:launchParams        = $global:launchParams"
    }
}