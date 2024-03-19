 
Packageinstall()
{
    sudo apt update -y
    Packages=("docker.io" "docker-compose" "nano")
    for Package in "${Packages[@]}";
    do
  if dpkg -l | grep -q "${Package}" ; then
      echo "$Package Installed"
  else
    echo "$Package Not installed"
    sudo apt install "${Package}" -y
  fi
  done
}

RestartService()
{
  # $1 = $service name
  service=$1
  operation=$2
  sudo service $service $operation
}