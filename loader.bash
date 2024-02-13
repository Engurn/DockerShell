#! /bin/usr/env bash

RootDir=/Engine
# Create folder /Engine/Scripts
sudo mkdir -p "$RootDir"
# Set owner and groups and apply permissions this will temporarily be set to root:root
sudo chown -R root:root "$RootDir"
sudo chmod -R ug=rwx,o-rwx "$RootDir"

if [ ! -f "Scripts.tar" ]; then
  echo "No File Exists"
## wget the Scripts/zip file
Zipfile=Files.tar.gz
sudo wget --no-check-certificate "https://github.com/EngineFw/DockerShell/blob/main/$Zipfile"
## Unzip the file and place it in  the folder /Engine/Sriptsc
sudo tar -xvf $Zipfile -C "$RootDir"
fi
# Wget install.bash
if [ !-f "install.bash" ]; then
sudo wget https://github.com/EngineFw/DockerShell/blob/main/install.bash
# Bash into install.bash
sudo bash ./install.bash
fi

#Delete the download file
sudo rm -r ./loader.bash