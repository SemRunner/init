#Создаем функции
#!/bin/bash

function init_colors {
	# echo подсветка
	# echo color
	# Скрипт выводит на экран список меню

	clear    # Очистка экрана

	#Памятка, Таблица цветов и фонов
	#Цвет           код       код фона

	#black    30  40    \033[30m  \033[40m
	#red      31  41    \033[31m  \033[41m
	#green    32  42    \033[32m  \033[42m
	#yellow    33  43    \033[33m  \033[43m
	#blue    34  44    \033[34m  \033[44m
	#magenta    35  45    \033[35m  \033[45m
	#cyan    36  46    \033[36m  \033[46m
	#white    37  47    \033[37m  \033[47m

	# Дополнительные свойства для текта:
	BOLD='\033[1m'       #  ${BOLD}      # жирный шрифт (интенсивный цвет)
	DBOLD='\033[2m'      #  ${DBOLD}    # полу яркий цвет (тёмно-серый, независимо от цвета)
	NBOLD='\033[22m'      #  ${NBOLD}    # установить нормальную интенсивность
	UNDERLINE='\033[4m'     #  ${UNDERLINE}  # подчеркивание
	NUNDERLINE='\033[4m'     #  ${NUNDERLINE}  # отменить подчеркивание
	BLINK='\033[5m'       #  ${BLINK}    # мигающий
	NBLINK='\033[5m'       #  ${NBLINK}    # отменить мигание
	INVERSE='\033[7m'     #  ${INVERSE}    # реверсия (знаки приобретают цвет фона, а фон -- цвет знаков)
	NINVERSE='\033[7m'     #  ${NINVERSE}    # отменить реверсию
	BREAK='\033[m'       #  ${BREAK}    # все атрибуты по умолчанию
	NORMAL='\033[0m'      #  ${NORMAL}    # все атрибуты по умолчанию

	# Цвет текста:
	BLACK='\033[0;30m'     #  ${BLACK}    # чёрный цвет знаков
	RED='\033[0;31m'       #  ${RED}      # красный цвет знаков
	GREEN='\033[0;32m'     #  ${GREEN}    # зелёный цвет знаков
	YELLOW='\033[0;33m'     #  ${YELLOW}    # желтый цвет знаков
	BLUE='\033[0;34m'       #  ${BLUE}      # синий цвет знаков
	MAGENTA='\033[0;35m'     #  ${MAGENTA}    # фиолетовый цвет знаков
	CYAN='\033[0;36m'       #  ${CYAN}      # цвет морской волны знаков
	GRAY='\033[0;37m'       #  ${GRAY}      # серый цвет знаков

	# Цветом текста (жирным) (bold) :
	DEF='\033[0;39m'       #  ${DEF}
	DGRAY='\033[1;30m'     #  ${DGRAY}
	LRED='\033[1;31m'       #  ${LRED}
	LGREEN='\033[1;32m'     #  ${LGREEN}
	LYELLOW='\033[1;33m'     #  ${LYELLOW}
	LBLUE='\033[1;34m'     #  ${LBLUE}
	LMAGENTA='\033[1;35m'   #  ${LMAGENTA}
	LCYAN='\033[1;36m'     #  ${LCYAN}
	WHITE='\033[1;37m'     #  ${WHITE}

	# Цвет фона
	BGBLACK='\033[40m'     #  ${BGBLACK}
	BGRED='\033[41m'       #  ${BGRED}
	BGGREEN='\033[42m'     #  ${BGGREEN}
	BGBROWN='\033[43m'     #  ${BGBROWN}
	BGBLUE='\033[44m'     #  ${BGBLUE}
	BGMAGENTA='\033[45m'     #  ${BGMAGENTA}
	BGCYAN='\033[46m'     #  ${BGCYAN}
	BGGRAY='\033[47m'     #  ${BGGRAY}
	BGDEF='\033[49m'      #  ${BGDEF}

	tput sgr0     # Возврат цвета в "нормальное" состояние
}

