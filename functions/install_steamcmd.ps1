#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Install-Steam {
    If (($steamurl) -and ($steamoutput)) {
        $start_time = Get-Date
        $global:package = 'SteamCMD'
        $global:infomessage = "Downloading"
        Get-Infomessage
        #(New-Object Net.WebClient).DownloadFile("$steamurl", "steamcmd.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;  
        Invoke-WebRequest -Uri $steamurl -OutFile $steamoutput
        If (!$?) {
            $global:warnmessage = 'Downloadfailed'
            Get-WarnMessage
            New-TryagainNew 
        }
        ElseIf ($?) {
            $global:infomessage = "Downloaded"
            Get-Infomessage
        }
        $global:infomessage = "downloadtime"
        Get-Infomessage
        $global:infomessage = "Extracting"
        Get-Infomessage
        Expand-Archive $steamoutput $steamdirectory -Force
        If (!$?) {
            $global:warnmessage = 'ExtractFailed'
            Get-WarnMessage
            New-TryagainNew 
        }
        ElseIf ($?) {
            $global:infomessage = "Extracted"
            Get-Infomessage
        }
    }
}
# Success and ERROR! Download item 497660133 failed (Request has been canceled)
# Last Exit Code 0

# timeout
# Last Exit Code 10 


# FAILED login with result code Service Unavailable
# Last Exit Code 5