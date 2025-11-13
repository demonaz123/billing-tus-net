@echo off
REM Billing System - Start Local Server (Windows)

echo.
echo ====================================================
echo   Billing System - Local Development Server
echo ====================================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python tidak terinstall atau tidak ada di PATH!
    echo Silahkan install Python terlebih dahulu dari https://www.python.org
    echo.
    pause
    exit /b 1
)

REM Get the directory of this script
cd /d "%~dp0"

echo. Starting server...
echo.

REM Run Python server
python start_server.py

pause
