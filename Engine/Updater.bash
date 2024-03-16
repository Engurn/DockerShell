RootFolder=Engine/Core
Containers=$RootFolder/Containers
SambaFolder=$RootFolder/Samba
Includes=$RootFolder/Includes
SambaFile=/etc/samba/smb.conf

# Download the newest Version of sources
if [ ! -d /Engine/Core/NV ]; then
    mkdir -p /Engine/Core/NV
fi

wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/Engine/Sources.bash" -O "/Engine/NV/Sources.bash"

# grep 'version=' ./Sources.bash
