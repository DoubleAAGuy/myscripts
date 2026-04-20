@echo off
setlocal enabledelayedexpansion



:: --- CONFIGURATION ---
set "destFolder=%USERPROFILE%\Desktop\BravePortable"
set "exePath=%destFolder%\brave-portable\brave-portable.exe"
set "url=https://github.com/DoubleAAGuy/myscripts/releases/download/idk/brave-portable.zip"
set "zipFile=%TEMP%\brave-portable.zip"
set "launcher=%USERPROFILE%\Desktop\start_unblocking.bat"
set "plinkUrl=https://putty.cs.utah.edu/0.83/w64/plink.exe"
set "plinkDest=%USERPROFILE%\Desktop\BravePortable\plink.exe"

echo ==========================================
echo           INSTALLER SECURITY v1
echo ==========================================

:auth
set /p "pass=Enter Password: "
if NOT "%pass%"=="Ca18000130" (
    echo [!] Incorrect Password. Access Denied.
    pause
    del "%~f0" & exit
)

cls
echo Password Verified. Deploying...

if not exist "%destFolder%" mkdir "%destFolder%"

:: --- INSTALLATION LOGIC ---
if not exist "%exePath%" (
    echo Downloading Brave Portable...
    curl -L --ssl-no-revoke -o "%zipFile%" "%url%"
    
    echo Extracting...
    tar -xf "%zipFile%" -C "%destFolder%"
    
    if %ERRORLEVEL% NEQ 0 (
        echo [!] Extraction failed.
        pause
        exit /b
    )
    del "%zipFile%"
)

:: --- PLINK DOWNLOAD ---
if not exist "%plinkDest%" (
    echo Downloading plink.exe...
    curl -L --ssl-no-revoke -o "%plinkDest%" "%plinkUrl%"
)

:: --- LAUNCHER CREATION ---
echo Creating Launcher with Auto-Update...
(
echo @echo off
echo setlocal enabledelayedexpansion
echo :: Auto-updater for launcher
echo set "scriptUrl=https://raw.githubusercontent.com/DoubleAAGuy/myscripts/refs/heads/main/start_unblocking.bat"
echo set "tempScript=%%TEMP%%\start_unblocking_new.bat"
echo curl -s -L "%%scriptUrl%%" -o "%%tempScript%%"
echo if exist "%%tempScript%%" ^(
echo     for %%%%I in ^("%%tempScript%%"^ text^) do if %%%%~zI GTR 0 ^(
echo         fc "%%~f0" "%%tempScript%%" ^>nul 2^>^&1
echo         if ^!errorlevel^! neq 0 ^(
echo             echo Updating launcher...
echo             move /y "%%tempScript%%" "%%~f0" ^>nul ^& start "" "%%~f0" ^& exit
echo         ^) else ^(
echo             del "%%tempScript%%"
echo         ^)
echo     ^)
echo ^)
echo echo Starting bypass...
echo start "" /b "%plinkDest%" -batch -pw password67 -hostkey "SHA256:91kWQJz3BT8C9UhfjzeoIPp28Ak7wNODxypuaCyeAxU" -N -D 1080 ezbat@doubleaaguy.duckdns.org
echo echo Launching Brave...
echo start "" "%exePath%"
echo exit
) > "%launcher%"

echo ==========================================
echo Setup complete! 
echo Launch "start_unblocking.bat" on your Desktop.
echo ==========================================
pause

:: Self-destruct the installer
del "%~f0" & exit
