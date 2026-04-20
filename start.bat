@echo off
title Student Performance Analysis System
color 0A

echo.
echo  =====================================================
echo   Student Performance Analysis System v1.0
echo   Starting server...
echo  =====================================================
echo.

cd /d "%~dp0"

:: ─── Check node_modules ──────────────────────────────
if not exist "node_modules\" (
    echo  [WARNING] Dependencies not installed.
    echo            Running setup first...
    echo.
    call setup.bat
)

:: ─── Check MongoDB availability (basic ping) ──────────
echo  Verifying MongoDB connection...
mongosh --eval "db.runCommand({ ping: 1 })" --quiet >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo  [WARNING] Could not reach MongoDB at localhost:27017.
    echo           Make sure MongoDB Community Server is running.
    echo           You can still try launching - the server will
    echo           show a detailed error if unable to connect.
    echo.
)

:: ─── Start the server ─────────────────────────────────
echo.
echo  Launching Node.js server on http://localhost:5000 ...
echo  Press Ctrl+C to stop the server.
echo.

:: Open browser after 2 seconds
start "" /b cmd /c "timeout /t 2 /nobreak >nul && start http://localhost:5000"

:: Start the Node.js server (keeps window open)
node server.js

echo.
echo  Server stopped. Press any key to exit.
pause >nul
