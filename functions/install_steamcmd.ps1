#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Install-Steam {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($steamurl -and $steamoutput) {
        $start_time = Get-Date
        clear-hostline 1
        Get-Infomessage "Downloading" 'SteamCMD'
        #(New-Object Net.WebClient).DownloadFile("$steamurl", "steamcmd.zip")
        $steamcmdzip = @{
            Uri     = $steamurl
            OutFile = $steamoutput
        } 
        try {
            # [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
            Invoke-WebRequest @steamcmdzip 
            If ($?) {
                clear-hostline 1
                Get-Infomessage "Downloaded" 'SteamCMD'
            }
        }
        catch { 
            Write-log "Warning: $($_.Exception.Message)"
            Get-WarnMessage 'Downloadfailed' 'SteamCMD'
            New-TryagainNew 
        }
        clear-hostline 1
        Get-Infomessage  "downloadtime"
        clear-hostline 1
        Get-Infomessage "Extracting" 'SteamCMD'
        If ($steamoutput -and $steamdirectory) {
            $steamoutzip = @{
                Path            = $steamoutput
                DestinationPath = $steamdirectory
                Force           = $true
            }
            Expand-Archive @steamoutzip
        }
        If (!$?) {
            Get-WarnMessage 'ExtractFailed' 'SteamCMD'
            New-TryagainNew 
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage "Extracted" 'SteamCMD'  
        }
    }
}
# Success and ERROR! Download item 497660133 failed (Request has been canceled)
# Last Exit Code 0

# timeout
# Last Exit Code 10 


# FAILED login with result code Service Unavailable
# Last Exit Code 5