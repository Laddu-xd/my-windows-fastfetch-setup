@echo off

:: Request admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Please run this script as Administrator!
    pause
    exit
)

:: Install Fastfetch only if not already installed
where fastfetch >nul 2>&1
if %errorlevel% neq 0 (
    echo Fastfetch not found, installing...
    winget install fastfetch-cli.fastfetch
) else (
    echo Fastfetch already installed, skipping...
)

:: Install font only if not already installed
if not exist "%WINDIR%\Fonts\JetBrainsMonoNerdFont-Regular.ttf" (
    echo Installing JetBrains Mono Nerd Font...
    copy /Y "JetBrainsMonoNerdFont-Regular.ttf" "%WINDIR%\Fonts\JetBrainsMonoNerdFont-Regular.ttf"
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "JetBrainsMono Nerd Font Regular" /t REG_SZ /d "JetBrainsMonoNerdFont-Regular.ttf" /f
) else (
    echo Font already installed, skipping...
)

:: Create fastfetch config directory if it doesn't exist
if not exist "%USERPROFILE%\.config\fastfetch" mkdir "%USERPROFILE%\.config\fastfetch"
copy /Y "config.jsonc" "%USERPROFILE%\.config\fastfetch\config.jsonc"
copy /Y "bb.txt" "%USERPROFILE%\.config\fastfetch\bb.txt"

:: Copy PowerShell profile
if not exist "%USERPROFILE%\Documents\WindowsPowerShell" mkdir "%USERPROFILE%\Documents\WindowsPowerShell"
copy /Y "profile.ps1" "%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

:: Copy CMD profile and register it
copy /Y "cmd_profile.bat" "%USERPROFILE%\.config\cmd_profile.bat"
reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d "%USERPROFILE%\.config\cmd_profile.bat" /f

echo Done! Restart your terminal.
pause