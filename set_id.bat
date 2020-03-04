:: Update the ID of the VirtualBox VM in the vagrant config.
:: For some reason, after restarting, the box changes its ID.

:: CD to the script's directory
cd /D "%~dp0"

FOR /F "tokens=1,2 delims= " %%A IN ('"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" list vms') DO IF %%A=="debian-buster-vagrant" (SET "VBID=%%B")
ECHO " "

:: Trim the {} around the ID
FOR /F "tokens=1,2 delims={" %%B IN ("%VBID%") DO (SET "VBID=%%B")
FOR /F "tokens=1,2 delims=}" %%A IN ("%VBID%") DO (SET "VBID=%%A")

ECHO %VBID%
:: echo without newline
ECHO|set /p=%VBID% > .vagrant\machines\default\virtualbox\id