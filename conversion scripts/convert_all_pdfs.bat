@echo off
for /D %%D in ("*") do if exist "%%D\*.pdf" call :ConvertFileToPNG "%%D"
goto :EOF

:ConvertFileToPNG
cd "%~1"
echo **********************************************************
Echo converting PDF TO PNG in "%~1"
echo **********************************************************
for %%F in ("*.pdf") do (
    echo ---------------------------------
	echo converting "%%~nF"
	..\pdftopng.exe "%%F" "%%~nF"
)
cd ..

goto :EOF
    	