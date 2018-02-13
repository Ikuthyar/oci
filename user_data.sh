#!/bin/bash
#runcmd:
FWLogFile=/tmp/fwm.log
 # running FW rules
sudo echo "adding FW rules for glusterd.service" >$FWLogFile
sudo firewall-cmd --zone=public --add-port=24007-24008/tcp --permanent
sudo firewall-cmd --zone=public --add-port=24009/tcp --permanent
sudo firewall-cmd --zone=public --add-service=nfs --add-service=samba --add-service=samba-client --permanent
sudo firewall-cmd --zone=public --add-port=111/tcp --add-port=139/tcp --add-port=445/tcp --add-port=965/tcp --add-port=2049/tcp --add-port=38465-38469/tcp --add-port=631/tcp --add-port=111/udp --add-port=963/udp --add-port=49152-49251/tcp  --permanent
sudo echo "Reloading FW rules" >>$FWLogFile
sudo firewall-cmd --reload
sudo echo "FW rules execution completed" >>$FWLogFile
