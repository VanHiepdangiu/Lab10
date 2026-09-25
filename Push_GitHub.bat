@echo off
chcp 65001 >nul
title Push Lab10 - Nguyen Van Hiep 2410900035
cd /d "%~dp0"
where git >nul 2>&1 || (echo Chua cai Git & pause & exit /b 1)
if exist .git rmdir /s /q .git
git init
git add .
git commit -m "Lab 10 - EF Core Database First - Nguyen Van Hiep 2410900035"
git branch -M main
git remote add origin https://github.com/VanHiepdangiu/Lab10.git
git push -u origin main
pause
