#!/usr/bin/env bash
# Download the required Files.

# 1 Config File
  if [ ! -f ./Config.bash ]; then
  wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/Config.bash"
  fi

source ./Config.bash
#This script is inside the  Config.Bash Script
DownloadRequiredFiles

#Folder Creation
Folders=("/${Includes}" "/${SambaFolder}" "/${Containers}")

for Folder in "${Folders[@]}";
do
  if [ -d "${Folder}" ]; then
    echo "Folder ${Folder}  Exist"
  else
    GenerateFolder "${Folder}" --sudo
    fi
done
#Set Permissions
git