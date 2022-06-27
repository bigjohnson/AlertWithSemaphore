#!/bin/bash
# the directory "/home/user/crons/" must be present
SEMAFORO=/home/user/crons/test.www.github.com.SEMAFORO
# Check the internmet connectivity
if ping -c 1 www.google.it &> /dev/null || ping -c 1 www.github.com &> /dev/null || ping -c 1 www.facebook.com &> /dev/null
then
        # Check what you want
        if curl -m 30 -s https://www.yoursite.com/ > /dev/null
        then
                # Code executed when test is ok
                if [ -e ${SEMAFORO} ]
                then
                        # Code executed when semaphore file is present, you can change it to send a mail, or some other alert methods
                        rm ${SEMAFORO}
                        #echo OK
                        /usr/local/bin/telegram-notify --title "Alert: Il sito www.github.com ha ripreso a funzionare." --success --quiet
                fi
        else
                # Code executed when test fail
                if [ ! -e ${SEMAFORO} ]
                then
                        # Code executed when semaphore file is not present, you can change it to send a mail, or some other alert methods
                        touch ${SEMAFORO} 
                        #echo NO
                        /usr/local/bin/telegram-notify --title "Alert: Il sito www.github.com non funziona più." --error --quiet
                fi
        fi
fi
