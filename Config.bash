#Main Settings
RootFolder=Engine/Core
Containers=$RootFolder/Containers
SambaFolder=$RootFolder/Samba
Includes=$RootFolder/Includes

SambaFile=/etc/samba/smb.conf

#

DownloadRequiredFiles()
{
  Files=("Downloader" "Files" "Folders","Permissions","Groups")
  for File in "${Files[@]}"
  do
    if [ -f ./${Includes}/${File}.bash ]; then
           source "./$Includes/${File}.bash"
    else
        wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/Engine/Core/Includes/${File}.bash"
        source "./$Includes/${File}.bash"
    fi
  done
}

