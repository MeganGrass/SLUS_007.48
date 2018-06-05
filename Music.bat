@echo OFF

echo Y | DEL ".\\result\\Music.txt"
echo Y | DEL ".\\result\\Music.log"

armips music.s -temp result\\Music.txt >> result\\Music.log
