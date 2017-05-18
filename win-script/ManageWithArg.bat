@ECHO off
ECHO P %1
ECHO Starting nginx...
START /b %NGINX_EXE% -c %1
ECHO Press any button to stop nginx
PAUSE >nul
ECHO Stopping nginx...
TASKKILL /f /IM nginx.exe
EXIT