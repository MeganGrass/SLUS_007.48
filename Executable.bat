@echo OFF

call ".\\Overlay.bat"
call ".\\Music.bat"

echo Y | DEL ".\\result\\Executable.txt"
echo Y | DEL ".\\result\\Executable.log"
echo Y | DEL ".\\result\\timestamp.log"

copy /y ".\\original\\PSX.EXE" ".\\"
utility\test dmyfile 2048 ".\\BOOT.BIN"

armips executable.s -temp result\\Executable.txt >> result\\Executable.log

move /y ".\\PSX.EXE" ".\\disc"
move /y ".\\BOOT.BIN" ".\\disc\\BINARY"

utility\test datelog ".\\result\\timestamp.log" 0.0
utility\test exewrite ".\\disc\\PSX.EXE" 0x80010000 ".\\result\\timestamp.log"
