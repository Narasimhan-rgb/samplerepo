@echo off
setlocal EnableExtensions
cd /d "%~dp0frontend"

if not exist "node_modules" (
    echo ERROR: Frontend packages were not found.
    echo Run run-demo.cmd once from the repository root first.
    pause
    exit /b 1
)

npm run dev
