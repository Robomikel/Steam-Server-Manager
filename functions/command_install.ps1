
Function Install-ServerFiles {

    Set-Location $global:currentdir\steamcmd\
    If ($global:ANON -eq "yes") {
        .\steamCMD +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir $global:currentdir\$global:server +app_update $global:APPID $global:Branch +Exit
    }
    Else {
        .\steamCMD +@ShutdownOnFailedCommand 1 +login $global:username +force_install_dir $global:currentdir\$global:server +app_update $global:APPID $global:Branch +Exit
    }


    Set-Location $global:currentdir
}
