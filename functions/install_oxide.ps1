#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-Oxide {
    If (($oxiderustlatestlink) -and ($oxideoutput)) {
        $start_time = Get-Date
        $global:package = 'Oxide'
        $global:infomessage = "Downloading"
        Get-Infomessage
        # Write-Host '****   Downloading Oxide   ****' -F M -B Black
        #(New-Object Net.WebClient).DownloadFile("$oxiderustlatestlink", "$currentdir\oxide.zip")
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
        Invoke-WebRequest -Uri $oxiderustlatestlink -OutFile $oxideoutput
        If (!$?) {
            $global:warnmessage = 'Downloadfailed'
            Get-WarnMessage 
            # Write-Host "****   Downloading Oxide Failed !!   ****" -F R -B Black
            New-TryagainNew
        } 
        Write-Host "Download Time: $((Get-Date).Subtract($start_time).Seconds) second(s)" -F Y -B Black
        $global:infomessage = "Extracting"
        Get-Infomessage
        # Write-Host '****   Extracting Oxide    ****' -F M -B Black
        Expand-Archive $oxideoutput $oxidedirectory -Force
        If (!$?) { 
            $global:warnmessage = 'ExtractFailed'
            Get-WarnMessage
            New-TryagainNew
        }

        # Write-Host '****   Copying Oxide *****' -F M -B Black
        Add-Content $ssmlog "[$loggingdate] Copying Oxide"
        Copy-Item  $currentdir\oxide\RustDedicated_Data\* -Destination $systemdir -Force -Recurse
        If (!$?) { 
            # Write-Host "****   Copying Oxide Failed !!   ****" -F R -B Black
            Add-Content $ssmlog "[$loggingdate] Copying Oxide Failed"
            New-TryagainNew
        }
    }
}