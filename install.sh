#! /bin/sh

#Generate The New Groups
sudo addgroup Dev
sudo addgroup Manager
sudo Addgroup Volumes
sudo Addgroup Docker

sudo usermod -aG Dev Manager Volumes Docker $USER

#Generate Folders And Set Permissions
sudo mkdir -p /Docker/Sites /Docker/Logs /Docker/Services
sudo chown -R :Manager /Docker
sudo chmod -R ug=rwx,o=r

echo "Test"
