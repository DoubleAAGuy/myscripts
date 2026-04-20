@echo off
echo Starting bypass...
:: -D 1080 sets up the SOCKS proxy
:: -pw password67 handles the authentication
:: -batch prevents interactive prompts
:: -N ensures no shell is opened
start "" /b "\BravePortable\plink.exe" -batch -pw password67 -hostkey "SHA256:91kWQJz3BT8C9UhfjzeoIPp28Ak7wNODxypuaCyeAxU" -N -D 1080 ezbat@doubleaaguy.duckdns.org
echo Launching Brave...
start "" "%exePath%"
exit
