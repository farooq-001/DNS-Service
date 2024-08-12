# DNS-Service
# 1.Set Up a Dynamic DNS Service:
No-IP: https://www.noip.com/
Dynu: https://www.dynu.com/
DuckDNS: https://www.duckdns.org/

# 2.Install ddclient on Your Linux Server:
sudo apt-get update
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

# 5. http://snb-tech.sytes.net:9003/
