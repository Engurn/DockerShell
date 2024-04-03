ConfigureSamba() {
  sudo chown root:docker /etc/samba/smb.conf
  sudo chmod ug=rwx,o-rwx /etc/samba/smb.conf  
  #  Check if the file already Includeds  the following line of code
  if grep -q "^include = "$SambaFolder/Loader.conf "$SambaFile"; then
    echo "Samba File Included"
  else
    sudo echo "include = $SambaFolder/Loader.conf" >>"$SambaFile"
    echo "files updated"
  fi

  Loader=/Engurn/Core/Samba/Loader.conf
  # sudo chown root:root /etc/samba/smb.conf
  sudo cp .${Loader} ${Loader}
  sudo chown root:root /etc/samba/smb.conf
    

}
