!/bin/bash

# Parsing_html2 - Shell Linux
# Programa busca e resolve hosts ativos em determinado site
# criado por: TecinforCerebro - Desec Security - Ricardo Longatto
# Versão 1.0

if [ "$1" == "" ];
then

        echo -e "\033[1;33m#########################################\033[m"
        echo -e "\033[1;33m|->        PARSING HTML            <-|\033[m"
        echo -e "\033[1;33m|-> Desec Security - Ricardo Longatto <-|\033[m"
        echo -e "\033[1;33m|-> ./DesecParsing.sh www.alvo.com.br <-|\033[m"
        echo -e "\033[1;33m#########################################\033[m"
exit

else
        echo -e "\033[1;34m####################################################################\033[m"
        echo -e "\033[1;31m->                      BUSCANDO HOSTS                         <-\033[m"
        echo -e "\033[1;34m####################################################################\033[m"

wget -q -O - $1 > $1hosts.html
grep "href" $1hosts.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > $1filterhosts.txt
cat $1filterhosts.txt 


fi
        echo -e "\033[1;34m#####################################################################\033[m"
        echo -e "\033[1;31m->                         RESOLVENDO HOSTS                        <-\033[m"
        echo -e "\033[1;34m#####################################################################\033[m"

for url in $(cat $1filterhosts.txt);
do host $url | grep "has address";

done

