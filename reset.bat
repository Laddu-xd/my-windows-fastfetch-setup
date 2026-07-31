@echo off

:: Request admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Please run this script as Administrator!
    pause
    exit
)

:: Remove fastfetch config and ascii
del /F /Q "%USERPROFILE%\.config\fastfetch\config.jsonc"
del /F /Q "%USERPROFILE%\.config\fastfetch\bb.txt"

:: Remove PowerShell profile
del /F /Q "%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

:: Remove CMD profile
del /F /Q "%USERPROFILE%\.config\cmd_profile.bat"

:: Remove registry entry for CMD startup
reg delete "HKCU\Software\Microsoft\Command Processor" /v AutoRun /f

:: Remove JetBrains Mono Nerd Font
del /F /Q "%WINDIR%\Fonts\JetBrainsMonoNerdFont-Regular.ttf"
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "JetBrainsMono Nerd Font Regular" /f

echo Done! Restart your terminal.
pause