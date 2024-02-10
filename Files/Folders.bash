#!/usr/bin/env bash
source ./Config.bash

list=$folders
  if [ ! -z "$1" ]; then
    list="$1"
  else
    list=(
    "$RootDir/Docker/Containers"
    "$RootDir/Docker/Services"
    "$RootDir/Docker/Scripts"
    )
  fi

FolderCreation()
{
    if [ -d "$1" ]; then
          echo "Sorry it seems the Folder ${1} Already Exists "
          else
        sudo mkdir -p "$1"
        echo "folder : $1 Created"
        fi
}

  # Iterate over the folders of the array using a for loop
  # Iterate over the folders of the array using a for loop
#  Use @ within the for loop as a wildcard to choose all  the rows
  for folders in "${list[@]}"
  do
      # Code to be executed for each folders
      # check for empty folders.
#      FolderCreation "${folders}";
FolderCreation $folders

sudo chown -R root:docker $folders
sudo chmod -R ug=rwx,o-rwx $folders
#sudo bash /Eshell/P/Files/Logs.bash --new-log "Folder $folders has been created"
done



