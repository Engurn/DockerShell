#! /bin/usr/env bash

RootDir=/Engine/Core
# Create folder /Engine/Scripts
sudo mkdir -p "$RootDir"
# Set owner and groups and apply permissions this will temporarily be set to root:root
sudo chown -R root:root "$RootDir"
sudo chmod -R ug=rwx,o-rwx "$RootDir"

Zipfile=Files.tar.gz
if [ ! -f "$Zipfile" ]; then
  echo "No File Exists"
## wget the Scripts/zip file

sudo wget --no-check-certificate "https://github.com/EngineFw/DockerShell/blob/main/$Zipfile"
## Unzip the file and place it in  the folder /Engine/Scripts
sudo tar -xvf $Zipfile -C "$RootDir"
fi
#Download config File

#Copy Files to /Engine/Core
Files=("Config" "Boot" "Files/Acl.bash" "Files/Confirmation.bash")

  for File in "${Files[@]}"
  do
#Download the file
if [ !-f "Config.bash" ]; then
sudo wget https://github.com/EngineFw/DockerShell/blob/main/File.bash
# Bash into install.bash
sudo cp File.bash $RootDir/File.bash
  fi

#sudo bash /Eshell/P/Files/Logs.bash --new-log "Folder $folders has been created"
done

# Wget install.bash
if [ !-f "install.bash" ]; then
sudo wget https://github.com/EngineFw/DockerShell/blob/main/install.bash
# Bash into install.bash
sudo bash ./install.bash
fi

#Delete the download file
sudo rm -r ./loader.bash