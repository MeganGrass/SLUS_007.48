@echo OFF

call ".\\Overlay.bat"
call ".\\Music.bat"

echo Y | DEL ".\\result\\Executable.txt"
echo Y | DEL ".\\result\\Executable.log"
echo Y | DEL ".\\result\\filelist.log"
echo Y | DEL ".\\result\\disc.log"
echo Y | DEL ".\\result\\lba.txt"

copy /y ".\\original\\PSX.EXE" ".\\"
utility\bioclone dmyfile 2048 ".\\BOOT.BIN"

armips psx.s -temp result\\Executable.txt >> result\\Executable.log

move /y ".\\PSX.EXE" ".\\disc"
move /y ".\\BOOT.BIN" ".\\disc\\BINARY"

utility\bioclone datelog "C:\\BioDSZ\\result\\timestamp.log" 0.0
utility\bioclone exewrite ".\\disc\\PSX.EXE" 0x80010000 ".\\result\\timestamp.log"
utility\bioclone64 buildcd "C:\BioDSZ\original\Filelist.txt"
