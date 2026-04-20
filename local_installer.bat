@echo off
setlocal

set "url=https://raw.githubusercontent.com/DoubleAAGuy/myscripts/refs/heads/main/installer.bat"
set "tempfile=%TEMP%\installer.bat"

echo [1/3] Downloading via BITS...

:: BITSAdmin is a native Windows tool for file transfers
bitsadmin /transfer "MyDownload" /priority FOREGROUND "%url%" "%tempfile%"

if %ERRORLEVEL% neq 0 (
    echo [ERROR] BITS download failed.
    pause
    exit /b 1
)

echo [2/3] Running installer...
if exist "%tempfile%" (
    call "%tempfile%"
) else (
    echo [ERROR] File not found after download.
    pause
)

echo [3/3] Cleaning up...
del /f /q "%tempfile%" 2>nul

endlocal
