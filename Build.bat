@echo OFF

call ".\\Executable.bat"

echo Y | DEL ".\\result\\fpos.log"
echo Y | DEL ".\\result\\disc.log"

utility\test buildcd ".\\original\\fpos.ini"
utility\test mkpsxiso C:\BioDSZ\disc.xml C:\BioDSZ\result\disc.log

pSX.lnk -P -r -s "C:\\BioDSZ\\disc.cue"
