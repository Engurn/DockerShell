PurgePackage
{
    sudo git purge docker.io docker-compose -y
}

RemoveVolume() {
    sudo docker volume remove $1
}

StopContainers() {
    sudo docker stop $1
}

RemoveNetwork() {
    sudo docker network remove $1
}

UNsetPermissions() {
    sudo chown -R root:root $1
}

RemoveDir() {
    sudo rm -R $1
}

PurgePackage
StopContainers portainer
StopContainers traefik
RemoveNetwork web
RemoveNetwork backend
RemoveVolume Hosting
UNsetPermissions /var/lib/docker
RemoveDir /Engine