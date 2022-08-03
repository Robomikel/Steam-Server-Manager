
#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-MontiorJob {
    Write-log "Function: $($MyInvocation.Mycommand)"
    Write-Host "Run Task only when user is logged on"
    If ((Test-Path "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe")) {
        $posh = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
        $Action = New-ScheduledTaskAction -Execute "$posh" -Argument "`"If (!(Get-Process '$process')) {$currentdir\ssm.ps1 monitor $serverfiles }`"" -WorkingDirectory "$currentdir"
        $Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).Date -RepetitionInterval (New-TimeSpan -Minutes 5) 
        $Settings = New-ScheduledTaskSettingsSet -ExecutionTimeLimit '00:00:00'
        $Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
        Get-Infomessage "Creating Task" 'start'
        Register-ScheduledTask -TaskName "$serverfiles $command" -InputObject $Task | Out-File -Append -Encoding Default  $ssmlog
        If ($?) {
            clear-hostline 1
            Get-Infomessage "Creating Task" 'done'
        }
        Else {
            clear-hostline 1
            Get-Infomessage "Creating Task" $false
        }
    }
}
Function New-MontiorJobBG {
    Write-log "Function: $($MyInvocation.Mycommand)"
    If ($env:UserName -and $env:COMPUTERNAME) {  
        $UserName = "$env:COMPUTERNAME\$env:UserName"
        Write-Host "Run Task Whether user is logged on or not"
        Write-Host "Username: $env:COMPUTERNAME\$env:UserName"
        $SecurePassword = Read-Host "Password: " -AsSecureString
        If ($UserName -and $SecurePassword) {
            If ((Test-Path "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe")) {
                $posh = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
                $Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $UserName, $SecurePassword 
                $Action = New-ScheduledTaskAction -Execute "$posh" -Argument "`"If (!(Get-Process '$process')) {$currentdir\ssm.ps1 monitor $serverfiles  }`"" -WorkingDirectory "$currentdir"
                $Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).Date -RepetitionInterval (New-TimeSpan -Minutes 5) 
                $Settings = New-ScheduledTaskSettingsSet -ExecutionTimeLimit '00:00:00'
                $Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
                Get-Infomessage "Creating Task" 'start'
                Register-ScheduledTask -TaskName "$serverfiles $command" -InputObject $Task -User "$UserName" -Password "$($Credentials.GetNetworkCredential().Password)" | Out-File -Append -Encoding Default  $ssmlog
                If ($?) {
                    clear-hostline 1
                    Get-Infomessage "Creating Task" 'done'
                }
                Else {
                    clear-hostline 1
                    Get-Infomessage "Creating Task" $false
                }
            }
        }
    }
}