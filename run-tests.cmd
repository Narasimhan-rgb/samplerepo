@echo off
setlocal EnableExtensions

REM SafeAudit AI local verification command for Windows CMD.
set "ROOT=%~dp0"
cd /d "%ROOT%backend"

if not exist ".venv\Scripts\python.exe" (
    echo ERROR: Backend virtual environment was not found.
    echo Run run-demo.cmd once from the repository root first.
    pause
    exit /b 1
)

call .venv\Scripts\activate.bat
set "PYTHONPATH=."
python -m unittest discover -s tests -v

if errorlevel 1 (
    echo.
    echo Tests failed. Read the output above.
    pause
    exit /b 1
)

echo.
echo All SafeAudit backend unit tests passed.
pause
