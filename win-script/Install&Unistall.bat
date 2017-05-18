@ECHO off
ECHO INSTALL AS ADMIN ONLY
IF DEFINED NGINX_MANAGE_EXE (
	ECHO NGINX_MANAGE_EXE IS define.
	ECHO Uninstall env_var from system.
	ECHO "Uninstall bat path from system."
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v NGINX_MANAGE_EXE /f
	ECHO "Uninstall nginx.exe path from system."
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v NGINX_EXE /f
	ECHO "Uninstall nginx dir path from system."
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v NGINX_HOME /f
) ELSE (
	ECHO NGINX_MANAGE_EXE is NOT define.
	ECHO INSTALL env_var into system.
	FOR /f "tokens=*" %%a IN ('dir ManageWithArg.bat /b /s') DO (
		ECHO "Install bat path into system."
		SETX NGINX_MANAGE_EXE "%%a" /M
	)
	CD ..
	FOR /f "tokens=*" %%a IN ('dir nginx.exe /b /s') DO (
		ECHO "Install nginx.exe path into system."
		SETX NGINX_EXE "%%a" /M
		FOR %%i IN ("%%a%") DO (
			ECHO "Install nginx dir path into system."
			SETX NGINX_HOME %%~dpi /M
		)
	)
	CD win-script
)
PAUSE