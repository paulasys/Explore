#!/bin/bash
if [ "$1" == "" ]
then
	echo "Insira o parâmetro"
else
	read -p "Host inicial: " start
	read -p "Host final: " end
	read -p "Portas a serem testadas em cada host: " ports

for ((host=$start; host<=$end; host++))
do
	for i in ${ports[@]};
	do
		hping3 -c 1 -S -p $i $1.$host | grep flags=SA
	done
done	 
fi>listening_ports.txt

