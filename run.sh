#!/bin/bash

catalog="/home/mika/1MyAll1/projects/121212121212"
namefiledlajavac="Main.java"
namefiledlajava="Main"

echo "######################### Начало ##################################" >> log.txt
echo "Время начала: `date`" >> log.txt
echo -e "" >> log.txt
cd "$catalog"
echo "Переходим в каталог \""$catalog"\"" >> log.txt
read -p "Отчистить экран [0/1]: " ASA
echo -e ""
echo "Спрашиваем пользователя хочет ли он отчистить консоль" >> log.txt

if [[ 0 = "$ASA" ]]; then
	echo "Отказался" >> log.txt
elif [[ 1 = "$ASA" ]]; then 
	echo "Согласился" >> log.txt
	clear
	echo "Отчищаем консоль" >> log.txt
else 
	echo "Вы ввели неправильное число..." >> log.txt
	echo "#####################-----Конец-----##############################" >> log.txt
	echo "Вас просили ввести 0 или 1... [0 = отказ], а [1 = согласие]."
	echo "Так как вы ввели не правильно, пожалуйста попробуйте еще раз"
	./run.sh
fi
echo -e "" >> log.txt
echo "--------------------------------------------------------------------"
echo "Ошибки \"javac "$namefiledlajavac"\": " >> log.txt
echo "--------------------------------------------------------------------" >> log.txt
javac Main.java 
javac Main.java 2>> log.txt

if [ $? -eq 0 ]; then
	echo "Ошибок нету"
	echo "--------------------------------------------------------------------"
	echo "Ошибок нету" >> log.txt
	oshibka=0
	echo "Переменная @oshibka@ = 0 так как ошибок нету" >> log.txt
	echo "--------------------------------------------------------------------" >> log.txt
	echo -e "" >> log.txt
	echo "\"javac "$namefiledlajavac"\" выдала ошибки?" >> log.txt
	echo "Нет" >> log.txt
	echo "Если переменная @oshibka@ = 0 то" >> log.txt
	if [ 0 = "$oshibka" ]; then
		clear
		echo "Отчищаем консоль" >> log.txt
	fi
	java "$namefiledlajava"
	
else
	echo "--------------------------------------------------------------------"
	echo "--------------------------------------------------------------------" >> log.txt
	echo -e "" >> log.txt
	echo "\"javac "$namefiledlajavac"\" выдала ошибки?" >> log.txt
	echo "Да" >> log.txt
	echo "Ошибка в \"javac "$namefiledlajavac"\""

fi

echo -e "" >> log.txt
echo "Время окончания: `date`" >> log.txt
echo "#####################-----Конец-----##############################" >> log.txt
echo -e ".\n.\n." >> log.txt

# Команды для "ctrl + c" и "ctrl + v":
#	 echo "" >> log.txt 
#	там где что то не получается с одинарными кавычками возможно это "ё"