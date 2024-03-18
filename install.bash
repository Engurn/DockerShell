# 1 Config File
if [ ! -f ./Engine/Config.bash ]; then
  wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/Engine/Config.bash" -O ./Engine/Config.bash
else
  echo "Config Exists"
fi
echo "----------------------------------------------------------------------------------------------------------"
# Make Sure Original File Exisits
if [ ! -f ./Engine/Sources.bash ]; then
  wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/Engine/Sources.bash" -O "./Engine/Sources.bash"
fi

if [ "$CheckForUpgrades" == "1" ];
then
    sudo apt upgrade -y
    else 
    echo "Manual Upgrade turned on Please turn this on in the config file"
fi
echo "----------------------------------------------------------------------------------------------------------"
echo "Before Continuing Please Edit the following files Within Config File, Press Enter to continue"
echo "----------------------------------------------------------------------------------------------------------"
echo "Installation started"
echo "----------------------------------------------------------------------------------------------------------"

# Connect to Config File()
source ./Engine/Config.bash
# Attached Sources File.
source ./Engine/Sources.bash




read Answer
if [ -z "$Answer" ]; then

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

  echo "----------------------------------------------------------------------------------------------------------"
  echo "Folders Created"
  echo "----------------------------------------------------------------------------------------------------------"
  #Set Permissions
  SetPermissions "${RootFolder}"
  echo "Permissions for ${RootFolder} Have been set as root:docker"
  echo "----------------------------------------------------------------------------------------------------------"

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
  else
    echo "User Will Configure Samba at a later Date"
  fi
  echo "----------------------------------------------------------------------------------------------------------"

  # End Samba Configuration
  if [ "$UseTraefik" == "1" ]; then
    DownloadTraefik
  else
    echo "User Will Download Traefik Later"
  fi
  echo "----------------------------------------------------------------------------------------------------------"

  # Copy All Files
  echo "Copying All files from Engine to /Engine"
  sudo cp -R Engine /
  echo "File Copied"
  echo "----------------------------------------------------------------------------------------------------------"

  # Set Permissions
  echo "Setting permissions to Engine"
  SetPermissions /Engine
  echo Setting Permissions to /var/lib/docker this may take a few minutes Please Wait!
  SetPermissions /var/lib/docker
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

  # Reset Samba
  echo "Restarting Service Samba"
  RestartService smbd restart
  echo "Service Samba Restarted"

  echo "----------------------------------------------------------------------------------------------------------"

# End Script

else
  echo "User Cancelled Request"
  exit 0
fi

echo "thanks for using the Installer Goodbye!"
exit 0
