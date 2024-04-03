traefik=$Containers/traefik
env=$traefik/.env

DownloadTraefik() {

  if [ ! -f "${Containers}/traefik/docker-compose.yml" ]; then
    git clone https://github.com/Enginefw/traefik $traefik
  fi
}

StartTraefik() {
  DockerNetwork web
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

InstallPortainer() {
  # Set the volume
  docker volume create portainer_data
  # Install Portainer
  docker run -d -p 8100:8100 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
}
