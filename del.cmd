@ECHO OFF
TITLE=Очистка системы

rem Остановка и выключение службы Windows Search
NET STOP WSearch
SC CONFIG WSearch START= disabled

rem Остановка и выключение службы SysMain (Superfetch)
NET STOP SysMain
SC CONFIG SysMain START= disabled

rem Остановка и выключение службы Темы
NET STOP Themes
SC CONFIG Themes START= disabled

rem Остановка и выключение службы Служба установки Microsoft Store
NET STOP InstallService
SC CONFIG InstallService START= disabled

rem Отключить гибернацию
powercfg -h off

NET STOP wuauserv

SET DDD="%WINDIR%\SoftwareDistribution\Download"
SET AAA="%LOCALAPPDATA%\Temp"
SET TTT="%WINDIR%\Temp"

CD /D %DDD%
DEL /F /S /Q %DDD%
RD /S /Q %DDD%

CD /D %AAA%
DEL /F /S /Q %AAA%
RD /S /Q %AAA%

CD /D %TTT%
DEL /F /S /Q %TTT%
RD /S /Q %TTT%

Dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase
