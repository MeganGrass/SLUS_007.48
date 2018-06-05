@echo OFF

echo Y | DEL ".\\result\\AreaJump.txt"
echo Y | DEL ".\\result\\AreaJump.log"

C:\bioclone\debug\bioclone dmyfile 8 ".\\AREA.BIN"
C:\bioclone\debug\bioclone dmyfile 2048 ".\\ZNULL04.BIN"
C:\bioclone\debug\bioclone dmyfile 2048 ".\\ZNULL05.BIN"
C:\bioclone\debug\bioclone dmyfile 2048 ".\\ZNULL06.BIN"
C:\bioclone\debug\bioclone dmyfile 2048 ".\\ZNULL07.BIN"
C:\bioclone\debug\bioclone dmyfile 2048 ".\\ZNULL08.BIN"
C:\bioclone\debug\bioclone dmyfile 2048 ".\\ZNULL09.BIN"
C:\bioclone\debug\bioclone dmyfile 2048 ".\\ZNULL0A.BIN"
C:\bioclone\debug\bioclone dmyfile 2048 ".\\ZNULL0B.BIN"
C:\bioclone\debug\bioclone dmyfile 2048 ".\\ZNULL0C.BIN"

armips table.s -temp result\\AreaJump.txt >> result\\AreaJump.log

move /y ".\\AREA.BIN" ".\\disc\\BINARY\\AREA.BIN"
move /y ".\\ZNULL04.BIN" ".\\disc\\BINARY\\ZNULL04.BIN"
move /y ".\\ZNULL05.BIN" ".\\disc\\BINARY\\ZNULL05.BIN"
move /y ".\\ZNULL06.BIN" ".\\disc\\BINARY\\ZNULL06.BIN"
move /y ".\\ZNULL07.BIN" ".\\disc\\BINARY\\ZNULL07.BIN"
move /y ".\\ZNULL08.BIN" ".\\disc\\BINARY\\ZNULL08.BIN"
move /y ".\\ZNULL09.BIN" ".\\disc\\BINARY\\ZNULL09.BIN"
move /y ".\\ZNULL0A.BIN" ".\\disc\\BINARY\\ZNULL0A.BIN"
move /y ".\\ZNULL0B.BIN" ".\\disc\\BINARY\\ZNULL0B.BIN"
move /y ".\\ZNULL0C.BIN" ".\\disc\\BINARY\\ZNULL0C.BIN"

C:\bioclone\debug\bioclone align 2048 ".\\disc\\BINARY\\AREA.BIN"
