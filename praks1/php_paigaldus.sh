#!bin/bash
# php paigaldusskript
#
# kontrollime, mitu korda php7.0 korral ok installed
# sõnad ol leitud ja vastus salvestame
# muutuja sisse:
PHP=$(dpkg-query -W -f='${Status}' php8.2 2>/dev/null | grep -c 'ok installed')
# kui PHP muutuja väärtus võrdub 0-ga
	if [ $PHP -eq 0 ]; then
		# siis ok installed ei ole leitud
		# ja väljastame vastava teate ning
		# paigaldame teenuse
		echo "Paigaldame php ja vajalikud lisad"
		apt install php8.2 libapache2-mod-php8.2 php8.2-mysql
		echo "php on paigaldatud"
#kui php muutuja väärtus võrdub 1-ga
	elif [ $PHP -eq 1 ]; then
		# siis ok installed on leitud 1 kord
		# ja teenus on juba paigaldatud
		echo "php on juba paigaldatud"
		# kontrollime olemasolu
			which php
# lõpetame tingimuslause
fi
# skripti lõpp
