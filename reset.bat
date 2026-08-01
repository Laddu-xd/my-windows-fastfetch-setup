@echo off
cd /d "%~dp0"

:: Auto-elevate to admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting Administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
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

:: Revert PowerShell execution policy
powershell -Command "Set-ExecutionPolicy Restricted -Scope CurrentUser -Force"

echo Done! Restart your terminal.
pause
