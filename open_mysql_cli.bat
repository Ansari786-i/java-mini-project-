@echo off
title SkillBridge MySQL Interactive Command Line
echo ========================================================
echo        SkillBridge - Interactive MySQL CLI Client
echo ========================================================
echo.
echo Connecting to MySQL on 127.0.0.1:3307 (database: skillbridge)...
echo.
echo Useful SQL commands to try:
echo   SHOW TABLES;
echo   SELECT id, full_name, email, college FROM users;
echo   SELECT s.name AS skill, c.name AS category FROM skills s JOIN skill_categories c ON s.category_id = c.id;
echo   SELECT * FROM skill_exchange_requests;
echo.
echo Type 'exit' to quit.
echo ========================================================
echo.

"C:\Program Files\MySQL\MySQL Server 26.7\bin\mysql.exe" -h 127.0.0.1 -P 3307 -u root -pmysql@251704 skillbridge
pause
