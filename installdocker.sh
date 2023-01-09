#install docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
#install guacamole
docker run --name some-guacd -d guacamole/guacd
docker run -e GUACD_LOG_LEVEL=debug -d guacamole/guacd
docker run --name some-guacd -d -p 4822:4822 guacamole/guacd
docker run --name some-guacamole \
    --link some-guacd:guacd        \
    ...
    -d -p 8080:8080 guacamole/guacamole
docker run --name some-guacamole \
    -e GUACD_HOSTNAME=172.17.42.1  \
    -e GUACD_PORT=4822             \
    ...
    -d -p 8080:8080 guacamole/guacamole
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > initdb.sql
docker run --name some-guacamole \
    --link some-guacd:guacd        \
    --link some-mysql:mysql        \
    ...
    -d -p 8080:8080 guacamole/guacamole
docker run --name some-guacamole \
    --link some-guacd:guacd        \
    -e MYSQL_HOSTNAME=172.17.42.1  \
    ...
    -d -p 8080:8080 guacamole/guacamole
docker run --name some-guacamole \
    --link some-guacd:guacd        \
    -e LDAP_HOSTNAME=172.17.42.1   \
    ...
    -d -p 8080:8080 guacamole/guacamole
docker run --name some-guacamole    \
    ...
    -v /local/path:/some-directory   \
    -e GUACAMOLE_HOME=/some-directory \
    -d -p 8080:8080 guacamole/guacamole
