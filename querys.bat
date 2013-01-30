@echo off
REM Set the instance number here.
set instance=1
REM Your Path to Arma 2. ending with \ like c:\Arma2\
set cd=C:\arma\
REM Your Path to your Query.txt ending with \ like c:\Arma2\
set cd2=C:\arma\@dayzcc_config\1\scripts\
REM Your Database details
set DB=dayz_panthera
set user=
set pass=
:: Do not edit from here on		>>>>

echo Switched to working directory:
echo %cd%
cd /D %cd%
echo.
echo remove dead player
".\@dayzcc\mysql\bin\mysql.exe" -u %user% -p%pass% -D%DB% -v -v -v < "%cd2%sql\remove_dead.txt"
echo.
echo Remove unused vehicles // 7 days
".\@dayzcc\mysql\bin\mysql.exe" -u %user% -p%pass% -D%DB% -v -v -v < "%cd2%sql\remove_vehicle.txt"
echo.
echo Remove unused Tents // 22 days
".\@dayzcc\mysql\bin\mysql.exe" -u %user% -p%pass% -D%DB% -v -v -v < "%cd2%sql\remove_tents.txt"
echo.
echo cleanup survivor tabel // 14 days
".\@dayzcc\mysql\bin\mysql.exe" -u %user% -p%pass% -D%DB% -v -v -v < "%cd2%sql\remove_oldplayers.txt"
echo.
REM stats player with human under 0 to skin Bandit1_DZ
echo Set Bandit skin on bandits
".\@dayzcc\mysql\bin\mysql.exe" -u %user% -p%pass% -D%DB% -v -v -v < "%cd2%sql\add_banditskin.txt"
echo.
REM Can fuck up stats
::echo cleanup profile tabel // 22 days
::".\@dayzcc\mysql\bin\mysql.exe" -u %user% -p%pass% -D%DB% -v -v -v < "%cd2%cleanup_profile.txt"
::PAUSE
EXIT