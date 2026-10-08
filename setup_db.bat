@echo off
title SkillBridge Database Setup & Seeding
echo ========================================================
echo        SkillBridge - Database Setup & Seeding
echo ========================================================
echo.
echo [1/2] Running database schema migration...
node src/scripts/migrate.js
if %errorlevel% neq 0 (
    echo [ERROR] Migration failed. Ensure MySQL is running on port specified in .env.
    pause
    exit /b 1
)

echo.
echo [2/2] Seeding initial student profiles, skills, and categories...
node src/scripts/seed.js
if %errorlevel% neq 0 (
    echo [ERROR] Seeding failed.
    pause
    exit /b 1
)

echo.
echo ========================================================
echo [SUCCESS] Database is setup and seeded with demo data!
echo ========================================================
pause
