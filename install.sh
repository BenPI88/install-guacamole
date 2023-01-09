#EVERYTHING I HAD TO MANUALLY DO (THANKS APACHE)
sudo apt install make
sudo apt update
sudo apt install default–jdk
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
cd /tmp
cucurl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.63/bin/apache-tomcat-9.0.63.tar.gz
sudo mkdir /opt/tomcat
cd /opt/tomcat
sudo tar xzvf /tmp/apache-tomcat-9.0.*tar.gz -C /opt/tomcat --strip-components=1
sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/
sudo cp tomcatconfig.service /etc/systemd/system/tomcat.service
sudo systemctl daemon-reload
cd /opt/tomcat/bin
sudo ./startup.sh run
sudo ufw allow 8080
sudo cp tomcatuserconfig.xml /opt/tomcat/conf/tomcat-users.xml
sudo systemctl restart tomcat
#required packages
sudo apt install libcairo2-dev -y
sudo apt install libjpeg-turbo8-dev -y
sudo apt install libpng12-dev -y
sudo apt install libtool-bin -y
sudo apt install uuid-dev -y
#feature packages
sudo apt install libavcodec-dev -y
sudo apt install libavformat-dev -y
sudo apt install libavutil-dev -y
sudo apt install libswsccale-dev -y
sudo apt install freerdp2-dev -y
sudo apt install libpango1.0-dev -y
sudo apt install libssh2-1-dev -y
sudo apt install libtelnet-dev -y
sudo apt install libvncserver-dev -y
sudo apt install libwebsockets-dev -y
sudo apt install libpulse-dev -y
sudo apt install libssl-dev -y
sudo apt install libvorbis-dev -y
sudo apt install libwebp-dev -y
#Pull Latest Guacamole Server
git clone https://github.com/apache/guacamole-server
cd guacamole-server
#Compile Latest Guacamole Server
autoreconf -fi
./configure --with-init-dir=/etc/init.d
make
#install
make install
ldconfig
#creates a .war file to install
mvn package
#copies the .war file to tomcat's directory
cp guacamole/target/guacamole-1.4.0.war /var/lib/tomcat/webapps/guacamole.war
#restart tomcat
/etc/init.d/tomcat7 restart
#start guacamole
/etc/init.d/guacd start
