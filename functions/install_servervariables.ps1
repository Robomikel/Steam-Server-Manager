#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-CreateVariables {
    Write-Host '*** Creating Variables Script ****' -F M -B Black
    New-Item $currentdir\$serverfiles\Variables-$serverfiles.ps1 -Force
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Discord Webhook "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:discordwebhook      = `"$global:discordwebhook`""
    If ($appid) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            App ID  "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:appid               = `"$global:appid`""
    }
    If ($branch) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            branch   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:branch              = `"$global:branch`""
    }
    If ($username) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Steam username "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:username            = `"$global:username`""
    }
    If ($anon) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Steam Anonymous user  "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:anon                = `"$global:anon`""
    }
    If ($hostname) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Server Name "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:hostname            = `"$global:hostname`""
    }
    If ($serverfiles) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            serverfiles dir "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:serverfiles         = `"$global:serverfiles`""
    }
    If ($moddir) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Workshop Mod dir "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:moddir              = `"$global:moddir`""
    }
    If ($reg_appID) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Regular Game App ID "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:reg_appID           = `"$global:reg_appID`""
    }
    If ($wsmods) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            WorkShop Mod IDs "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:wsmods              = $global:wsmods"
    }
    If ($mods) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Mods for launch param "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:mods                = `"$global:mods`""
    }
    If ($servermods) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Server Mods for launch param "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:servermods          = `"$global:servermods`""
    }
    If ($executable) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Exe "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:executable          =   `"$global:executable`""
    }
    If ($executabledir) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Exe dir "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:executabledir       = `"$global:executabledir`""
    }
    If ($servercfgdir) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            server cfg dir "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:servercfgdir        = `"$global:servercfgdir`""
    }
    If ($systemdir) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            System Dir for SM or Oxide"
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:systemdir           = `"$global:systemdir`""
    }
    If ($querytype) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            querytype name used by Gamedig "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:querytype           = `"$global:querytype`""
    }
    If ($process) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            process name "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:process             = `"$global:process`""
    }
    If (${ip}) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Server IP "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`${global:ip}                = `"${global:ip}`""
    }
    If (${extip}) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Server Public IP "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`${global:extip}             = `"${global:extip}`""
    }
    If (${port}) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Server port "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`${global:port}              = `"${global:port}`""
    }
    If (${queryport}) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            query port "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`${global:queryport}         = `"${global:queryport}`""
    }
    If ($clientport) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            server client port"
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:clientport          = `"$global:clientport`""
    }
    If ($sourcetvport) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Source TV Port "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:sourcetvport        = `"$global:sourcetvport`""
    }
    If ($steamport) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            server steamport port"
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:steamport           = `"$global:steamport`""
    }
    If ($sv_lan) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Server sv_lan "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:sv_lan              = `"$global:sv_lan`""
    }
    If (${diff}) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Server Difficulty "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`${global:diff}              = `"${global:diff}`""
    }
    If ($steamid64) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            steamid64"
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:steamid64           = `"$global:steamid64`""
    }
    If ($defaultmap) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            default Map"
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:defaultmap          = `"$global:defaultmap`""
    }
    If ($galaxyname) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            default galaxyname"
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:galaxyname          = `"$global:galaxyname`""
    }
    If ($tickrate) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            server tick rate "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:tickrate            = `"$global:tickrate`""
    } 
    If ($gslt) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Gamer Server token "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:gslt                = `"$global:gslt`""
    }
    If ($maxplayers) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Max Players  "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:maxplayers          = `"$global:maxplayers`""
    }
    If ($coopplayers) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            coopplayers Players  "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:coopplayers         = `"$global:coopplayers`""
    }
    If ($workshop) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Workshop Enabled 1 "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:workshop            = `"$global:workshop`""
    }

    If ($saves) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            local Appdata saves folder "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:saves               = `"$global:saves`""
    }
    If ($rconport) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Rcon Port  "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:rconport            = `"$global:rconport`""
    }
    If ($rconpassword) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Rcon Password "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:RCONPASSWORD        = `"$global:RCONPASSWORD`""
    }
    If ($adminpassword) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            adminpassword  HERE "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:adminpassword       = `"$global:adminpassword`""
    }
    If ($sv_pure) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            sv Pure "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:sv_pure             = `"$global:sv_pure`""
    }
    If ($scenario) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            scenario   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:scenario            = `"$global:scenario`""
    }
    If ($saveinterval) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            saveinterval   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:saveinterval        = `"$global:saveinterval`""
    }
    If ($worldsize) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            worldsize  "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:worldsize           = `"$global:worldsize`""
    }
    If ($seed) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            seed   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:seed                = `"$global:seed`""
    }
    If ($rconweb) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            rconweb   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:rconweb             = `"$global:rconweb`""
    }
    If ($gametype) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Gametype   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:gametype            = `"$global:gametype`""
    }
    If ($gamemode) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Gamemode   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:gamemode            = `"$global:gamemode`""
    }
    If ($mapgroup) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            mapgroup   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:mapgroup            = `"$global:mapgroup`""
    }
    If ($cluster) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            cluster   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:cluster             = `"$global:cluster`""
    }
    If ($shard) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            shard   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:shard               = `"$global:shard`""
    }
    If ($persistentstorageroot) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                              persistentstorageroot   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:persistentstorageroot = `"$global:persistentstorageroot`""
    }
    If ($wscollectionid) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            wscollectionid   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:wscollectionid      = `"$global:wscollectionid`""
    }
    If ($wsstartmap) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            wsstartmap  "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:wsstartmap          = `"$global:wsstartmap`""
    }
    If ($wsapikey) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            wsapikey   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:wsapikey            = `"$global:wsapikey`""
    }
    If ($logdir) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            logdir   "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:logdir              = `"$global:logdir`""
    }
    If ($launchParams) {
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "#                            Server Launch Params "
        Add-Content  $currentdir\$serverfiles\Variables-$serverfiles.ps1  "`$global:launchParams        = $global:launchParams"
    }
}