# 1 Config File
  if [ ! -f ./Config.bash ]; then
  wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/Config.bash"
  else
  echo "Config Exists";
  fi

# Add the files.
source ./Config.bash

# Generate Groups (these must be done first to apply the groups permission)

Groups=("docker" "dev" "manager");
for Group in "${Groups[@]}";
do
  GenerateGroup $Group
done

#Folder Creation
Folders=("/${Includes}" "/${SambaFolder}" "/${Containers}")

for Folder in "${Folders[@]}";
do
  if [ -d "${Folder}" ]; then
    echo "Folder ${Folder}  Exist"
  else
  GenerateFolder "${Folder}" --sudo
  sudo chown root:docker "${Folder}"
  sudo chmod ug=rwx,0-rwx "${Folder}"
    fi
done
#Set Permissions