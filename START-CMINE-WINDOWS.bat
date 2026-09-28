@echo off
setlocal
title C-MINE Intelligence - SIH26023
cd /d "%~dp0"
echo.
echo C-MINE Intelligence - SIH26023
echo ==============================
echo.
where node >nul 2>&1
if errorlevel 1 (
  echo Node.js is not installed or is not on PATH.
  echo Install the current Node.js LTS from nodejs.org, then run this file again.
  pause
  exit /b 1
)
echo Node version:
node -v
echo.
echo Cleaning any incomplete native dependency install...
if exist node_modules\better-sqlite3 rmdir /s /q node_modules\better-sqlite3
echo Installing dependencies...
call npm.cmd install
if errorlevel 1 (
  echo.
  echo Installation failed. The project requires better-sqlite3 13.0.3,
  echo which has Node.js 24 support. If this still fails, save the full
  echo terminal output and send it to the project developer.
  pause
  exit /b 1
)
echo.
echo Starting C-MINE...
call npm.cmd start
pause
