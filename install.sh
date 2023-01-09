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
git clone git://github.com/apache/guacamole-server.git
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
