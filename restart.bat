:: Server Start and Restart batch for DayZ Server Controlcenter written by Crosire
@echo off
REM Your Path to Arma 2. ending with \ like c:\Arma2\
set cd=C:\arma\
REM Your Path to your Query.txt ending with \ like c:\Arma2\
set cd2=C:\arma\@dayzcc_config\1\scripts\
REM Your Database details
set db=dayz_panthera
set user=
set pass=
REM Set the instance number here.
set instance=1
REM Set the port of the server here.
set port=2302
REM Set the server modlist here.
set mod=@dayz;@dayzcc;@dayzpanthera
REM 1 = Generate new vehicles, 0 = Do not generate vehicles	
set vehicles=0
if "%1" == "1" set vehicles=1
REM 1 = Delete dead survivors, 0 = Do not delete dead survivors
set cleanup=0
if "%2" == "1" set cleanup=1
REM 1 = dont start server again
set dontstart=0
if "%3" == "1" set dontstart=1

:: Do not edit from here on		>>>>

:initialize
cls
echo %cd%
cd /D %cd%
echo Killing current running server ...
taskkill /IM arma2oaserver_%instance%.exe
taskkill /F /IM arma2oaserver_%instance%.exe

echo Killing current BEC server ...
taskkill /IM bec_%instance%.exe
taskkill /F /IM bec_%instance%.exe

if "%vehicles%" == "1" goto generate
if "%cleanup%" == "1" goto cleanup
goto start

:generate
if "%vehicles%" == "0" goto cleanup
TIMEOUT /T 5
echo Generating vehicles ...
cd /D %cd2%
echo First Run
@start %cd%@dayzcc\php\php.exe -f "%cd2%add_vehicle.php"

:cleanup
if "%cleanup%" == "0" goto start
TIMEOUT /T 5
echo Cleaning Database up ...
cd /D %cd2%
@start querys.bat

:start
if "%dontstart%" == "1" EXIT
TIMEOUT /T 5
echo %cd%
cd /D %cd%
echo Starting server again ...
@start /HIGH @dayzcc_config\%instance%\arma2oaserver_%instance%.exe -beta=Expansion\beta;Expansion\beta\Expansion -mod=%mod% -name=Server -config=@dayzcc_config\%instance%\config.cfg -cfg=@dayzcc_config\%instance%\basic.cfg -profiles=@dayzcc_config\%instance% -port=%port% -cpuCount=8 -maxMem=2047 -bandwidthAlg=2 -exThreads=1 -noCB -noPause -noSound
TIMEOUT /T 30
echo Starting BEC again ...
cd /D "%cd%@dayzcc_config\%instance%\BattlEye Extended Controls\"
start bec_%instance%.exe -f config.cfg
EXIT