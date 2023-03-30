#!/bin/bash

if systemctl is-active --quiet httpd.service=="active"; then
	status="online"
else
	status="offline"
fi

registro_mesg="Apache | $status"

if [ $status == "online" ]; then
	echo "$registro_mesg" >> /efs/Marcelo/online_serv.log
else
	echo "$registro_mesg" >> /efs/Marcelo/offline_serv.log
fi
