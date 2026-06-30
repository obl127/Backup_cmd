set arc=C:\Progs\7-Zip
set pass=2025
set sour=D:\MyData\MyDoc
set dest=D:\MyData
set dest2=\\In04613\000
rem set lan=D:\MyData\Lan
set brow=D:\MyData\Browsers
set dd=%DATE:~0,2%
set mm=%DATE:~3,2%
set yyyy=%DATE:~6,4%
set today=%yyyy%.%mm%.%dd%

DEL /F /S /Q /A:S "%sour%\desktop.ini"
DEL /F /S /Q /A:S "%lan%\desktop.ini"
DEL /F /S /Q /A:S "%sour%\Thumbs.db"
DEL /F /S /Q /A:S "%lan%\Thumbs.db"
RMDIR /S /Q "%sour%\Пользовательские шаблоны Office"
RMDIR /S /Q "%sour%\Настраиваемые шаблоны Office"
RMDIR /S /Q "%sour%\Мои фигуры"
%arc%\7z.exe a -ssw -mx9 -r0 -p%pass% "%dest%\MIPI_%today%_new.7z" "%sour%"
%arc%\7z.exe a -ssw -mx9 -r0 -p%pass% "%dest%\MIPI_%today%_new.7z" "%brow%"
rem %arc%\7z.exe a -ssw -mx9 -r0 -p%pass% "%dest%\MIPI_%today%_new.7z" "%lan%"
DEL /F /Q "%dest%\MIPI_%today%.7z"
REN "%dest%\MIPI_%today%_new.7z" "MIPI_%today%.7z"
MOVE /Y "%dest%\MIPI_%today%.7z" "%sour%\MIPI_%today%.7z"
DEL /F /Q "%dest2%\MIPI_*.7z"
COPY /Y "%sour%\MIPI_%today%.7z" "%dest2%\MIPI_%today%.7z"