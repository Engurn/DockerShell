Version=1.0

CallSource()
{
  Files=(
    "./Lazarus/Core/Includes/Folders.bash"
    "./Lazarus/Core/Includes/Files.bash"
    "./Lazarus/Core/Includes/Groups.bash"
    "./Lazarus/Core/Includes/Permissions.bash"
    "./Lazarus/Core/Includes/Packages.bash"
    "./Lazarus/Core/Includes/Samba.bash"
    "./Lazarus/Core/Includes/Docker.bash"
    "./Lazarus/Boot.bash"
    "./Lazarus/Updater.bash"
  )
  
  for File in "${Files[@]}";
  do
  if [ -f ./${File} ];
  then
   source ./${File}
  else
  {
    echo "Error : ${File} Cant be found"; 
  }
  fi
  done
}