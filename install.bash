#!/usr/bin/env bash
# Download the required Files.

# 1 Config File
  if [ ! -f ./Config.bash ]; then
  wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/Config.bash"
  else
  echo "Config Exists";
  fi

  Files=("Downloader" "Files" "Folders","Permissions","Groups")
  for File in "${Files[@]}"
  do
    if [ -f ./${Includes}/${File}.bash ]; then
           source "./$Includes/${File}.bash"
    else
        echo "Attempting to download"
        wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/Engine/Core/Includes/${File}.bash"
        source "./$Includes/${File}.bash"
    fi
  done

exit

source ./Config.bash
#This script is inside the  Config.Bash Script
DownloadRequiredFiles
# Generate Groups (these must be done first to apply the groups permission)

Groups=("docker","dev","Manager");
for Group in "${Groups[@]}";
do
GenerateGroups "${Group}"
done

#Folder Creation
Folders=("/${Includes}" "/${SambaFolder}" "/${Containers}")

for Folder in "${Folders[@]}";
do
  if [ -d "${Folder}" ]; then
    echo "Folder ${Folder}  Exist"
  else
    GenerateFolder "${Folder}" --sudo
    SetPermissions "${Folder}
    fi
done
#Set Permissions
git