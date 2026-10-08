@echo off
title SkillBridge Unified Fullstack Server
echo ========================================================
echo        SkillBridge - Student Skill Exchange Platform
echo                   Unified Fullstack Server
echo ========================================================
echo.

:: Check Node.js installation
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not found. Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

echo [INFO] Starting SkillBridge Fullstack Server...
echo [INFO] Web UI and REST API will be available at:
echo        http://localhost:5000
echo.
echo Press Ctrl+C at any time to stop the server.
echo ========================================================
echo.

node server.js
pause
