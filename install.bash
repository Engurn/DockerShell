#!/usr/bin/env bash
#Installer File to Setup EngineSHell v1
RootDir="/Engine"
CoreFiles="$RootDir/Core"
Containers="$RootDir/Containers"
SambaFolder="$RootDir/Samba"
# This script is a cli based System Installation file.
source Files/Confirmations.bash
Agreement

if [ "$consent" == "true" ]; then
  #Generate Groups
  sudo bash $CoreFiles/Files/Groups.bash --new-group
  # Create Folders for EngineDocker And Apply permissions
  sudo bash $CoreFiles/Files/Folders.bash
fi

#Set Samba Reference
sudo bash /Engine/Files/Samba.bash
