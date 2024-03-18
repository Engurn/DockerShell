# Do not Change these settings, Doing do could Make the installation unstable or become broken"
RootFolder=Engine/Core
Containers=$RootFolder/Containers
SambaFolder=$RootFolder/Samba
Includes=$RootFolder/Includes
SambaFile=/etc/samba/smb.conf

# Optional Settings
UsePortainer="1"
UseTraefik="1"
ConfigureSamba="1"
# Docker related Settings
UseVolumes="1"
UseDefaultNetworks="1"
Networks=("web" "backend")
Volumes=("Hosting")
#Upgrade system options
Checkforupgrades="0"
# Turn on  or of Updater.bash use --override to use this file if option is set to 0
# bash /Engine/Updater.bash --override
UpdaterFileActive="0"

# Group Management
  groups=("docker" "member" "dev")