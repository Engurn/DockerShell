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

UpdaterFileActive="0"