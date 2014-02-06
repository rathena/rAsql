rAsql
=======
This server is meant for locally TESTING rAthena only, and should not be used for hosting a public rAthena server. To host a public rAthena server, you should use a Dedicated Server or VPS.

The server uses the standard port 3306, and will only accept connections from localhost. The default username and password are both 'ragnarok'.

Starting the server
---------
Run the server using 'mysql_start.bat', which creates a virtual drive. The drive letter used is the first available letter found.

Stopping the server
---------
Stop the server using 'mysql_stop.bat'. This shuts down the server and removes the virtual drive.

Modifications
---------

* Change virtual drive:

	To override the default virtual drive letter, locate these lines in 'mysql_start.bat':

			rem ## To force a drive letter, remove "rem" and change drive letter
			rem set Disk=w

	For example, changing the second line to 'set Disk=X' would force the server to run on drive letter X.

* Change default settings:

	To change the default user, password, or port, simply type in your desired settings when HeidiSQL launches. Then locate these lines in 'mysql_stop.bat':

			rem ## Kill server
			udrive\bin\mysqladmin.exe --port=3306 --user=ragnarok --password=ragnarok shutdown

	Edit the necessary fields whenever changes to the configuration are made.
