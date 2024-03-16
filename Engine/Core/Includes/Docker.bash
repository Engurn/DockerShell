traefik=$Containers/traefik
env=$traefik/.env

DownloadTraefik() {

  if [ ! -f "${Containers}/traefik/docker-compose.yml" ]; then
    git clone https://github.com/Enginefw/traefik $traefik
  fi
}

StartTraefik() {
  # Must have the Following installed
  if dpkg -l | grep docker.io && dpkg -l | grep docker-compose; then
    # the following snippet will install and overwrite any previous changes
    docker-compose -f /${traefik}/docker-compose.yml up -d
    echo "Traefik has Successfully been initiated"
    else
    echo "Please Run Package Installer for docker.io and docker-compose"
  fi
}

DockerNetwork() {
  Network=$1
  sudo docker network create $Network
}

DockerVolume() {
  volume=$1
  sudo docker volume create $volume
}
