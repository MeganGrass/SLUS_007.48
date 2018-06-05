@echo OFF

call ".\\Executable.bat"

C:\bioclone\Debug64\test mkpsxiso C:\BioDSZ\disc.xml C:\BioDSZ\result\lba.txt

pSX.lnk -P -r -s "E:\\Source\\BioDSZ\\disc.cue"
