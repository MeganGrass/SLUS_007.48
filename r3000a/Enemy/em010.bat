@echo OFF

echo Y | DEL ".\\result\\em010.txt"
echo Y | DEL ".\\result\\em010.log"

copy /y "C:\BioDS\asset\Bio2\Enemy\original\CDEMD0\BIN\EM1000.BIN" ".\\"
copy /y "C:\BioDS\asset\Bio2\Enemy\original\CDEMD0\BIN\EM1001.BIN" ".\\"

armips em010.s -temp result\\em010.txt >> result\\em010.log

move /y ".\\EM1000.BIN" "C:\BioDS\asset\Bio2\Enemy\CDEMD0\BIN"
move /y ".\\EM1001.BIN" "C:\BioDS\asset\Bio2\Enemy\CDEMD0\BIN"
