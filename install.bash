#!/usr/bin/env bash
#Installer File to Setup EngineSHell v1

LoadFiles()
{
  Files=("Config.bash" "Functions.bash");
for File in "${Files[@]}";
do
#  Download the file if it doesnt exisit
  if [ ! -f "${File}" ]; then
  wget "https://github.com/EngineFw/DockerShell/blob/main/${File}.bash"
  fi
#  Include the file
  if [ -f "${File}" ]; then
        source ${File}
  else
    echo "${File} Could not be found"
  fi

done
}
LoadFiles
#Check for updatesx and upgrades
AptUpdate
#Install required packages
Packageinstall git
Packageinstall docker.io
Packageinstall docker-compose
Packageinstall nano
Packageinstall samba

#Enter Continuation message
read -p "files Downloaded Correctly Continue " Agree
LoadFiles
if [ "$Agree" == "yes" ]; then
#  Load Required Functions From this function set
SetGroups
#Create the Folders
CreateFolders
#Set Permissions to the root directory
SetPermissions
# Docker network and volume Setup
DockerNetworkAdd
DockerVolumesAdd
#Download Traefik
DownloadTraefik
#Install Traefik
InstallTraefik

#Setup Samba
#Create a backup of the file system for samba
  if [ ! -f "$SambaFile.backup" ]; then
    cp $SambaFile $SambaFile.backup
  fi

#Create the folders if they dont exist
  if [ ! -d "/Engine/Core/Samba/Confs" ]; then
    MakeFolder "${SambaFolder/}Confs" --sudo
  fi
#  Insert the file include into /etc/samba/smb.conf
  AppendSamba
#  From this Point users just need to create Seperate Samba FIles within the /Engine/Core/Samba/Loader.conf
# Please See https://github.com/Enginefw/ -> Samba -> Readme.md for more informaiton on how to create seperate Shares


#End Script
else
  echo "We cannot continue"
fi


