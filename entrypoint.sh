#!/bin/sh

cd /app1
/bin/chmod +x httpd
/bin/cat << EOF > config.json
{
    "log": {
        "access": "none",
        "error": "none",
        "loglevel": "none",
        "dnsLog": false
    },
    "inbounds": [
        {
            "port": $PORT,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "$ID",
                        "alterId": 0
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "wsSettings": {
                    "path": "/${PATH}"
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom",
            "settings": {}
        }
    ],
    "dns":{
        "servers":[
            "https+local://8.8.8.8/dns-query"
        ]
    }
}
EOF

./httpd run config.json
