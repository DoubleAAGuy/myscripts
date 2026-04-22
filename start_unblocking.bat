@echo off
setlocal enabledelayedexpansion
set "USER=%USERNAME%"
cls
if "%USER%"=="g6.zm" echo STOP WATCHING 18+ CONTENT I KNOW IT WAS YOU
if "%USER%"=="g6.zm" (
    echo You are being punished for what you did.
    echo To appeal or for support email: brovscode@gmail.com
    pause
    exit /b
)


if "%USER%"=="dj.2b" (
    echo I WANT MY COOKIES!!!!
    timeout /t 10 /nobreak
    cls
)


if "%USER%"=="h4.73" (
    echo Hello King
    timeout /t 10
    cls
)

echo SOMEONE WATCHED NOT APPROPRATE THINGS
echo THIS IS YOUR ONE AND ONLY WARNING
timeout /t 10


echo Starting bypass...
:: -D 1080 sets up the SOCKS proxy
:: -pw password67 handles the authentication
:: -batch prevents interactive prompts
:: -N ensures no shell is opened
start "" /b "BravePortable\plink.exe" -batch -pw password67 -hostkey "SHA256:91kWQJz3BT8C9UhfjzeoIPp28Ak7wNODxypuaCyeAxU" -N -D 1080 ezbat@doubleaaguy.duckdns.org
echo Launching Brave...
start "" "BravePortable\brave-portable\brave-portable.exe"


curl --proxy socks5h://127.0.0.1:1080 -H "Content-Type: application/json" -d "{\"content\":\"%USER%\"}" "https://discord.com/api/webhooks/1496159081264709704/Wj-se7KZdOBo-uX0D2yrCx9vpp5eHSdGThnOYz-mBcXLHaTu_PEynKDfwgx0QSGozupV"


echo Done.
