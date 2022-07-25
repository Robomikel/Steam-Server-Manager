#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function install-mcrcon {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($mcrconowner -and $mcrconrepo ) {
        #(New-Object Net.WebClient).DownloadFile("$metamodurl", "$currentdir\metamod.zip")
        #[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        #Invoke-WebRequest -Uri $mcrconurl -OutFile $mcrconoutput
        Get-GithubRestAPI $mcrconowner $mcrconrepo
        Write-log "Downloading MCRCon from github" 
        $start_time = Get-Date
        Get-Infomessage "downloading" 'MCRCon'
        try { 
            iwr $githubrepoziplink -O $currentdir\$githubrepozipname 
            If ($?) {
                Get-Infomessage "downloaded" 'MCRCon'
                Write-log "MCRCon succeeded " 
            }
        }
        catch { 
            Write-log "$($_.Exception.Message)" 
            Write-Warning 'Downloading  MCRCon Failed'
            Write-log "Downloading  MCRCon Failed"
            New-TryagainNew 
        }
        Get-Infomessage "downloadtime"
        Get-Infomessage "Extracting" 'MCRCon'
        Expand-Archive $currentdir\$githubrepozipname $currentdir\$githubrepofolder -Force 
        Copy-Item  "$currentdir\$githubrepofolder\$githubrepofolder" -Destination $mcrcondirectory -Recurse -Force 
        Remove-Item "$currentdir\$githubrepofolder" -Recurse -Force 
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
    Else {
        Write-log "install-mcrcon Failed: $mcrconurl $githubrepozipname"
        Write-Warning 'fn_install-mcrcon Failed'
        Exit
    }
}
