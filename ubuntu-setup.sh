#!/bin/bash

# Check for root privileges
if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root"
  exit
fi

########## Variables ###############
DDNS_PROVIDER_SERVER="YOUR_DDNS_PROVIDER_SERVER"
DDNS_USERNAME="YOUR_DDNS_USERNAME"
DDNS_PASSWORD="YOUR_DDNS_PASSWORD"
DOMAIN="farooq.net"

# Detect Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    VERSION=$VERSION_ID
else
    echo "Unknown OS. Exiting."
    exit 1
fi

# Install ddclient and configure EPEL if needed
install_ddclient() {
    case $OS in
        ubuntu|debian)
            apt-get update -y
            apt-get install ddclient -y
            ;;
        fedora|centos|rocky)
            yum install epel-release -y
            yum install ddclient -y
            ;;
        *)
            echo "Unsupported Linux distribution. Exiting."
            exit 1
            ;;
    esac
}

# Configure ddclient
configure_ddclient() {
    cat <<EOF > /etc/ddclient/ddclient.conf
# Configuration for DDNS provider
protocol=dyndns2
use=web, web=checkip.dyndns.com/, web-skip='IP Address'
server=$DDNS_PROVIDER_SERVER
login=$DDNS_USERNAME
password='$DDNS_PASSWORD'
$DOMAIN
EOF

    cat <<EOF > /etc/sysconfig/ddclient
DAEMON=yes
EOF
}

# Enable and start ddclient service
enable_ddclient() {
    systemctl enable ddclient
    systemctl start ddclient
}

# Main execution
install_ddclient
configure_ddclient
enable_ddclient

echo "ddclient setup completed. Your dynamic DNS is configured for $DOMAIN."
