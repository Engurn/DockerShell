# 1 Config File
  if [ ! -f ./Config.bash ]; then
  wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/Engine/Config.bash" -O ./Engine/Config.bash
  else
  echo "Config Exists";
  fi

  # Make Sure Original File Exisits
if [ ! -f /Engine/Sources.bash ]; then
    wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/Engine/Sources.bash" -O "./Engine/Sources.bash"
fi

# Connect to Config File()
source ./Engine/Config.bash
# Attached Sources File.
source ./Engine/Sources.bash


echo "Before Continuing Please Edit the following files Within Config File"
read $Answer;
if [ "$Answer" == "Continue" ]; then
echo "We Can Continue"
echo $InstallTreafik 
echo $InstallPortainer
else
exit 0
fi

exit 0;


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
InstallPortainer
# Reset Samba
echo "Restarting Service Samba"
RestartService smbd restart
echo "Service Samba Restarted"
