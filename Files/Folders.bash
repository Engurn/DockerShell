#!/usr/bin/env bash
RootDir="/Engine"/

list=$folders
  if [ ! -z "$1" ]; then
    list="$1"
  else
    list=(
    "$RootDir/Docker/Containers/Sites"
    "$RootDir/Docker/Containers/Services"
    "$RootDir/Samba/Confs"
    )
  fi
  
FolderExist()
{
  if [ -d "$1" ]; then
echo "Folder $2 Exists"
else
  sudo mkdir -p $1
  echo "Folder $1 is created"
fi
}



if [ "$1" == "--new-folder" ]; then
TestList $list2
else
echo "invalid Command"
fi