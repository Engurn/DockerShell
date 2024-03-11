 
Packageinstall()
{
    sudo apt update -y
    sudo apt upgrade -y
    Packages=("git" "docker.io" "docker-compose" "nano")
    for Package in "${Packages[@]}";
    do
  if dpkg -l | grep -q "${Package}" ; then
      echo "$Package Installed"
  else
    echo "$Package Not installed"
    sudo apt install "${Package}" -y
  fi
  donez
}