#Main Settings
RootFolder=Engine/Core
Containers=$RootFolder/Containers
SambaFolder=$RootFolder/Samba
Includes=$RootFolder/Includes
SambaFile=/etc/samba/smb.conf

# Add Sources

DownloadFiles()
{
  Files=(
    "Engine/Core/Includes/Folders.bash"
    "Engine/Core/Includes/Downloader.bash"
    "Engine/Core/Includes/Files.bash"
    "Engine/Core/Includes/Groups.bash"
  )
  for File in "${Files[@]}";
  do
  if [ -f ./${File} ];
  then
    echo "${File} Found"
    source ./${File}
  else
  {
      echo "${File} downloading"
      wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/${File} -o ./${File}"
  }
  fi
  done
}

DownloadFiles