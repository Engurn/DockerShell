#! /bin/usr/env bash

RootDir=/Engine
# Create folder /Engine/Scripts
sudo mkdir -p "$RootDir"
# Set owner and groups and apply permissions this will temporarily be set to root:root
sudo chown -R root:root "$RootDir"
sudo chmod -R ug=rwx,o-rwx "$RootDir"

if [ ! -f "Scripts.tar" ]; then
  echo "No File Exists"
## wget the Zips/Files.zip file
Zipfile=Files.tar.gz
sudo wget --no-check-certificate "https://github.com/EngineFw/DockerShell/blob/main/$Zipfile"
## Unzip the file and place it in  the folder /Engine/Sriptsc
sudo tar -xvf $Zipfile -C "$RootDir"
fi
# using Wget download install.bash Raw File
if [ ! -f "install.bash" ]; then
wget  https://raw.githubusercontent.com/EngineFw/DockerShell/main/install.bash
fi
## change into the install.bash
#sudo bash ~/Engine/install.bash

cat install.bash
exit() 0

#Delete the download file
#sudo rm -r ~/Engine/loader.bash