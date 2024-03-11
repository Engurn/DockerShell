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
AppendSamba