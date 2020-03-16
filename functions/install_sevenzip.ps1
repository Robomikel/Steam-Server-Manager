#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Add-Sevenzip {
    If ($sevenzipurl -and $sevenzipoutput) {
        $start_time = Get-Date
        Get-Infomessage "Downloading" '7ZIP'
        #(New-Object Net.WebClient).DownloadFile("$sevenzipurl", "$currentdir\7za920.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        Invoke-WebRequest -Uri $sevenzipurl -OutFile $sevenzipoutput
        If (!$?) {
            Get-WarnMessage 'Downloadfailed' '7ZIP'
            New-TryagainNew 
        }
        ElseIf ($?) {
            Get-Infomessage "Downloaded" '7ZIP'
        }
        Get-Infomessage "downloadtime"
        Expand-Archive $sevenzipoutput $sevenzipdirectory -Force
        Get-Infomessage "Extracting" '7ZIP'
        If (!$?) {
            Get-WarnMessage 'ExtractFailed' '7ZIP'
            New-TryagainNew 
        }
        ElseIf ($?) {
            Get-Infomessage "Extracted" '7ZIP'
        }
    }
}