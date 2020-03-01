#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function install-mcrcon {
    If (($mcrconurl) -and ($mcrconoutput)) {
        $start_time = Get-Date
        $global:package = 'MCRCon'
        $global:infomessage = "downloading"
        Get-Infomessage
        Add-Content $ssmlog "[$loggingdate] Downloading MCRCon from github" 
        #(New-Object Net.WebClient).DownloadFile("$metamodurl", "$currentdir\metamod.zip")
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        Invoke-WebRequest -Uri $mcrconurl -OutFile $mcrconoutput
        If (!$?) {
            Write-Warning 'Downloading  MCRCon Failed'
            Add-Content $ssmlog "[$loggingdate] Downloading  MCRCon Failed"
            New-TryagainNew 
        }
        If ($?) {
            $global:infomessage = "downloaded"
            Get-Infomessage
            Add-Content $ssmlog "[$loggingdate] MCRCon succeeded " 
        }
        $global:infomessage = "downloadtime"
        Get-Infomessage
        $global:infomessage = "Extracting"
        Get-Infomessage
        Expand-Archive "$mcrconoutput" "$mcrcondirectory" -Force 3>&1 2>&1 >>  $ssmlog
        Copy-Item  "$currentdir\mcrcon\mcrcon-0.7.1-windows-x86-32\*" -Destination $mcrcondirectory -Recurse -Force 3>&1 2>&1 >>  $ssmlog
        Remove-Item "$currentdir\mcrcon\mcrcon-0.7.1-windows-x86-32" -Recurse -Force 3>&1 2>&1 >>  $ssmlog
        If (!$?) {
            Write-Warning 'Extracting MCRCon Failed'
            Add-Content $ssmlog "[$loggingdate] Extracting MCRCon Failed " 
            New-TryagainNew 
        }
        If ($?) { 
            $global:infomessage = "Extracted"
            Get-Infomessage
            Add-Content $ssmlog "[$loggingdate] Extracting MCRCon succeeded  "  
        }
    }
    ElseIf (!($mcrconurl) -and ($mcrconoutput)) {
        Add-Content $ssmlog "[$loggingdate] install-mcrcon Failed: $mcrconurl $mcrconoutput"
        Write-Warning 'fn_install-mcrcon Failed'
        Exit
    }
}