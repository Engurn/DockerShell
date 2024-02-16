#!/usr/bin/env bash
#Installer File to Setup EngineSHell v1
RootDir="/Engine"
CoreFiles="$RootDir/Core"
Containers="$RootDir/Containers"
SambaFolder="$RootDir/Samba"
# This script is a cli based System Installation file.
source Files/Confirmations.bash
Agreement
echo "Your Answer is : $answer"
#
##Generate Groups
#sudo bash $CoreFiles/Files/Groups.bash --new-group
##Step 2
## Create Folders for EngineDocker And Apply permissions
#sudo bash $CoreFiles/Files/Folders.bash

#Set Samba Reference
