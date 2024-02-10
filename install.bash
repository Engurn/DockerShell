#!/usr/bin/env bash
#Installer File to Setup EngineSHell v1

# This script is a cli based System Installation file.


#Log test

#Generate Groups
sudo bash Files/Groups.bash
#Step 2
# Create Folders for EngineDocker And Apply permissions
sudo bash Files/Folders.bash

#Step 2
#Copy Files to Folder ie /Engine/Scripts/
sudo copy -R "boot.bash" "${RootDir}/Scripts/boot.bash"
sudo copy -R "Config.bash" "${RootDir}/Scripts/Config.bash"
sudo copy -R "Files/*" "${RootDir}/Scripts/Files"
cd /Engine/Scripts
#Create Aliases for Engine Scripts

#Set Samba Reference
