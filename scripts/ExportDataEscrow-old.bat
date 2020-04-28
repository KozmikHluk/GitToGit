@ECHO ON
:VARIABLES
SET SVNPRODURL=http://devsubversion/svn
SET EXPPATH=e:\E

:ExportSVNdata

FOR /f "tokens=1 delims=," %%A in (svnurl.txt) do (
ECHO %%A
svn export --username syncuser --password syncuser --force %SVNPRODURL%/%%A %EXPPATH%\%%A
"C:\Program Files (x86)\WinRAR\WinRAR.exe" a -r %EXPPATH%\%%A.rar %EXPPATH%\%%A\*.* %EXPPATH%\%%A"')
)

:END
