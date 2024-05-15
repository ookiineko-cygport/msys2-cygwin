@echo off
endlocal & goto #_undefined_# 2>NUL || title %COMSPEC% & sh.exe "%~dp0@TRIPLE@-pkg-config" %*
