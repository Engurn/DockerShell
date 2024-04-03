 
Packageinstall()
{
    sudo apt update -y
    Packages=(
    "docker.io"
    "docker-compose"
    "nano"
    "samba"
    for Package in "${Packages[@]}";
    do
        sudo apt install ${Package} -y
  if dpkg -l | grep -q "${Package}" ; then
      echo "$Package Installed No need to install"
  else
    echo "$Package Has been installed"

  fi
  done
}

RestartService()
{
  # $1 = $service name
  service=$1
  operation=$2
  sudo systemctl unmask $service
  sudo systemctl enable $service
  sudo systemctl $operation $service
}