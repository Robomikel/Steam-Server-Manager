#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function install-mcrcon {
    Write-log "Function: install-mcrcon"
    If ($mcrconurl -and $mcrconoutput) {
        $start_time = Get-Date
        Get-Infomessage "downloading" 'MCRCon'
        Write-log "Downloading MCRCon from github" 
        #(New-Object Net.WebClient).DownloadFile("$metamodurl", "$currentdir\metamod.zip")
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        Invoke-WebRequest -Uri $mcrconurl -OutFile $mcrconoutput
        If (!$?) {
            Write-Warning 'Downloading  MCRCon Failed'
            Write-log "Downloading  MCRCon Failed"
            New-TryagainNew 
        }
        ElseIf ($?) {
            Get-Infomessage "downloaded" 'MCRCon'
            Write-log "MCRCon succeeded " 
        }
        Get-Infomessage "downloadtime"
        Get-Infomessage "Extracting" 'MCRCon'
        Expand-Archive "$mcrconoutput" "$mcrcondirectory" -Force 
        Copy-Item  "$currentdir\mcrcon\mcrcon-0.7.1-windows-x86-32\*" -Destination $mcrcondirectory -Recurse -Force 
        Remove-Item "$currentdir\mcrcon\mcrcon-0.7.1-windows-x86-32" -Recurse -Force 
        If (!$?) {
            Write-Warning 'Extracting MCRCon Failed'
            Write-log "Extracting MCRCon Failed " 
            New-TryagainNew 
        }
        ElseIf ($?) { 
            Get-Infomessage "Extracted" 'MCRCon'
            Write-log "Extracting MCRCon succeeded  "  
        }
    }
    ElseIf (!$mcrconurl -and !$mcrconoutput) {
        Write-log "install-mcrcon Failed: $mcrconurl $mcrconoutput"
        Write-Warning 'fn_install-mcrcon Failed'
        Exit
    }
}