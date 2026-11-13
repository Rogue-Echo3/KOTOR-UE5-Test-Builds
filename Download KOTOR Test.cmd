@echo off
setlocal
set "KOTOR_BUILD_DOWNLOAD_ROOT=%~dp0"
if not exist "%~dp0Download-KOTOR-Test.ps1" (
 echo Please extract both helper files into the same folder first.
 pause
 exit /b 1
)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Download-KOTOR-Test.ps1"
set "KOTOR_BUILD_DOWNLOAD_EXIT=%ERRORLEVEL%"
echo.
pause
exit /b %KOTOR_BUILD_DOWNLOAD_EXIT%
