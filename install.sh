#required packages
sudo apt install libcairo2-dev
sudo apt install libjpeg-turbo8-dev
sudo apt install libpng12-dev
sudo apt install libtool-bin
sudo apt install uuid-dev
#feature packages
sudo apt install libavcodec-dev
sudo apt install libavformat-dev
sudo apt install libavutil-dev
sudo apt install libswsccale-dev
sudo apt install freerdp2-dev
sudo apt install libpango1.0-dev
sudo apt install libssh2-1-dev
sudo apt install libtelnet-dev
sudo apt install libvncserver-dev
sudo apt install libwebsockets-dev
sudo apt install libpulse-dev
sudo apt install libssl-dev
sudo apt install libvorbis-dev
sudo apt install libwebp-dev
git clone git://github.com/apache/guacamole-server.git
cd guacamole-server
autoreconf -fi
./configure --with-init-dir=/etc/init.d
make
make install
ldconfig
mvn package
cp guacamole/target/guacamole-1.4.0.war /var/lib/tomcat/webapps/guacamole.war
/etc/init.d/tomcat7 restart
/etc/init.d/guacd start
