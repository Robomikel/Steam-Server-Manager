#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Test-SteamMaster {
	Write-log "Function: $($MyInvocation.Mycommand)"
	If ($ssmlog -and $loggingdate) {
		Write-log "Checking Steam Master"
		if ($Useprivate = "off") { 
			if ( ${extip} -and ${queryport}) { 
				if ( ${steammastercheck} -eq "on" ) {
					$global:masterserver = Invoke-Webrequest "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${extip}:${queryport}" -UseBasicParsing | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
					Write-log "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${extip}:${queryport} "
					# $masterserver = $masterserver.response.success
					# $global:masterresponse = $masterserver 
					# | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
				}
			}
			Elseif (${extip} -and ${port} ) { 
				if ( ${steammastercheck} -eq "on" ) {
					$global:masterserver = Invoke-Webrequest "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${extip}:${port}" -UseBasicParsing | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
					Write-log "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${extip}:${port} "
					# $masterserver = $masterserver.response.success
					# $global:masterresponse = $masterserver 
					# | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
				}
			}	
		
		}
		Else {
			if ( ${ip} -and ${queryport} ) { 
				if ( ${steammastercheck} -eq "on" ) { 
					$global:masterserver = Invoke-Webrequest "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${ip}:${queryport}" -UseBasicParsing | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
					Write-log "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${ip}:${queryport} "
					# $masterserver = $masterserver.response.success
					# $global:masterresponse = $masterserver 
					# | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
				}
			}
			Elseif ( ${ip} -and ${port}) { 
				if ( ${steammastercheck} -eq "on" ) { 
					$global:masterserver = Invoke-Webrequest "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${ip}:${port}" -UseBasicParsing | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
					Write-log "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${ip}:${port} "
					# $masterserver = $masterserver.response.success
					# $global:masterresponse = $masterserver 
					# | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
				}
			}		
		}
		Write-log "Test-SteamMaster $masterserver ${steammastercheck}"
	}
}