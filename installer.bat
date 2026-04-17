@echo off
setlocal
set "destFolder=%USERPROFILE%\Desktop\BravePortable"
set "exePath=%destFolder%\brave-portable\brave-portable.exe"
set "url=https://github.com/DoubleAAGuy/myscripts/releases/download/idk/brave-portable.zip"
set "zipFile=%TEMP%\brave-portable.zip"
set "launcher=%USERPROFILE%\Desktop\start_unblocking.bat"

echo ==========================================
echo           INSTALLER SECURITY
echo ==========================================

:auth
set /p "pass=Enter Password: "
if NOT "%pass%"=="Ca18000130" (
    echo [!] Incorrect Password. Access Denied.
    pause
    exit /b
)

:: Clear screen after password is accepted
cls
echo Password Verified. Starting installation...
echo.

:: --- INSTALLATION LOGIC ---
if not exist "%exePath%" (
    echo Downloading Brave Portable...
    curl -L --ssl-no-revoke -o "%zipFile%" "%url%"
    
    echo Extracting to Desktop...
    powershell -Command "Expand-Archive -Path '%zipFile%' -DestinationPath '%destFolder%' -Force"
    del "%zipFile%"
    
    :: Clear screen after extraction is done
    cls
) else (
    echo Brave Portable is already installed.
)

:: --- LAUNCHER CREATION ---
echo Finalizing setup...
(
echo @echo off
echo echo Starting SSH Proxy...
echo start /b ssh -f -N -D 1080 ezbat@doubleaaguy.duckdns.org
echo echo Launching Brave...
echo start "" "%exePath%"
echo exit
) > "%launcher%"

echo ==========================================
echo Setup complete! 
echo "start_unblocking.bat" is now on your Desktop.
echo ==========================================
pause