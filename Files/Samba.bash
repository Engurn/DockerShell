#!/usr/bin/env bash
SambaFile=/etc/samba/smb.conf
SambaLoader=/Engine/Files/Samba/Loader.bash

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
  else
    sudo echo "include = $SambaLoader" >> "$SambaFile";
  fi
}



if [  "$1" == "--new-install" ]; then

  if [ ! -f "$SambaFile.backup" ]; then
    cp $SambaFile $SambaFile.backup
  fi
  AppendSamba
#  From this Point users just need to create Seperate Samba FIles within the loader
else
  echo "failed"
fi