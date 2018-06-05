@echo OFF

echo Y | DEL ".\\result\\em021.txt"
echo Y | DEL ".\\result\\em021.log"

copy /y "C:\BioDS\asset\Bio2\Enemy\original\CDEMD0\BIN\EM2100.BIN" ".\\"
copy /y "C:\BioDS\asset\Bio2\Enemy\original\CDEMD0\BIN\EM2101.BIN" ".\\"

armips em021.s -temp result\\em021.txt >> result\\em021.log

move /y ".\\EM2100.BIN" "C:\BioDS\asset\Bio2\Enemy\CDEMD0\BIN"
move /y ".\\EM2101.BIN" "C:\BioDS\asset\Bio2\Enemy\CDEMD0\BIN"
