#!/bin/bash

#Script para resolver problemas no chaveiro chaveiro

# Menu para múltiplas opções

chave=$( dialog --title "sos" --radiolist "Marque as opções desejadas:" 0 0 0 "Instalar chaves" "" off "Iniciar/Recarregar-chaves" "" off "Atualizar chaves" "" off "Importar chaves" "" off "Destravar pacman" "" off --stdout )
if [ $chave = "Instalar chaves" ];then
   sudo pacman -Sy archlinux-keyring
elif [ $chave = "Iniciar/Recarregar-chaves" ];then
   sudo pacman-key --init;sudo pacman-key --populate archlinux biglinux;sudo pacman -Syy
elif [ $chave = "Atualizar chaves" ];then
   sudo pacman-key --refresh-keys
elif [ $chave = "Importar chaves" ];then
Import=$( dialog --title "Importar chave" --inputbox "complete o comando" 0 0 "gpg --recv-keys $1 " --stdout )
    exec $Import 
 fi
 if [ $chave = "Destravar pacman" ];then 
    sudo rm /var/lib/pacman/db.lck
   

fi     
          

