:: Run at shutdown following the instructions here:
:: https://lifehacker.com/use-group-policy-editor-to-run-scripts-when-shutting-do-980849001

:: CD to the script's directory
cd /D "%~dp0"

ECHO Halting > halt_vagrant_log.txt

:: vagrant halt >> halt_vagrant_log.txt  2>&1 & type halt_vagrant_log.txt

"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" controlvm "debian-buster-vagrant" poweroff >> halt_vagrant_log.txt  2>&1 & type halt_vagrant_log.txt

wmic process where "name='VBoxSVC.exe'" delete

wmic process where "name='ps3netsrv.exe'" call terminate
