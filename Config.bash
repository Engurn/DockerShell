#Main Settings
RootFolder=Engine/Core
Containers=$RootFolder/Containers
SambaFolder=$RootFolder/Samba
Includes=$RootFolder/Includes
SambaFile=/etc/samba/smb.conf


CallSource()
{
  Files=(
    "Engine/Core/Includes/Folders.bash"
    "Engine/Core/Includes/Downloader.bash"
    "Engine/Core/Includes/Files.bash"
    "Engine/Core/Includes/Groups.bash"
    "Engine/Core/Includes/Permissions.bash"
    "Engine/Core/Includes/Packages.bash"

  )
  
  for File in "${Files[@]}";
  do
  if [ -f ./${File} ];
  then
   source ./${File}
  else
  {
      wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/${File}" -O "./${File}"
  }
  fi
  done
}
