#!/usr/bin/env bash

##################################################################
# script: listaUsuários.sh - manipula o diretório /etc/passwd    #
#                                                                #
# Autor: Matheus Siqueria (matheus.businessc@gmail.com)          #
# Mantenedor: Matheus Siqueira                                   #
#                                                                #
# Exemplo: ./flags.sh -s -m                                      #
#        Neste exemplo ficará em maiúsculos e em ordem           #
#        alfabética                                              #
#                                                                #
# Descrição: Irá extrair usuários do /etc/passwd, havendo        #
# a possibilidade de colocar em maiúsculo e em ordem alfabética  #
#........................................................        #
# Testado em:                                                    #
#         bash 5.1.16                                            #
#........................................................        #
# Histórico:                                                     #
#         v1.0 17/09/2022, Matheus                               #
#           - Adicionando -s,-h & -v                             #
#         v1.1 18/09/2022, Matheus                               #
#           - Adicionando -m                                     #
#         v1.2 18/09/2022, Matheus                               #
#           - Adicionando while com shift e teste de variável    #
#           - Adicionando 2 flags                                #
#                                                                #
##################################################################

#.....................VARIÁVEIS....................#

USERS="$(cat /etc/passwd | cut -f 1 -d ':' )"
MANUAL="
  $(basename $0) - [OPÇÕES]

    -h - exibi o manual do programa
    -v - versão
    -s - Ordena a saída
    -u - exibi usuários em maiúsculo
"
VERSION="v1.0"
FLAG_SORT=0
FLAG_UPPERCASE=0
#.....................EXECUÇÃO....................#
while [[ -n "$1" ]]
do
  case $1 in
    -h) echo "$MANUAL" && exit 0       ;;
    -v) echo "$VERSION" && exit 0      ;;
    -s) FLAG_SORT=1                    ;;
    -u) FLAG_UPPERCASE=1               ;;
     *) echo "Comando não encontrado, verifique o manual com o parâmetro -h." && exit 1 ;;
  esac
  shift
done
[[ $FLAG_SORT -eq 1 ]] && USERS=$(echo "$USERS" | sort)
[[ $FLAG_UPPERCASE -eq 1 ]] && USERS=$(echo "$USERS" | tr [a-z [A-Z])

echo "$USERS"
