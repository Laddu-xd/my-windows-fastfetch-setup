@echo off
:: --- Set UTF-8 encoding ---
chcp 65001 >nul

:: --- Clear the screen ---
cls

:: --- Run Fastfetch with your custom config (if available) ---
where fastfetch >nul 2>nul
if %errorlevel%==0 (
    fastfetch -c "%USERPROFILE%\.config\fastfetch\config.jsonc"
)
