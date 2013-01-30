:: Server Start and Restart batch for DayZ Server Controlcenter written by Crosire
@echo off
REM Your Path to Arma 2. ending with \ like c:\Arma2\
set cd=C:\arma\
REM Your Path to your Query.txt ending with \ like c:\Arma2\
set cd2=C:\arma\@dayzcc_config\1\scripts
REM Set the instance number here.
set instance=1
REM Set the port of the server here.
set port=2302
REM Set the server modlist here.
set mod=@dayz;@dayzcc;@dayzpanthera

:: Do not edit from here on		>>>>
echo.
cd /D "%cd%\@dayzcc_config\%instance%\BattlEye Extended Controls"
echo Starting BEC again ...
@start bec_%instance%.exe -f config.cfg
echo.
echo Starting server again ...
echo %cd%
cd /D %cd%
@start /HIGH @dayzcc_config\%instance%\arma2oaserver_%instance%.exe -beta=Expansion\beta;Expansion\beta\Expansion -mod=%mod% -name=Server -config=@dayzcc_config\%instance%\config.cfg -cfg=@dayzcc_config\%instance%\basic.cfg -profiles=@dayzcc_config\%instance% -port=%port% -cpuCount=8 -maxMem=2047 -bandwidthAlg=2 -exThreads=1 -noCB -noPause -noSound
echo.
EXIT