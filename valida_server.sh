#!/bin/bash

verificador=$(systemctl is-active httpd.service)
data_hora=$(date +"%Y-%m-%d %H:%M:%S")

if [ $verificador ]; then
	status="online"
else
	status="offline"
fi

registro_mesg_on="$data_hora | Apache server | $status | Seu servidor apache está ONLINE :D"
registro_mesg_off="$data_hora | Apache server | $status | Seu servidor apache está OFFLINE :("

if [ $status == "online" ]; then
	echo "$registro_mesg_on" >> /efs/Marcelo/online/on_server.log
else
	echo "$registro_mesg_off" >> /efs/Marcelo/offline/off_server.log
fi
