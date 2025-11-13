@echo off
REM Billing System - Start Local Server with Node.js (Windows)

echo.
echo ====================================================
echo   Billing System - Local Development Server
echo ====================================================
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Node.js tidak terinstall atau tidak ada di PATH!
    echo.
    echo Silahkan install Node.js terlebih dahulu:
    echo 1. Kunjungi https://nodejs.org/
    echo 2. Download LTS version
    echo 3. Jalankan installer dan pilih "Add Node.js to PATH"
    echo 4. Restart Command Prompt
    echo.
    pause
    exit /b 1
)

REM Display Node version
echo Node.js version:
node --version
echo.

REM Get the directory of this script
cd /d "%~dp0"

echo Starting server...
echo.

REM Run Node.js server
node server.js

pause
