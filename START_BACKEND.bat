@echo off
echo ========================================
echo Starting TaskFlow Backend Server
echo ========================================
echo.

cd backend

echo Checking Python installation...
python --version
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    pause
    exit /b 1
)

echo.
echo Installing dependencies (this may take a few minutes on first run)...
pip install -q -r requirements.txt
if errorlevel 1 (
    echo ERROR: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo Initializing database...
python init_db.py
if errorlevel 1 (
    echo ERROR: Failed to initialize database
    pause
    exit /b 1
)

echo.
echo ========================================
echo Starting FastAPI server...
echo Backend will be available at: http://localhost:8000
echo Press Ctrl+C to stop the server
echo ========================================
echo.

uvicorn src.main:app --host 0.0.0.0 --port 8000 --reload

pause
