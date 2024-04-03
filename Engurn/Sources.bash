Version=1.0

CallSource()
{
  Files=(
    "Engine/Core/Includes/Folders.bash"
    "Engine/Core/Includes/Files.bash"
    "Engine/Core/Includes/Groups.bash"
    "Engine/Core/Includes/Permissions.bash"
    "Engine/Core/Includes/Packages.bash"
    "Engine/Core/Includes/Samba.bash"
    "Engine/Core/Includes/Docker.bash"
    "Engine/Boot.bash"
    "Engine/Updater.bash"
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