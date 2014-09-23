#!/bin/bash
#go to cwd
cd ${PWD##*/}
#compile source to war
grails war
#sync assets to server
rsync web-app/* velo-user@178.62.231.151:~/assets
#copy war to remote server
scp target/LikeBike-0.2.war root@178.62.231.151:/var/lib/tomcat7/webapps/ROOT.war
#restart tomcat on server
ssh root@162.243.36.248 'service tomcat7 restart'