function network_run {
	clear
	TASK=$1
	echo "${YELLOW}${BOLD}network $TASK${NORMAL}"
	echo "${GREEN}task: $TASK_TEXT${NORMAL}"
	RES=$(cat ./network/$TASK)
	echo
	echo "${CYAN}file 01 content:${NORMAL}"
	echo "$RES"
	echo
	echo "${MAGENTA}Result of execute:${NORMAL}"
	echo "${MAGENTA}${BOLD}sh ./network/$TASK${NORMAL}"
	sh ./network/$TASK
	echo
}

function network_01 {
	TASK_TEXT="Get the list of the network interfaces of the machine without displaying any detail for these interfaces. Only the list of names."
	network_run "01"
}

function network_02 {
	TASK_TEXT="Identify and display the Ethernet interface characteristics:\n\t(a) Identify broadcast address\n\t(b) Identify all IP adresses which are part of the same subnet"
	network_run "02"
}

function network_03 {
	TASK_TEXT="Identify the MAC address of the Wi-Fi card"
	network_run "03"
}

function network_04 {
	TASK_TEXT="Identifiy the default gateway in the routing table"
	network_run "04"
}
function network_05 {
	TASK_TEXT="Identify the IP address of the DNS that responds to the following url: slash16.org"
	network_run "05"
}
function network_06 {
	TASK_TEXT="Get the complete path of the file that contains the IP address of the DNS server you’re using"
	network_run "06"
}

function network_07 {
	TASK_TEXT="Query an external DNS server on the slash16.org domain name (ie. : google 8.8.8.8)"
	network_run "07"
}

function network_08 {
	TASK_TEXT="Find the provider of slash16.org"
	network_run "08"
}

function network_09 {
	TASK_TEXT="Find the external IP of 42.fr"
	network_run "09"
}

function network_10 {
	TASK_TEXT="Identify the network devices between your computer and the slash16.org domain"
	network_run "10"
}

function network_11 {
	TASK_TEXT="Use the output of the previous command to find the name and IP address of the device that makes the link between you (local network) and the outside world"
	network_run "11"
}

function network_12 {
	TASK_TEXT="Find the IP that was assigned to you by dhcp server"
	network_run "12"
}
function network_13 {
	TASK_TEXT="Thanks to the previous question and the reverse DNS find the name of your host"
	network_run "13"
}

function network_14 {
	TASK_TEXT="What file contains the local DNS entries"
	network_run "14"
}

function network_15 {
	TASK_TEXT="Make the intra.42.fr address reroute to 46.19.122.85"
	network_run "15"
}

function ping_ya {
	clear
	ping -c 3 ya.ru
}
function  ifconfig {
	clear
	/sbin/ifconfig
}
function meminfo {
	clear
	/bin/cat /proc/meminfo
}
#Создаем меню
function menu {
	clear
	echo
	echo "${RED}Main menu${NORMAL}"
	echo "\t1. network 01"
	echo "\t2. network 02"
	echo "\t3. network 03"
	echo "\t4. network 04"
	echo "\t5. network 05"
	echo "\t6. network 06"
	echo "\t7. network 07"
	echo "\t8. network 08"
	echo "\t9. network 09"
	echo "\t0. network 10"
	echo "\tw. network 11"
	echo "\te. network 12"
	echo "\tr. network 13"
	echo "\tt. network 14"
	echo "\ty. network 15"
	echo "\tq. Exit"
	echo "\t\tenter key of network task: "
	read -n 1 option
}
#Используем цикл While и команду Case для создания меню.

init_colors

while [ $? -ne 1 ]
do
	menu
	case $option in
	'q')
		break ;;
	1)
		network_01 ;;
	2)
		network_02 ;;
	3)
		network_03 ;;
	4)
		network_04 ;;
	5)
		network_05 ;;
	6)
		network_06 ;;
	7)
		network_07 ;;
	8)
		network_08 ;;
	9)
		network_09 ;;
	0)
		network_10 ;;
	'w')
		network_11 ;;
	'e')
		network_12 ;;
	'r')
		network_13 ;;
	't')
		network_14 ;;
	'y')
		network_15 ;;
	*)
		clear

echo "Нужно выбрать раздел";;
esac
echo "\n\n\t\t\tPress any key to continue"
read -n 1 line
done
clear
