Title LazyMiner by MTS (Vlad)
@echo off
:start
cls
set proc=YourProcessDotEXEHere
set runme=FULLPathToBatch
set time=60

tasklist /nh /fi "imagename eq %proc%" /fi "status eq running" | find /i "%proc%" >nul && (
echo Everything is OK 
timeout /t %time%
goto :start ) || (
echo ERROR! restarting service
taskkill /IM "%proc%" /F
start %runme%
)
timeout /t %time%
goto :start
