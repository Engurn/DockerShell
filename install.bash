#!/usr/bin/env bash
#Installer File to Setup EngineSHell v1

Files=("Config.bash" "Functions.bash");
for File in "${Files[@]}";
do
#  Download the file if it doesnt exisit
  if [ ! -f "${File}" ]; then
  wget "https://github.com/EngineFw/DockerShell/blob/main/${File}.bash"
  fi
#  Include the file
  if [ -f "${File}" ]; then
        source ./${File}
  else
    echo "${File} Could not be found"
  fi

done

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

if [ "$Agree" == "yes" ]; then
#  Load Required Functions From this function set
SetGroups
#Create the Folders
CreateFolders
#Set Permissions to the root directory
SetPermissions
#Download Traefik
DownloadTraefik
#Install Traefik
InstallTraefik
#End Script
else
  echo "We cannot continue"
fi


# This script is a cli based System Installation file.
#
## Generate Groups
#  sudo bash $CoreFiles/Files/Groups.bash --new-group
## Create Folders for EngineDocker And Apply permissions
#  sudo bash $CoreFiles/Files/Folders.bash
## Set Samba Reference
#  sudo bash /CoreFiles/Files/Samba.bash
## Install Traefik Container
## Change to the Engine Directory Cont

#Download the git repository for traefik


#echo "Would you like to install the Docker Container Traefik, Type 'yes' to install or press enter to continue ";
#echo "Please Make sure Docker engine and docker compose are installed other wise this script will fail"
#read docker
#if [ "$docker" == "yes" ]; then

#fi
#
#
#if [ -z $Continue ]; then


    ## the following snippet will install and overwrite any previous changes
    #
    #echo $(ls -ls)
    #  docker-compose -f /Engine/Core/Docker/Containers/Services/traefik/docker-compose.yml up -d
    #echo "Traefik Installed"


#fi

##install git hub if the folder doesnt exisit
#if [ ! -d /Engine/Core/Docker/Containers/Services/traefik ]; then
#git clone https://github.com/Enginefw/traefik /Engine/Core/Docker/Containers/Services/traefik
#fi
#
##touch the env file And Pass the data
#
#GenerateFile()
#{
#  file=/Engine/Core/Docker/Containers/Services/traefik/.env
#  touch $file
#  #Need to grep this function
#  echo "access=1" >> $file;
#  echo "email=2" >> $file;
#}


#Copy ALl files over that are Required
#Boot /Engine/Boot.sh

