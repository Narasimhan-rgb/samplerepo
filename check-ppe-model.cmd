@echo off
setlocal EnableExtensions

REM Validate an authorised custom PPE model before the local pilot.
REM Usage: check-ppe-model.cmd "D:\path\to\ppe-model.pt"
set "ROOT=%~dp0"
set "BACKEND=%ROOT%backend"
set "VENV_PYTHON=%BACKEND%\.venv\Scripts\python.exe"

if "%~1"=="" (
    echo Usage: check-ppe-model.cmd "D:\path\to\ppe-model.pt"
    echo.
    echo The model must include person, helmet, and vest classes.
    pause
    exit /b 1
)

if not exist "%VENV_PYTHON%" (
    echo ERROR: Backend environment was not found.
    echo Run run-demo.cmd once first to create the local environment.
    pause
    exit /b 1
)

if not exist "%~1" (
    echo ERROR: Model file was not found:
    echo %~1
    pause
    exit /b 1
)

cd /d "%BACKEND%"
echo Installing local vision dependencies...
"%VENV_PYTHON%" -m pip install -r requirements-vision.txt
if errorlevel 1 goto :install_error

echo.
echo Checking PPE model labels...
"%VENV_PYTHON%" -m app.scripts.check_ppe_model "%~1"
if errorlevel 1 goto :model_error

echo.
echo Model check passed. Add this absolute path to MODEL_PATH in backend\.env.
echo Then set DEMO_MODE=false and restart the project.
pause
exit /b 0

:install_error
echo.
echo Vision dependency installation failed.
pause
exit /b 1

:model_error
echo.
echo Model validation failed. Required classes: person, helmet, vest.
pause
exit /b 1
