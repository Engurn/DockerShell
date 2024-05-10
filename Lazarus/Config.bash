# Do not Change these settings, Doing do could Make the installation unstable or become broken"
RootFolder=/test/LazarusOS/Lazarus/Core
Containers=$RootFolder/Containers
SambaFolder=$RootFolder/Samba
Includes=$RootFolder/Includes
SambaFile=/etc/samba/smb.conf

# Optional Settings
UsePortainer="1"
UseTraefik="1"
ConfigureSamba="1"
useacl="1"1
# Docker related Settings
UseVolumes="1"
UseDefaultNetworks="1"
Networks=("web" "backend")
Volumes=("Hosting" "mysql_data")

# Group Management
groups=("docker" "member" "dev")