@echo off
title Student Performance Analysis System - Setup
color 0B

echo.
echo  =====================================================
echo   Student Performance Analysis System - SETUP
echo   First-time environment configuration
echo  =====================================================
echo.

:: ─── Check Node.js ───────────────────────────────────
echo [1/4] Checking Node.js installation...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo  [ERROR] Node.js is NOT installed!
    echo          Download it from: https://nodejs.org
    echo.
    pause
    exit /b 1
)
for /f "tokens=*" %%v in ('node --version') do set NODE_VER=%%v
echo        Found Node.js %NODE_VER%  OK

:: ─── Check npm ────────────────────────────────────────
echo [2/4] Checking npm...
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERROR] npm not found. Please reinstall Node.js.
    pause
    exit /b 1
)
for /f "tokens=*" %%v in ('npm --version') do set NPM_VER=%%v
echo        Found npm v%NPM_VER%  OK

:: ─── Install dependencies ─────────────────────────────
echo.
echo [3/4] Installing npm dependencies...
echo        (This may take a minute on first run)
echo.
cd /d "%~dp0"
npm install
if %errorlevel% neq 0 (
    echo.
    echo  [ERROR] npm install failed. Check your internet connection.
    pause
    exit /b 1
)
echo.
echo        Dependencies installed  OK

:: ─── Seed database ────────────────────────────────────
echo.
echo [4/4] Seeding MongoDB with sample data...
echo        ^> Make sure MongoDB is running on localhost:27017
echo.
npm run seed
if %errorlevel% neq 0 (
    echo.
    echo  [WARNING] Seeding failed. MongoDB may not be running.
    echo           Start MongoDB and run:  npm run seed
    echo           Then launch with:       start.bat
    echo.
    pause
    exit /b 1
)

:: ─── Done ─────────────────────────────────────────────
echo.
echo  =====================================================
echo   Setup Complete!
echo  =====================================================
echo.
echo   Next step: Run  start.bat  to launch the app.
echo.
echo   Or manually:  node server.js
echo   Then open:    http://localhost:5000
echo.
pause
