
Function Install-Anonserver {
    If ($global:ANON -eq "no") {
        Write-Host "Enter Username for Steam install, Steam.exe will prompt for Password and Steam Gaurd" -F Cyan -B Black
        $global:username = Read-host
    }
    Write-Host '****    Creating SteamCMD Run txt   *****' -F M -B Black 
    New-Item $global:currentdir\SteamCMD\Updates-$global:server.txt -Force
    Add-Content  $global:currentdir\SteamCMD\Updates-$global:server.txt  "@ShutdownOnFailedCommand 1"
    if ($global:ANON -ne "no") {
        Add-Content  $global:currentdir\SteamCMD\Updates-$global:server.txt  "@NoPromptForPassword 1"  
    }
 
    If ($global:ANON -eq "no") { 
        Add-Content  $global:currentdir\SteamCMD\Updates-$global:server.txt  "login $global:username" 
    }
    Else {
        Add-Content  $global:currentdir\SteamCMD\Updates-$global:server.txt  "login anonymous"
    }
    Add-Content  $global:currentdir\SteamCMD\Updates-$global:server.txt  "force_install_dir $global:currentdir\$global:server"
    Add-Content  $global:currentdir\SteamCMD\Updates-$global:server.txt  "app_update $global:APPID $global:Branch"
    Add-Content  $global:currentdir\SteamCMD\Updates-$global:server.txt  "Exit"
    New-Item  $global:currentdir\SteamCMD\Validate-$global:server.txt -Force
    Add-Content  $global:currentdir\SteamCMD\Validate-$global:server.txt  "@ShutdownOnFailedCommand 1"
    If ($global:ANON -ne "no") { 
        Add-Content  $global:currentdir\SteamCMD\Validate-$global:server.txt  "@NoPromptForPassword 1"
    }
    If ($global:ANON -eq "no") { 
        Add-Content  $global:currentdir\SteamCMD\Validate-$global:server.txt  "login $global:username" 
    }
    Else {
        Add-Content  $global:currentdir\SteamCMD\Validate-$global:server.txt  "login anonymous"
    }
    Add-Content  $global:currentdir\SteamCMD\Validate-$global:server.txt  "force_install_dir $global:currentdir\$global:server"
    Add-Content  $global:currentdir\SteamCMD\Validate-$global:server.txt  "app_update $global:APPID $global:Branch validate"
    Add-Content  $global:currentdir\SteamCMD\Validate-$global:server.txt  "Exit"
    New-Item  $global:currentdir\SteamCMD\Buildcheck-$global:server.txt -Force
    Add-Content  $global:currentdir\SteamCMD\Buildcheck-$global:server.txt  "app_info_update 1"
    Add-Content  $global:currentdir\SteamCMD\Buildcheck-$global:server.txt  "app_info_print $global:APPID"
    Add-Content  $global:currentdir\SteamCMD\Buildcheck-$global:server.txt  "quit"
    Get-UpdateServer
    
}