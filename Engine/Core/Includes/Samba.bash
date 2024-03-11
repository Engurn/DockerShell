AppendSamba()
{
#  Check if the file already Includeds  the following line of code
  if grep -q "^include = "$SambaLoader "$SambaFile"; then
  echo "Samba File Included"
  else
    sudo echo "include = $SambaLoader" >> "$SambaFile";
  fi
    Loader=/Engine/Core/Samba/Loader.conf
  sudo cp .${Loader} ${Loader}
  sudo service smbd restart
}