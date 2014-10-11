#!/bin/bash
#launch from project folder
#compile source to war
grails war
#sync assets to server
rsync -r -e 'ssh -p 23722' web-app/* root@office.7bits.it:/home/velo-user/assets/
#copy war to remote server
scp -P 23722 target/LikeBike-0.2.war  root@office.7bits.it:/var/lib/tomcat7/webapps/ROOT.war
#restart tomcat on server
ssh -p 23722 root@office.7bits.it 'service tomcat7 restart'