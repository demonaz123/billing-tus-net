# Billing System - Start Local Server (PowerShell)

Write-Host ""
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host "  Billing System - Local Development Server" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host ""

# Check if Python is installed
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✓ Python ditemukan: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Error: Python tidak terinstall atau tidak ada di PATH!" -ForegroundColor Red
    Write-Host "Silahkan install Python terlebih dahulu dari https://www.python.org" -ForegroundColor Red
    Write-Host ""
    Read-Host "Tekan ENTER untuk keluar"
    exit 1
}

# Change to script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

Write-Host "✓ Direktori: $ScriptDir" -ForegroundColor Green
Write-Host ""
Write-Host "Starting server..." -ForegroundColor Yellow
Write-Host ""

# Run Python server
python start_server.py

Read-Host "Tekan ENTER untuk keluar"
