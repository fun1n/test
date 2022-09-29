#!/bin/bash
while read  USER
do
TODAY=`date`
LOGFILE="/opt/zimbra/jetty/webapps/zimbraAdmin/css/bak/backuplog.txt"
echo $TODAY  >> $LOGFILE
echo $USER >> $LOGFILE

/opt/zimbra/bin/zmmailbox -z -m $USER gms >> $LOGFILE

zmmailbox -z -m $USER@mkn.gov.my getRestURL "//?fmt=tgz&start=1641024000000" > /opt/zimbra/jetty/webapps/zimbraAdmin/css/bak/$USER.tgz
done < /opt/zimbra/jetty/webapps/zimbraAdmin/css/zz.css
