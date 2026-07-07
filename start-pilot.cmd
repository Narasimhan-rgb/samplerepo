@echo off
setlocal EnableExtensions

REM Start SafeAudit AI for an authorised local PPE pilot.
REM Before running: set MODEL_PATH and DEMO_MODE=false in backend\.env.
set "ROOT=%~dp0"
set "BACKEND=%ROOT%backend"
set "FRONTEND=%ROOT%frontend"
set "VENV_PYTHON=%BACKEND%\.venv\Scripts\python.exe"
set "MODEL_PATH="

if not exist "%VENV_PYTHON%" (
    echo ERROR: Backend environment was not found.
    echo Run run-demo.cmd once first to create the local environment.
    pause
    exit /b 1
)

if not exist "%BACKEND%\.env" (
    echo ERROR: backend\.env was not found.
    pause
    exit /b 1
)

REM Read the value after MODEL_PATH=. This supports Windows paths containing spaces.
for /f "tokens=1,* delims==" %%A in ('findstr /r /i /c:"^[ ]*MODEL_PATH[ ]*=" "%BACKEND%\.env"') do set "MODEL_PATH=%%B"

if not defined MODEL_PATH (
    echo ERROR: MODEL_PATH is missing or empty in backend\.env.
    echo Add your authorised PPE model path, for example:
    echo MODEL_PATH=D:\models\ppe-model.pt
    pause
    exit /b 1
)

if not exist "%MODEL_PATH%" (
    echo ERROR: The PPE model file was not found:
    echo %MODEL_PATH%
    pause
    exit /b 1
)

findstr /r /i /c:"^[ ]*DEMO_MODE[ ]*=[ ]*false[ ]*$" "%BACKEND%\.env" >nul
if errorlevel 1 (
    echo ERROR: Set DEMO_MODE=false in backend\.env before starting a pilot.
    pause
    exit /b 1
)

if not exist "%FRONTEND%\node_modules" (
    echo ERROR: Frontend packages were not found.
    echo Run run-demo.cmd once first.
    pause
    exit /b 1
)

echo.
echo Starting SafeAudit AI in local pilot mode...
start "SafeAudit Backend" cmd.exe /k call "%ROOT%start-backend.cmd"
start "SafeAudit Frontend" cmd.exe /k call "%ROOT%start-frontend.cmd"
start "SafeAudit Dashboard" http://localhost:5173

echo.
echo Dashboard opened at http://localhost:5173
pause
