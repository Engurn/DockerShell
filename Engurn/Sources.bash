Version=1.0

CallSource()
{
  Files=(
    "Engurn/Core/Includes/Folders.bash"
    "Engurn/Core/Includes/Files.bash"
    "Engurn/Core/Includes/Groups.bash"
    "Engurn/Core/Includes/Permissions.bash"
    "Engurn/Core/Includes/Packages.bash"
    "Engurn/Core/Includes/Samba.bash"
    "Engurn/Core/Includes/Docker.bash"
    "Engurn/Boot.bash"
    "Engurn/Updater.bash"
  )
  
  for File in "${Files[@]}";
  do
  if [ -f ./${File} ];
  then
   source ./${File}
  else
  {
      wget "https://raw.githubusercontent.com/EngurnFw/DockerShell/main/${File}" -O "./${File}"
  }
  fi
  done
}