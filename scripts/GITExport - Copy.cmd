::##GIT ARCHIVE for DATA ESCROW 
SET REPO_NAME=recruiting
SET PROJ=\\denver2\escrow\REC\rawexport
SET EXPPATH=e:\e
SET MM=%DATE:~4,2%
SET DD=%DATE:~7,2%
SET YYYY=%DATE:~10,4%
SET FILE_NAME=%REPO_NAME%_%YYYY%-%MM%-%DD%
SET LOGFILE=%CD%\%REPO_NAME%.log
ECHO #%YYYY%:%MM%:%%DD% >> %LOGFILE%
ECHO %YYYY%:%MM%:%%DD%:%TIME% START CLONE of %REPO_NAME% >>  %LOGFILE%
git clone ssh://git@devgit.dev.us.corp:7999/rec/%REPO_NAME%.git %REPO_NAME%
ECHO %YYYY%:%MM%:%%DD%:%TIME% CLONE COMPLETE of %REPO_NAME% >>  %LOGFILE%
cd %REPO_NAME%
ECHO %YYYY%:%MM%:%%DD%:%TIME% START EXPORT of %REPO_NAME% >>  %LOGFILE%
git archive --format zip --output %EXPPATH%\%FILE_NAME%.zip master
ECHO %YYYY%:%MM%:%%DD%:%TIME% EXPORT COMPLETE of %REPO_NAME% >>  %LOGFILE%
ECHO %YYYY%:%MM%:%%DD%:%TIME% START COPY TO SHARE of %REPO_NAME% >>  %LOGFILE%
copy /B %EXPPATH%\%FILE_NAME%.zip %PROJ%
ECHO %YYYY%:%MM%:%%DD%:%TIME% COPY COMPLETE of %REPO_NAME% >>  %LOGFILE%
:FINALCOPY
echo Exported Repo %REPO_NAME% as %FILE_NAME% in %PROJ%

SET P1=\\denver2\escrow\REC\Release Branches in GIT
copy %PROJ%\%FILE_NAME%.zip "%P1%"

:END
