#!/bin/bash

# Comment out the enterprise repository
sudo sed -i 's|^deb https://enterprise.proxmox.com|# deb https://enterprise.proxmox.com|' /etc/apt/sources.list.d/pve-enterprise.list

# Add or uncomment the no-subscription repository
sudo sed -i '/pve-no-subscription/ s|^# ||; /pve-no-subscription/! s|$|\
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription|' /etc/apt/sources.list

# Update the package list
sudo apt update
apt install openvswitch-switch

# Adding bridge vmbr1 to /etc/network/interfaces
sudo bash -c 'cat >> /etc/network/interfaces <<EOF

#internal interface for lab traffic
auto vmbr1
iface vmbr1 inet static
    address 172.0.0.1/24
    gateway 172.0.0.1
    ovs_type OVSBridge
    ovs_ports none
    ovs_mtu 1500

#span port for export to SecOnion
auto vmbr2
iface vmbr2 inet manual
        ovs_type OVSBridge
        ovs_ports none
        ovs_mtu 1500
EOF'

sudo systemctl restart networking
