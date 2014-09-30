#!/bin/bash
#launch from project folder
#compile source to war
grails war
#sync assets to server
rsync -r web-app/* velo-user@178.62.39.62:/home/velo-user/assets/
#copy war to remote server
scp target/LikeBike-0.2.war root@178.62.39.62:/var/lib/tomcat7/webapps/ROOT.war
#restart tomcat on server
ssh root@178.62.39.62 'service tomcat7 restart'