:: Generally not working for autostart - usually invoking this script manually after log in.

:: Run as a service with NSSM (https://nssm.cc/)
:: From an admin PowerShell/CMD:
:: choco install nssm -y
:: nssm install
:: Complete the popup fields pointing it to this script.
::
:: Increase service timeout to 2000000ms following the instructions here: https://www.codetwo.com/kb/how-to-extend-the-timeout-for-services-if-they-do-fail-to-start/

:: Run as a service using https://github.com/luisperezphd/RunAsService (downloaded from http://runasservice.com/)
:: RunAsService install "StartVagrantVM" "StartVagrantVM" "c:\Users\Tyler\VagrantDebian\start_debian_vagrant.bat"
:: net start "StartVagrantVM"
::
:: Run at startup by adding a shortcut to this file in the directory:
:: Windows Key + R "shell:startup"
::
:: Largely stolen from: https://gist.github.com/Iristyle/5171999

:: CD to the script's directory
cd /D "%~dp0"

:: The id listed here needs to be the same as the on in .vagrant\machines\default\virtualbox\id
:: "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" list vms > vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt

vagrant status > vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt

call set_id.bat

vagrant status >> vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt

:: "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "debian-buster-vagrant" --type headless

:: for /f "tokens=2* delims= " %%F IN ('vagrant status ^| find /I "default"') DO (SET "STATE=%%F%%G")

ECHO Close this window if it remains open, and http://home.tylerhovanec.com is responsive

:: IF "%STATE%" NEQ "saved" (
::   ECHO Starting Vagrant VM from powered down state...
::   vagrant up >> vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt
:: ) ELSE (
::   ECHO Resuming Vagrant VM from saved state...
::   vagrant resume >> vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt
:: )


ECHO Deleting old Vagrant VM...
vagrant destroy -f >> vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt
ECHO Starting Vagrant VM...
vagrant up >> vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt

if errorlevel 1 (
  ECHO FAILURE! Vagrant VM unresponsive...
)

vagrant status >> vagrant_debian_log.txt 2>&1 & type vagrant_debian_log.txt