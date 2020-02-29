
Function Test-SteamMaster {
	if ($Useprivate = "off") { 
		if (( ${extip} ) -and ( ${port} )) { 
			if ( ${steammastercheck} -eq "on" ) { 
				$global:masterserver = Invoke-Webrequest "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${extip}:${port}" -UseBasicParsing | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
				# $masterserver = $masterserver.response.success
				# $global:masterresponse = $masterserver 
				# | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
			}
		}
		Else {
			if (( ${ip} ) -and ( ${port} )) { 
				if ( ${steammastercheck} -eq "on" ) { 
					$global:masterserver = Invoke-Webrequest "https://api.steampowered.com/ISteamApps/GetServersAtAddress/v0001?addr=${ip}:${port}" -UseBasicParsing | ConvertFrom-Json  | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
					# $masterserver = $masterserver.response.success
					# $global:masterresponse = $masterserver 
					# | ConvertFrom-Json | Select-Object -ExpandProperty response | Select-Object -ExpandProperty Servers
				}
			}	
		}
	}
	
Add-Content $ssmlog "[$loggingdate] Test-SteamMaster $masterserver ${steammastercheck}"
#	If ( $masterserver -eq $True) {
#		Write-Host '---> Connection to Steam Master Server <---' -F Y 
#		Write-Host "   $masterresponse   " -ForegroundColor Green
#	}
}