@echo off
cls

rem Replace "your_program" with the name of your .asm file
set source_file=your_program

rem Assemble the source code using MASM
masm.exe %source_file%;

rem Link the assembled code to create the executable
link %source_file%.OBJ;

echo --- OUTPUT ---
echo.

rem Run the executable
%source_file%

echo.
echo ---- EOF ----

rem Delete the intermediate files created during assembly and linking
del %source_file%.OBJ
del %source_file%.EXE

rem Pause to see the output and any errors
pause
cls
