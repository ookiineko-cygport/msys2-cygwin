@echo off
endlocal & goto #_undefined_# 2>NUL || title %COMSPEC% & "%~dp0..\lib\cygwin-llvm\bin\clang.exe" -target @PROCESSOR@-pc-windows-cygnus %*
