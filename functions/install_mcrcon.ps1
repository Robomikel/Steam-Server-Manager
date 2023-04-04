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
        Write-log "info: Downloading MCRCon from github" 
        $start_time = Get-Date
        clear-hostline 1
        Get-Infomessage "downloading" 'MCRCon'
        try { 
            iwr $githubrepoziplink -O $currentdir\$githubrepozipname 
            If ($?) {
                clear-hostline 1
                Get-Infomessage "downloaded" 'MCRCon'
                Write-log "info: MCRCon succeeded " 
            }
        }
        catch { 
            Write-log "Warning: $($_.Exception.Message)" 
            Write-Warning 'Downloading  MCRCon Failed'
            Write-log "Failed: Downloading  MCRCon "
            New-TryagainNew 
        }
        clear-hostline 1
        Get-Infomessage "downloadtime"
        clear-hostline 1
        Get-Infomessage "Extracting" 'MCRCon'
        Expand-Archive $currentdir\$githubrepozipname $currentdir\$githubrepofolder -Force 
        if (!(Test-Path $mcrcondirectory )) {New-Item $mcrcondirectory -ItemType Directory | Out-File -Append -Encoding Default  $ssmlog}
        Copy-Item -Path $currentdir\$githubrepofolder\* -Destination $mcrcondirectory -Recurse -Force -ErrorAction Stop
        Remove-Item $currentdir\$githubrepofolder -Recurse -Force 
        If (!$?) {
            Write-Warning 'Extracting MCRCon Failed'
            Write-log "Failed: Extracting MCRCon " 
            New-TryagainNew 
        }
        ElseIf ($?) { 
            clear-hostline 1
            Get-Infomessage "Extracted" 'MCRCon'
            Write-log "info: Extracting MCRCon succeeded  "  
        }
    }
    Else {
        Write-log "Failed: install-mcrcon $mcrconurl $githubrepozipname"
        Write-Warning 'fn_install-mcrcon Failed'
        Exit
    }
}
