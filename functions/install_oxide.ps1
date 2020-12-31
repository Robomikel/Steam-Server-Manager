#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Oxide {
    Write-log "Function: Get-Oxide"
    If ($oxiderustlatestlink -and $oxideoutput) {
        $start_time = Get-Date
        Get-Infomessage "Downloading" 'Oxide'
        #(New-Object Net.WebClient).DownloadFile("$oxiderustlatestlink", "$currentdir\oxide.zip")
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        Invoke-WebRequest -Uri $oxiderustlatestlink -OutFile $oxideoutput
        If (!$?) {
            Get-WarnMessage 'Downloadfailed' 'Oxide'
            New-TryagainNew
        }
        ElseIf ($?) {
            Get-Infomessage "Downloaded" 'Oxide'
        }
        Get-Infomessage "downloadtime"
        Get-Infomessage "Extracting" 'Oxide'
        Expand-Archive $oxideoutput $oxidedirectory -Force
        If (!$?) { 
            Get-WarnMessage 'ExtractFailed' 'Oxide'
            New-TryagainNew
        }
        ElseIf ($?) {
            Get-Infomessage "Extracted" 'Oxide'
        }
        Get-Infomessage "copying-installing" 'Oxide'
        Copy-Item  $currentdir\oxide\RustDedicated_Data\* -Destination $systemdir -Force -Recurse
        If (!$?) { 
            Write-log "Copying Oxide Failed"
            New-TryagainNew
        }
        Edit-Modlist 'Oxide' $oxideoutput
    }
}