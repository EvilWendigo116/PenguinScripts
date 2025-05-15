@echo off
:: Fetch the public IP address
for /f "delims=" %%i in ('curl -s https://api.ipify.org') do set "IP=%%i"

:: Send the IP address to the webhook
curl -s -X POST -H "Content-Type: application/json" -d "{\"ip_address\":\"%IP%\"}" ^
REM enter webhook site >nul

:: Check if the previous command succeeded
if %errorlevel%==0 (
    echo IP address %IP% sent to webhook.
) else (
    echo Failed to send IP address.
)
