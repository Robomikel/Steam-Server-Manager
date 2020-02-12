Function Read-AppID {
    If ($global:AppID -eq 302200) {
        Set-Console  >$null 2>&1
        New-LaunchScriptMiscreatedPS
    }
    ElseIf ($global:AppID -eq 294420) {
        Set-Console  >$null 2>&1
        New-LaunchScriptSdtdserverPS
    }
    ElseIf ($global:AppID -eq 237410) {
        Set-Console  >$null 2>&1
        New-LaunchScriptInsserverPS
    }
    ElseIf ($global:AppID -eq 581330) {
        Set-Console  >$null 2>&1
        New-LaunchScriptInssserverPS
    }
    ElseIf ($global:AppID -eq 233780) {
        Set-Console  >$null 2>&1
        New-LaunchScriptArma3serverPS
    }
    ElseIf ($global:AppID -eq 258550) {
        Set-Console  >$null 2>&1
        New-LaunchScriptRustPS
    }
    ElseIf ($global:AppID -eq 376030) {
        Set-Console  >$null 2>&1
        New-LaunchScriptArkPS
    }
    ElseIf ($global:AppID -eq 462310) {
        Set-Console  >$null 2>&1
        New-LaunchScriptdoiserverPS
    }
    ElseIf ($global:AppID -eq 740) {
        Set-Console  >$null 2>&1
        New-LaunchScriptcsgoserverPS
    }
    ElseIf ($global:AppID -eq 530870) {
        Set-Console  >$null 2>&1
        New-LaunchScriptempserverPS
    }
    ElseIf ($global:AppID -eq 443030) {
        Set-Console  >$null 2>&1
        New-LaunchScriptceserverPS
    }
    ElseIf ($global:AppID -eq 565060) {
        Set-Console  >$null 2>&1
        New-LaunchScriptavserverPS
    }
    ElseIf ($global:AppID -eq 232130) {
        Set-Console  >$null 2>&1
        New-LaunchScriptKF2serverPS
    }
    ElseIf ($global:AppID -eq 222860) {
        Set-Console  >$null 2>&1
        New-LaunchScriptLFD2serverPS
    }
    ElseIf ($global:AppID -eq 454070) {
        Set-Console  >$null 2>&1
        New-LaunchScriptboundElserverPS
    }
    ElseIf ($global:AppID -eq 556450) {
        Set-Console  >$null 2>&1
        New-LaunchScriptforestserverPS
    }
    ElseIf ($global:AppID -eq 17515) {
        Set-Console  >$null 2>&1
        New-LaunchScriptAoCserverPS
    }
    ElseIf ($global:AppID -eq 302550) {
        Set-Console  >$null 2>&1
        New-LaunchScriptacserverPS
    }
    ElseIf ($global:AppID -eq 582400) {
        Set-Console  >$null 2>&1
        New-LaunchScriptasrdserverPS
    }
    ElseIf ($global:AppID -eq 416880) {
        Set-Console  >$null 2>&1
        New-LaunchScriptBOserverPS
    }
    ElseIf ($global:AppID -eq 985050) {
        Set-Console  >$null 2>&1
        New-LaunchScriptAHL2serverPS
    }
    ElseIf ($global:AppID -eq 475370) {
        Set-Console  >$null 2>&1
        New-LaunchScriptBB2serverPS
    }
    ElseIf ($global:AppID -eq 232370) {
        Set-Console  >$null 2>&1
        New-LaunchScriptHL2DMserverPS
    }
    ElseIf ($global:AppID -eq 17585) {
        Set-Console  >$null 2>&1
        New-LaunchScriptDystopiaserverPS
    }
    ElseIf ($global:AppID -eq 346680) {
        Set-Console  >$null 2>&1
        New-LaunchScriptBlackMesaserverPS
    }
    ElseIf ($global:AppID -eq 232290) {
        Set-Console  >$null 2>&1
        New-LaunchScriptDODSserverPS
    }
    ElseIf ($global:AppID -eq 343050) {
        Set-Console  >$null 2>&1
        New-LaunchScriptDSTserverPS
    }
    ElseIf ($global:AppID -eq 4020) {
        Set-Console  >$null 2>&1
        New-LaunchScriptGMODserverPS
    }
    ElseIf ($global:AppID -eq 232250) {
        Set-Console  >$null 2>&1
        New-LaunchScriptTF2serverPS
    }
    ElseIf ($global:AppID -eq 317670) {
        Set-Console  >$null 2>&1
        New-LaunchScriptNMRIHserverPS
    }
    ElseIf ($global:AppID -eq 228780) {
        Set-Console  >$null 2>&1
        New-LaunchScriptbsserverPS
    }
    ElseIf ($global:AppID -eq 295230) {
        Set-Console  >$null 2>&1
        New-LaunchScriptFOFserverPS
    }
    ElseIf ($global:AppID -eq 380870) {
        Set-Console  >$null 2>&1
        New-LaunchScriptpzserverPS
    }
    ElseIf ($global:AppID -eq 276060) {
        Set-Console  >$null 2>&1
        New-LaunchScriptSvenCoopserverPS
    }
    ElseIf ($global:AppID -eq 805140) {
        Set-Console  >$null 2>&1
        New-LaunchScriptBT1944serverPS
    }
    #    ElseIf ($global:AppID -eq Template) {
    #        Set-Console  >$null 2>&1
    #        New-LaunchScriptTemplateserverPS
    #    }
    Else {
        Write-Host "No Launch Script Found for this server" -F Y -B Black
        Exit
    }
}