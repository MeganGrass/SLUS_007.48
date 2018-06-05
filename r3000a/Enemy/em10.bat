@echo OFF

echo Y | DEL ".\\result\\em10.txt"
echo Y | DEL ".\\result\\em10.log"

copy /y "C:\BioDSZ\asset\enemy\original\CDEMD0\BIN\EM1000.BIN" ".\\"
copy /y "C:\BioDSZ\asset\enemy\original\CDEMD0\BIN\EM1001.BIN" ".\\"

armips em10.s -temp result\\em10.txt >> result\\em10.log

move /y ".\\EM1000.BIN" "C:\BioDSZ\asset\enemy\CDEMD0\BIN"
move /y ".\\EM1001.BIN" "C:\BioDSZ\asset\enemy\CDEMD0\BIN"
