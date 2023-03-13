#!/usr/bin/env bash

#################################################################
# Script criado para ver informações úteis do sistema           #
#                                                               #
# Desenvolvido por Wellington Barros 05/01/2023                 #
#################################################################


# Guarda a data dentro da varíavel data
data=$(date +%F\ %T)
# Guarda apenas os dias dentro da variável uptime
uptime=$(uptime | grep -ohe 'up .*' | sed 's/,//g' | awk '{ print $2" "$3 }')
# lista os usuários conectados 
usuarios=$(w -hu)
# Lista o espaço em disco
disco=$(df -h)
# Lista a memória em Gigas
memoria=$(free -h)

echo -e "----------------- Bem vindo $USER-------------------"
echo -e "Hoje é: $data"
echo -e "Servidor está ligado há: $uptime"
echo -e "Usuários conectados ao sistema: $usuarios"
echo -e "---------------------------------------------------------"
echo -e "Uso de disco:"
echo -e "$disco"
echo -e "---------------------------------------------------------"
echo -e "Uso de memória:"
echo -e "$memoria"
echo -e "---------------------------------------------------------"
echo -e "Uso de memória e cpu usado pelo linux:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head
