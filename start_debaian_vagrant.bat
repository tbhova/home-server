:: Run at startup by adding a shortcut to this file in the directory:
:: Windows Key + R "shell:startup"
::
:: Largely stolen from: https://gist.github.com/Iristyle/5171999

:: CD to the script's directory
cd /D "%~dp0"

:: The id listed here needs to be the same as the on in .vagrant\machines\default\virtualbox\id
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" list vms > vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt

vagrant status >> vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt

call set_id.bat

vagrant status >> vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt

:: "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "debian-buster-vagrant" --type headless

for /f "tokens=2* delims= " %%F IN ('vagrant status ^| find /I "default"') DO (SET "STATE=%%F%%G")

ECHO Close this window if it remains open, and http://localhost:8081 is responsive

IF "%STATE%" NEQ "saved" (
  ECHO Starting Vagrant VM from powered down state...
  vagrant up >> vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt
) ELSE (
  ECHO Resuming Vagrant VM from saved state...
  vagrant resume >> vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt
)

if errorlevel 1 (
  ECHO FAILURE! Vagrant VM unresponsive...
)

vagrant status >> vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt