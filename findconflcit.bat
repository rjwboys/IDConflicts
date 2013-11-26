@echo on
REM Sets the Directory base to your desktop
Set DirBase="%HOMEPATH%\Desktop"
REM sets varYYYY to the year
SET varYYYY=%DATE:~10,4%
REM Sets varMM to the Month
SET varMM=%DATE:~4,2%
REM Sets varDD to the Day
SET varDD=%DATE:~7,2%
REM set hr=%TIME:~0,2%
REM Sets the Variable for Conflicts to YourDesktop\conflicts\Year\Month\Day\
SET Conflicts=%DirBase%\conflicts\%varYYYY%\%varMM%\%varDD%
REM Checks if the DIR is already made
IF exist %Conflicts% ( echo Conflicts exists ) ELSE ( mkdir %Conflicts% && echo Conflicts created)
REM Sets the variable for str2 to CONFLICTS @
SET str2=CONFLICT @
SET str3=overwrite
Set file=ForgeModLoader-client-0.log
set Conflicts_@="%Conflicts%\CONFLICT @.txt"
REM Finds all with conflicts in the FML 0 file and out puts them to where the variable %Conflicts%\conflicts.txt to
findstr /s /c:"%str2%" %file% > "%Conflicts%\%str2%.txt"
if errorlevel 1 ( echo Not Found        "%str2%")
if not errorlevel 1 ( echo found "%str2%")
findstr /s /c:"%str3%" %file% > "%Conflicts%\%str3%.txt"
if errorlevel 1 ( echo Not Found        "%str3%")
if not errorlevel 1 ( echo found "%str3%")
cd %Conflicts%
IF exist %Conflicts_@% ( copy %Conflicts_@%+conflicts.txt conflicts.txt ) ELSE ( echo "No need to merge")
for /f "tokens=1-5 delims=:" %%d in ("%time%") do rename "conflicts.txt" %%d-%%e.txt
del %Conflicts_@%

REM ren "%Conflicts%\CONFLICT @.txt" Conflicts.txt
@pause
