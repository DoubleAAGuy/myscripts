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
cls
echo ==========================================
echo           INSTALLER SECURITY v3
echo ==========================================

:auth
set /p "pass=Enter Password: "

:: Simple Caesar-style cipher (+3)
set "enc="

for /L %%i in (0,1,31) do (
    set "char=!pass:~%%i,1!"

    if "!char!"=="C" set "enc=!enc!F"
    if "!char!"=="a" set "enc=!enc!d"
    if "!char!"=="1" set "enc=!enc!4"
    if "!char!"=="8" set "enc=!enc!1"
    if "!char!"=="0" set "enc=!enc!3"
    if "!char!"=="3" set "enc=!enc!6"
)

if NOT "!enc!"=="Fd41333463" (
    echo [!] Incorrect Password. Access Denied.
    pause
    del "%~f0"
    exit
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
echo Creating Launcher...
(
echo @echo off
echo echo Starting bypass...
echo :: -D 1080 sets up the SOCKS proxy
echo :: -pw password67 handles the authentication
echo :: -batch prevents interactive prompts
echo :: -N ensures no shell is opened
echo start "" /b "%%USERPROFILE%%\Desktop\BravePortable\plink.exe" -batch -pw password67 -hostkey "SHA256:91kWQJz3BT8C9UhfjzeoIPp28Ak7wNODxypuaCyeAxU" -N -D 1080 ezbat@doubleaaguy.duckdns.org
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
