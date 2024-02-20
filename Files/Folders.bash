#!/usr/bin/env bash
RootDir="/Engine"

# Global Variable for Folders
    folders=(
    "${RootDir}/Core/Docker/Containers/Sites"
    "${RootDir}/Core/Docker/Containers/Services"
    )

FolderPermissions()
{
  folder=$1
  sudo chown -R root:docker $folder
  sudo chmod -R ug=rwx,o-rwx $folder
}

NewFolder()
{
    if [ -d "$1" ]; then
          echo "Folder ${1} Exists "
          else
        sudo mkdir -p "$1"
        echo "folder : $1 Created"
        fi
}

  # Iterate over the folders of the array using a for loop
  # Iterate over the folders of the array using a for loop
#  Use @ within the for loop as a wildcard to choose all  the rows


if [ $1 == "--new" ]; then
echo "coming soon"
else
     echo "Found ${#folders[@]} Folders"
        for folder in ${folders[@]};
        do
        NewFolder $folder
        FolderPermissions $folder;
        done