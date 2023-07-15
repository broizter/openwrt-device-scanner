#!/usr/bin/fish

set SUBNETS 192.168.1.0/24 192.168.2.0/24

function telegram
        set TOKEN ""
        set CHATID ""
        set INPUT "$argv"

        curl -s -X POST https://api.telegram.org/bot"$TOKEN"/sendMessage -d chat_id=$CHATID -d text="$INPUT" > /dev/null
end

for s in $SUBNETS
        set IPMAC (nmap -sn $s | awk '/Nmap scan/{ip=$NF;next}ip && /MAC/{print ip, $3}')
        set LOGFILE (echo "$s" | head -c -4)
        for m in $IPMAC
                if not cat /root/db/$LOGFILE.txt | grep $m >/dev/null;
                        echo "$m NEW DEVICE" >> /root/db/$LOGFILE.txt
                        telegram "New device in subnet $LOGFILE - $m"
                end
        end
end
