@echo off
setlocal enabledelayedexpansion

REM Billing System - Simple HTTP Server Setup for Windows

cls
echo.
echo ====================================================
echo   Billing System - Setup & Launch Guide
echo ====================================================
echo.

REM Check if file exists
if not exist "%~dp0index.html" (
    echo Error: index.html not found!
    echo.
    echo Please make sure you're in the correct directory:
    echo %~dp0
    pause
    exit /b 1
)

echo Choose how to open Billing System:
echo.
echo 1. Open index.html directly (file://)
echo 2. Start HTTP Server (if Python is installed)
echo 3. Open in Default Browser (current directory)
echo.

set /p choice="Enter your choice (1-3): "

if "%choice%"=="1" (
    echo.
    echo Opening index.html...
    start "" "%~dp0index.html"
    echo.
    echo File opened! You can view it in your browser.
    echo.
    echo Note: Some features may not work with file:// protocol.
    echo For full functionality, use Option 2 or 3.
    pause
) else if "%choice%"=="2" (
    echo.
    echo Checking for Python...
    python --version >nul 2>&1
    if %errorlevel% neq 0 (
        echo.
        echo Error: Python is not installed or not in PATH!
        echo.
        echo To install Python:
        echo 1. Visit https://www.python.org/downloads/
        echo 2. Download Python 3.9 or higher
        echo 3. Run installer and CHECK "Add Python to PATH"
        echo 4. Restart Command Prompt
        echo.
        pause
        exit /b 1
    )
    
    echo.
    echo Starting HTTP Server on port 8000...
    echo.
    echo URL: http://localhost:8000
    echo.
    echo Press CTRL+C to stop server
    echo.
    
    cd /d "%~dp0"
    python -m http.server 8000
) else if "%choice%"=="3" (
    echo.
    echo Opening in browser...
    start "" "file:///%~dp0index.html"
    echo.
    echo Website opened!
    pause
) else (
    echo.
    echo Invalid choice!
    pause
    goto :eof
)

pause
