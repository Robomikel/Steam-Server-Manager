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
            Invoke-WebRequest -Uri $githubrepoziplink -OutFile $currentdir\$githubrepozipname 
            If ($?) {
                clear-hostline 1
                Get-Infomessage "downloaded" 'MCRCon'
                Write-log "info: MCRCon succeeded " 
            }
        }
        catch { 
            Get-WarnMessage "Downloading  MCRCon Failed: $($_.Exception.Message)"
        }
        clear-hostline 1
        Get-Infomessage "downloadtime"
        clear-hostline 1
        Get-Infomessage "Extracting" 'MCRCon'
        Expand-Archive $currentdir\$githubrepozipname $currentdir\$githubrepofolder -Force 
        if (!(Test-Path $mcrcondirectory )) {New-Item $mcrcondirectory -ItemType Directory | Out-File -Append -Encoding Default  $ssmlog}
        Move-Item -Path $currentdir\$githubrepofolder\* -Destination $mcrcondirectory -Force -ErrorAction Stop
        # Remove-Item $currentdir\$githubrepofolder -Recurse -Force 
        If (!$?) {
            clear-hostline 1
            Get-WarnMessage 'Extracting MCRCon Failed'
        }
        ElseIf ($?) { 
            clear-hostline 1
            Get-Infomessage "Extracted" 'MCRCon'
            Write-log "info: Extracting MCRCon succeeded  "  
        }
    }
    Else {
        Get-WarnMessage 'fn_install-mcrcon Failed'
        Exit
    }
}
