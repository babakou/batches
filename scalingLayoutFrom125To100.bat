@ECHO OFF

explorer ms-settings:display
ping -n 2 127.0.0.1 > nul

:VBSDynamicBuild
SET TmpVBSFile=%TMP%\~tmpSendKeysTemp.vbs
IF EXIST "%TmpVBSFile%" DEL /F /Q "%TmpVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >> %TmpVBSFile%
ECHO Wscript.Sleep 500					  >> %TmpVBSFile%
ECHO WshShell.SendKeys  "{TAB 2}{UP 1}"			  >> %TmpVBSFile%
ECHO Wscript.Sleep 500	      	      			  >> %TmpVBSFile%
ECHO WshShell.SendKeys "%%{F4}"				  >> %TmpVBSFile%

CSCRIPT //nologo "%TmpVBSFile%"
EXIT
