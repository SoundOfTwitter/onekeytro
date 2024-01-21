#!/bin/bash

publicIP=$(curl -s ifconfig.me)

# 添加用户 trojanuser
sudo useradd -m -s /bin/bash trojanuser

# 设置用户密码
sudo passwd trojanuser <<EOF
Liu2023
Liu2023
EOF

# 将用户 trojanuser 添加到 sudo 组
sudo usermod -G sudo trojanuser

# 以用户 trojanuser 执行 sudo groupadd certusers
su - trojanuser -c "echo Liu2023 | sudo -S groupadd certusers"

# 以用户 trojanuser 执行 sudo useradd -r -M -G certusers trojan
su - trojanuser -c "echo Liu2023 | sudo -S useradd -r -M -G certusers trojan"

su - trojanuser -c "echo Liu2023 | sudo -S useradd -r -m -G certusers acme"

su - trojanuser -c "echo Liu2023 | sudo -S apt update"

# su - trojanuser -c "echo Liu2023 | sudo -S apt upgrade -y"

su - trojanuser -c "echo Liu2023 | sudo -S apt install -y socat cron curl"

su - trojanuser -c "echo Liu2023 | sudo -S systemctl start cron"

su - trojanuser -c "echo Liu2023 | sudo -S systemctl enable cron"

su - trojanuser -c "echo Liu2023 | sudo -S apt install -y libcap2-bin xz-utils"

su - trojanuser -c "echo Liu2023 | sudo -S apt install -y nginx"

su - trojanuser -c "echo Liu2023 | sudo -S rm /etc/nginx/sites-enabled/default"


echo 'server {' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '    listen 127.0.0.1:80 default_server;' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '    server_name hunterliu.uk.eu.org;' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '    location / {' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '        proxy_pass https://www.bjmu.edu.cn;' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '    }' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '}' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo 'server {' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '    listen 127.0.0.1:80;' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo "    server_name $publicIP;" | sudo tee -a /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '    return 301 https://hunterliu.uk.eu.org$request_uri;' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '}' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo 'server {' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '    listen 0.0.0.0:80;' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '    listen [::]:80;' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '    server_name _;' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '    location / {' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '        return 301 https://$host$request_uri;' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '    }' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '    location /.well-known/acme-challenge {' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '       root /var/www/acme-challenge;' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '    }' >> /etc/nginx/sites-available/hunterliu.uk.eu.org
echo '}' >> /etc/nginx/sites-available/hunterliu.uk.eu.org

su - trojanuser -c "echo Liu2023 | sudo -S ln -s /etc/nginx/sites-available/hunterliu.uk.eu.org /etc/nginx/sites-enabled/"

su - trojanuser -c "echo Liu2023 | sudo -S systemctl restart nginx"

su - trojanuser -c "echo Liu2023 | sudo -S mkdir -p /etc/letsencrypt/live"

su - trojanuser -c "echo Liu2023 | sudo -S chown -R acme:acme /etc/letsencrypt/live"

su - trojanuser -c "echo Liu2023 | sudo -S usermod -G certusers www-data"

su - trojanuser -c "echo Liu2023 | sudo -S mkdir -p /var/www/acme-challenge"

su - trojanuser -c "echo Liu2023 | sudo -S chown -R acme:certusers /var/www/acme-challenge"

su - acme - -c "curl https://get.acme.sh | sh"

su - acme - -c "acme.sh --set-default-ca --server letsencrypt"

su - acme - -c "acme.sh --issue -d hunterliu.uk.eu.org -w /var/www/acme-challenge"

su - acme - -c "acme.sh --install-cert -d hunterliu.uk.eu.org --key-file /etc/letsencrypt/live/private.key --fullchain-file /etc/letsencrypt/live/certificate.crt"

su - acme - -c "acme.sh --upgrade --auto-upgrade"

su - acme - -c "chown -R acme:certusers /etc/letsencrypt/live"

su - acme - -c "chmod -R 750 /etc/letsencrypt/live"

su - trojanuser -c "echo Liu2023 | sudo -S sudo apt-get install -y trojan"

sudo -u trojanuser bash -c "echo Liu2023 | sudo -S bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/trojan-gfw/trojan-quickstart/master/trojan-quickstart.sh)\""

su - trojanuser -c "echo Liu2023 | sudo -S chown -R trojan:trojan /usr/local/etc/trojan"


sed -i '8s/.*/        "aDm8H%MdA"/' /usr/local/etc/trojan/config.json
sed -i '13s/.*/        "cert": "\/etc\/letsencrypt\/live\/certificate.crt",/' /usr/local/etc/trojan/config.json
sed -i '14s/.*/        "key": "\/etc\/letsencrypt\/live\/private.key",/' /usr/local/etc/trojan/config.json
sed -i '9d' /usr/local/etc/trojan/config.json

sed -i '9,$s/^/\n/' /etc/systemd/system/trojan.service
sed -i '9s/.*/User=trojan/' /etc/systemd/system/trojan.service


su - trojanuser -c "echo Liu2023 | sudo -S systemctl daemon-reload"

su - trojanuser -c "echo Liu2023 | sudo -S setcap CAP_NET_BIND_SERVICE=+eip /usr/local/bin/trojan"

su - trojanuser -c "echo Liu2023 | sudo -S systemctl enable trojan"

su - trojanuser -c "echo Liu2023 | sudo -S systemctl restart trojan"

su - trojanuser -c "echo Liu2023 | sudo -S systemctl status trojan"

su - trojanuser -c "echo Liu2023 | sudo -S systemctl enable trojan"

su - trojanuser -c "echo Liu2023 | sudo -S systemctl enable nginx"

sudo bash -c 'echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf'
sudo bash -c 'echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf'
sudo sysctl -p
