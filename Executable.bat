@echo OFF

call ".\\Table.bat"

echo Y | DEL ".\\result\\Executable.txt"
echo Y | DEL ".\\result\\Executable.log"
echo Y | DEL ".\\result\\filelist.log"
echo Y | DEL ".\\result\\disc.log"
echo Y | DEL ".\\result\\lba.txt"

copy /y ".\\original\\PSX.EXE" ".\\"
C:\bioclone\debug\bioclone dmyfile 2048 ".\\BOOT.BIN"
C:\bioclone\debug\bioclone dmyfile 2048 ".\\DEBUG.BIN"
copy /y ".\\original\\program\\DIEDEMO.BIN" ".\\"

armips zero.s -temp result\\Executable.txt >> result\\Executable.log

move /y ".\\PSX.EXE" ".\\disc"
move /y ".\\BOOT.BIN" ".\\disc\\binary"
move /y ".\\DEBUG.BIN" ".\\disc\\binary"
move /y ".\\DIEDEMO.BIN" ".\\disc\\binary"

C:\bioclone\debug\bioclone align 2048 ".\\disc\\binary\\BOOT.BIN"
C:\bioclone\debug\bioclone align 2048 ".\\disc\\binary\\DEBUG.BIN"
C:\bioclone\debug\bioclone align 2048 ".\\disc\\binary\\DIEDEMO.BIN"

C:\bioclone\debug\bioclone datelog "C:\\BioDSZ\\result\\timestamp.log" 0.0
C:\bioclone\debug\bioclone exewrite ".\\disc\\PSX.EXE" 0x80010000 ".\\result\\timestamp.log"

C:\bioclone\debug64\bioclone64 buildcd "C:\BioDSZ\original\filelist.txt"
