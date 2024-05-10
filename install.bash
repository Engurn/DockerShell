
echo "----------------------------------------------------------------------------------------------------------"
echo "Before Continuing Please Edit the following files Within Config File, Press Enter to continue"
echo "----------------------------------------------------------------------------------------------------------"
echo "Installation started"
echo "----------------------------------------------------------------------------------------------------------"

# Connect to Config File()
source ./Lazarus/Config.bash
source ./Lazarus/Sources.bash
  CallSource
  Packageinstall
  # Generate Groups (these must be done first to apply the groups permission)
  GenerateGroups
  #Folder Creation
  Folders=("/${Includes}" "/${SambaFolder}" "/${Containers}")
  for Folder in "${Folders[@]}"; do
    if [ -d "${Folder}" ]; then
      echo "Folder ${Folder}  Exist"
    else
      GenerateFolder "${Folder}" --sudo
    fi
  done

  echo "Configuring Docker"
  echo "----------------------------------------------------------------------------------------------------------"
  # Add Docker Support

  if [ "$UseDefaultNetworks" == "1" ]; then

    for Network in "${Networks[@]}"; do
      if docker network ls | grep $Network; then
        echo "Network : ${Network} Exists"
      else
        DockerNetwork ${Network}
      fi
    done
  else
    echo "users Have chose to set Networks Later"
  fi

  if [ "$UseVolumes" == "1" ]; then
    for Volume in "${Volumes[@]}"; do
      if docker volume ls | grep $Volume; then
        echo "Volumes : ${Volume} Exists"
      else
        DockerVolume "${Volume}"
      fi
    done
  else
    echo "User Chose to set Volumes Later"
  fi
  # End Docker
  echo "----------------------------------------------------------------------------------------------------------"
  echo "Docker Configured"
  echo "----------------------------------------------------------------------------------------------------------"

  # Samba Configuration
  if [ "$ConfigureSamba" == "1" ]; then
    echo "Configuring Samba"
    ConfigureSamba
    echo "Samba Configured"

     # Reset Samba
  echo "Restarting Service Samba"
  RestartService restart samba
  echo "Service Samba Restarted"

  else
    echo "User Will Configure Samba at a later Date"
  fi
  echo "----------------------------------------------------------------------------------------------------------"

  # Samba Configuration
  # if [ "$LazarusServer" == "1" ]; then
  #   echo "Downloading LazarusServer"
  #   git clone https://github.com/Lazarus/LazarusServer $Containers/LazarusServer
  #   echo "LazarusServer Downloaded"
  # else
  #   echo "User Will Configure Samba at a later Date"
  # fi
  # echo "----------------------------------------------------------------------------------------------------------"


  # End Samba Configuration
  if [ "$UseTraefik" == "1" ]; then
    DownloadTraefik
  else
    echo "User Will Download Traefik Later"
  fi
  echo "----------------------------------------------------------------------------------------------------------"

 
  # Set Permissions
  echo Setting Permissions to Docker Volumes this may take a few minutes Please Wait!
  if [ -d "/var/lib/docker" ]; then
  SetUserAcl $USER /var/lib/docker
  SetGroupAcl docker /var/lib/docker
  elif [ -d "/var/snap/docker" ]; then
  SetUserAcl $USER /var/snap/docker
  SetGroupAcl docker /var/snap/docker
  fi

  echo "Permissions Set"
  echo "----------------------------------------------------------------------------------------------------------"

  # Start Traefik After copying
  if [ "$UseTraefik" == "1" ]; then
    StartTraefik
  fi
  # Install Portainer
  if [ "$UsePortainer" == "1" ]; then
    InstallPortainer

  else
    echo "User Chose not to use Traefik"
  fi

  echo "----------------------------------------------------------------------------------------------------------"

# End Script

echo "thanks for using the Installer Goodbye!"
