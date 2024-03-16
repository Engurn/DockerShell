# 1 Config File
  if [ ! -f ./Config.bash ]; then
  wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/Config.bash"
  else
  echo "Config Exists";
  fi

# Add the files.
source ./Config.bash

CallSource
Packageinstall
# Generate Groups (these must be done first to apply the groups permission)
  GenerateGroups
#Folder Creation
Folders=("/${Includes}" "/${SambaFolder}" "/${Containers}")
for Folder in "${Folders[@]}";
do
  if [ -d "${Folder}" ]; then
    echo "Folder ${Folder}  Exist"
  else
  GenerateFolder "${Folder}" --sudo
 fi
done

#Set Permissions
SetPermissions "${RootFolder}"
echo "Permissions for ${RootFolder} Have been set as root:docker"

# Add Docker Support

DockerNetwork Web
DockerNetwork Backend
DockerNetwork Frontend
DockerVolume Hosting
SetPermissions /var/lib/docker/volumes
DownloadTraefik
CreateEnv
# End Docker

# Samba Configuration
echo "Configuring Samba"
ConfigureSamba
echo "Samba Configured"
# End Samba Configuration



# Copy All Files
echo "Copying All files from Engine to /Engine"
sudo cp -R Engine /
echo "File Copied"

# Set Permissions
echo "Setting permissions to Engine"
SetPermissions /Engine
echo "Permissions Set"
# Start Traefik After copying
StartTraefik
# Reset Samba
echo "Restarting Service Samba"
RestartService smbd restart
echo "Service Samba Restarted"
