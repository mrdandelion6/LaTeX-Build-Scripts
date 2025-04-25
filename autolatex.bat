@echo off
setlocal

REM compile the LaTeX document with pdflatex
pdflatex -interaction=nonstopmode -halt-on-error %1

REM check if the tex_info folder exists and create it if it doesn't
if not exist tex_info mkdir tex_info

REM move the auxiliary files. ignore any warning if the files don't exist
move /Y %~n1.aux tex_info\ 2>NUL 
move /Y %~n1.fdb_latexmk tex_info\ 2>NUL
move /Y %~n1.fls tex_info\ 2>NUL
move /Y %~n1.log tex_info\ 2>NUL
move /Y %~n1.synctex.gz tex_info\ 2>NUL
move /Y %~n1.out tex_info\ 2>NUL

REM check if pdflatex failed
if errorlevel 1 (
    echo pdflatex failed with error %errorlevel%
    exit /b %errorlevel%
)

endlocal