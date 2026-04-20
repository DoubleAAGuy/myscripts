@echo off
setlocal

set "url=https://raw.githubusercontent.com/DoubleAAGuy/myscripts/refs/heads/main/installer.bat"
set "tempfile=%TEMP%\installer.bat"

powershell -NoProfile -Command ^
    "Try { (New-Object System.Net.WebClient).DownloadFile('%url%', '%tempfile%') } Catch { Exit 1 }"

if not exist "%tempfile%" (
    echo Failed to download installer.
    exit /b 1
)

call "%tempfile%"
del /f /q "%tempfile%" 2>nul
endlocal
