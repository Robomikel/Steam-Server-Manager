#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-StartServer {
    param(
        # [string]
        [Parameter(Mandatory = $true, Position = 0)]
        # [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)] 
        $launchParams
    )
    If ($log -eq "1") {New-ServerLog}
    Set-Location $currentdir\$serverfiles\
    If ($appid -eq 343050) {Set-Location $currentdir\$serverfiles\$executabledir}
    #Start-Process -FilePath CMD -ArgumentList ("/c $launchParams") -NoNewWindow
    If (( $appid -eq 258550 ) -or ($appid -eq 294420 ) -or ($appid -eq 302550)) {
        Start-Process CMD "/c start $launchParams"
    }
    Else {
        Start-Process CMD "/c start $launchParams"  -NoNewWindow
    }
    Set-Location $currentdir
}
Function Select-StartServer {
    Write-Host '****   Starting Server   *****' -F Y -B Black  
    Get-StartServer $launchParams
}
Function Get-CheckServer {
    If ($global:appid -eq "996560") { 
        Get-checkMultiple 
    }
    Else {
        Write-Host '****   Check  Server process    *****' -F Y -B Black 
        If ($Null -eq (Get-Process "$process" -ea SilentlyContinue)) {
            Write-Host "----   NOT RUNNING   ----" -F R -B Black
        }
        Else {
            Write-Host "****   RUNNING   ****" -F Green -B Black ; ; Get-Process "$process"
            Get-ClearVariables
            Exit 
        }
        Get-CheckForError
    }
}

Function Get-checkMultiple {
    $global:process = get-process | Where-Object { $_.ProcessName -match $process } | get-process
    
    If ($null -eq $process) {
        Write-Host "----   NOT RUNNING   ----" -F R -B Black
    }
    Else {
        Write-Host "****   RUNNING   ****" -F Green -B Black
        $process 
        Get-ClearVariables 
        Exit
    }
}