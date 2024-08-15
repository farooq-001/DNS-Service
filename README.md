# DNS-Service
# 1.Set Up a Dynamic DNS Service:
No-IP: https://www.noip.com/
Dynu: https://www.dynu.com/
DuckDNS: https://www.duckdns.org/

# 2.Install ddclient on Your Linux Server:
sudo apt-get update &&
sudo apt-get install ddclient

# 3.Configure ddclient:
sudo nano /etc/ddclient.conf
#####
protocol=http
use=web, web=checkip.dyndns.com/, web-skip='IP Address'
server=YOUR_DDNS_PROVIDER_SERVER
login=YOUR_DDNS_USERNAME
password='YOUR_DDNS_PASSWORD'
snb-tech.sytes.net

#####

# 4.Start and Enable ddclient:
sudo systemctl start ddclient
sudo systemctl enable ddclient

# 5. http://snb-tech.sytes.net:9001/  & http://snb-tech.sytes.net:9002/ & http://snb-tech.sytes.net:9003/

Username / Email: kx52m3r
Password: AFwsKx4pmx3y
DDNS Key Hostname: all.ddnskey.com
