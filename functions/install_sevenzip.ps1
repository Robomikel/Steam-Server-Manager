#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Add-Sevenzip {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($sevenzipurl -and $sevenzipoutput) {
        $start_time = Get-Date
        clear-hostline 1
        Get-Infomessage "Downloading" '7ZIP'
        #(New-Object Net.WebClient).DownloadFile("$sevenzipurl", "$currentdir\7za920.zip")
        $sevenzip = @{
            Uri     = $sevenzipurl
            OutFile = $sevenzipoutput
        }
        try {
            # [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
            Invoke-WebRequest @sevenzip 
            If ($?) {
                clear-hostline 1
                Get-Infomessage "Downloaded" '7ZIP'
            }
        }
        catch { 
            Get-WarnMessage "Download Failed 7ZIP: $($_.Exception.Message)"
        }
        clear-hostline 1
        Get-Infomessage "downloadtime"
        Expand-Archive $sevenzipoutput $sevenzipdirectory -Force
        clear-hostline 1
        Get-Infomessage "Extracting" '7ZIP'
        If (!$?) {
            clear-hostline 1
            Get-WarnMessage 'Extract Failed 7ZIP'
        }
        ElseIf ($?) {
            clear-hostline 1
            Get-Infomessage "Extracted" '7ZIP'
        }
    }
}