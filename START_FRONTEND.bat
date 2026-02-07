@echo off
echo ========================================
echo Starting TaskFlow Frontend
echo ========================================
echo.

cd Frontend

echo Checking Node.js installation...
node --version
if errorlevel 1 (
    echo ERROR: Node.js is not installed or not in PATH
    pause
    exit /b 1
)

echo.
echo Installing dependencies (this may take a few minutes on first run)...
call npm install
if errorlevel 1 (
    echo ERROR: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo ========================================
echo Starting development server...
echo Frontend will be available at: http://localhost:5173
echo Press Ctrl+C to stop the server
echo ========================================
echo.

call npm run dev

pause
