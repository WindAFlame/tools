@ECHO off
FOR /f "tokens=*" %%a IN ('dir *.conf /b /s') DO (SET CONF_PATH=%%a)
CD %NGINX_HOME%
%NGINX_MANAGE_EXE% %CONF_PATH%