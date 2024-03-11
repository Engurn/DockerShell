BackupSamba()
{
    if [ ! -f $SambaFile.backup ];
    then
    sudo cp $SambaFile $SambaFile.backup
    fi
}

AppendSambaFile()
{
    BackupSamba
#  Check if the file already Includeds  the following line of code
  if grep -q "^include = "$SambaLoader "$SambaFile"; then
  else
    sudo echo "include = $SambaLoader" >> "$SambaFile";
  fi
    Loader=/Engine/Core/Samba/Loader.bash 
  sudo cp .${Loader} $Loader
  sudo service smbd restart
}