
#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function New-MontiorJob {
    Write-log "Function: New-MontiorJob"
    Write-Host "Run Task only when user is logged on"
    $Action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument "`"If (!(Get-Process '$process')) {$ssmwd\ssm.ps1 monitor $serverfiles }`"" -WorkingDirectory "$ssmwd"
    $Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).Date -RepetitionInterval (New-TimeSpan -Minutes 5) 
    $Settings = New-ScheduledTaskSettingsSet -ExecutionTimeLimit '00:00:00'
    $Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
    Get-Infomessage "Creating Task" 'start'
    Register-ScheduledTask -TaskName "$serverfiles $command" -InputObject $Task | Out-File -Append -Encoding Default  $ssmlog
    If ($?){
        Get-Infomessage "Creating Task" 'done'
    } Else{
        Get-Infomessage "Creating Task" $false
    }
}
Function New-MontiorJobBG {
    Write-log "Function: New-MontiorJobBG"
    If ($env:UserName -and $env:COMPUTERNAME) {  
        $UserName = "$env:COMPUTERNAME\$env:UserName"
        Write-Host "Run Task Whether user is logged on or not"
        Write-Host "Username: $env:COMPUTERNAME\$env:UserName"
        $SecurePassword = $password = Read-Host "Password " -AsSecureString
        If ($UserName -and $SecurePassword) {
            $Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $UserName, $SecurePassword
            $Password = $Credentials.GetNetworkCredential().Password 
            $Action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument "`"If (!(Get-Process '$process')) {$ssmwd\ssm.ps1 monitor $serverfiles  }`"" -WorkingDirectory "$ssmwd"
            $Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).Date -RepetitionInterval (New-TimeSpan -Minutes 5) 
            $Settings = New-ScheduledTaskSettingsSet -ExecutionTimeLimit '00:00:00'
            $Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
            Get-Infomessage "Creating Task" 'start'
            Register-ScheduledTask -TaskName "$serverfiles $command" -InputObject $Task -User "$UserName" -Password "$Password" | Out-File -Append -Encoding Default  $ssmlog
            If ($?){
                Get-Infomessage "Creating Task" 'done'
            } Else{
                Get-Infomessage "Creating Task" $false
            }

        }
    }
}