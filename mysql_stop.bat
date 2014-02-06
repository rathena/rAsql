:######################################################################## 
:# File name: mysql_stop.bat
:# Created By: rAthena Development Team
:# Edited Last By: Yommy
:# V 1.0 17.12.2011
:######################################################################## 

@echo off
echo.
rem ## Save return path
pushd %~dp0

rem ## Check to see if already stopped
if NOT exist udrive\data\mysql_mini.pid goto :ALREADYKILLED

rem ## It exists is it running
SET /P pid=<udrive\data\mysql_mini.pid
netstat -anop tcp | FIND /I " %pid%" >NUL
IF ERRORLEVEL 1 goto :NOTRUNNING
IF ERRORLEVEL 0 goto :RUNNING 

:NOTRUNNING
rem ## Not running clean-up
del udrive\data\mysql_mini.pid 
goto :ALREADYKILLED

rem ## It is running so shut server down
:RUNNING
rem ## Getdrive letter
SET /P Disk=<udrive\data\drive.txt

rem ## Remove pid file server was closed
del udrive\data\mysql_mini.pid

rem ## Remove disk file
del udrive\data\drive.txt

rem ## Kill server
udrive\bin\mysqladmin.exe --port=3306 --user=ragnarok --password=ragnarok shutdown

rem ## Kill drive
subst %Disk%: /D

echo  MySQL Stopped

goto :END

:ALREADYKILLED
echo  MySQL already stopped
:END
echo.

pause

rem ## Return to caller
popd