@echo off
:: Auto-updater for launcher
set "scriptUrl=https://raw.githubusercontent.com/DoubleAAGuy/myscripts/refs/heads/main/start_unblocking.bat"
set "tempScript=%%TEMP%%\start_unblocking_new.bat"
curl -s -L "%%scriptUrl%%" -o "%%tempScript%%"
if exist "%%tempScript%%" ^(
    fc "%%~f0" "%%tempScript%%" ^>nul 2^>^&1
    if !errorlevel! neq 0 ^(
        echo Updating launcher...
        move "%%tempScript%%" "%%~f0" ^>nul
        start "" "%%~f0"
        exit
    ^) else ^(
        del "%%tempScript%%"
    ^)
^)
echo Starting bypass...
:: -D 1080 sets up the SOCKS proxy
:: -pw password67 handles the authentication
:: -batch prevents interactive prompts
:: -N ensures no shell is opened
start "" /b "%%USERPROFILE%%\Desktop\BravePortable\plink.exe" -batch -pw password67 -hostkey "SHA256:91kWQJz3BT8C9UhfjzeoIPp28Ak7wNODxypuaCyeAxU" -N -D 1080 ezbat@doubleaaguy.duckdns.org
echo Launching Brave...
start "" "%exePath%"
exit
