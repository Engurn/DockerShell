#!/usr/bin/env bash
source ./Config.bash

SambaBackup()
{
  if [ -z "$2" ] && [ -z "$3" ]; then
  sudo cp -r "$SambaFile" "$SambaFile.backup"
  else
   sudo cp -r "$2" "$3"
  fi

}

AppendSamba()
{
  if grep -q "^include = "$SambaLoader "$SambaFile"; then
    echo "Match found"
  else
    sudo echo "include = $SambaLoader" >> "$SambaFile";
  fi
}



if [  "$1" == "--new-install" ]; then
SambaBackup "$SambaFile.backup" "$SambaFile"
SambaBackup
AppendSamba
else
  echo "failed"
fi