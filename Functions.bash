#!/usr/bin/env bash

#Keywords

#group Creation

SetGroups()
{
  groups=("docker" "member" "dev" "testgroup")

  for group in "${groups[@]}";
  do
      if [ $(getent group ${group}) ]; then
        echo "group $group Already Exists"
        else
        sudo addgroup "$group"
         echo "${group} has been created"
        fi
  done
}

#Folder Creation
CreateFolders()
{
  folders=("/Engine/Core/Containers" "/Engine/Core/Samba" "/Engine/Core/Includes")

  for folder in "${folders[@]}";
  do
    if [ ! -d "${folder}" ]; then
           MakeFolder ${folder} --sudo
           echo "Folder ${folder} Has Been created"
    else
        echo "folder : ${folder} exists"
    fi
  done

}

SetPermissions()
{
#  Set Permission Folder to Manage the folders
  option=$1

  if [ "$option" == "--owner" ]; then
      user=$2
      group=$3
      folder=$4

      if [ -z "$user" ]; then
        $user=root
      fi

      if [ -z "$group" ]; then
          group=docker
      fi
      if [ -z "$folder" ]; then
          folder=$RootFolder
      fi
       sudo chown $user:$group $folder
  elif [ "$option" == "Access" ]; then
      folder=$2
      permissions=$3
      if [ ! -z "$folder" ]; then
          sudo chmod $permissions $folder -R
      else
        sudo chmod ug=rwx,o-rwx $RootFolder -R
      fi
  else
  {
    sudo chown root:docker $RootFolder -R
    sudo chmod ug=rwx,o-rwx $RootFolder -R
    echo "permissions have been set for $RootFolder"
  }
  fi
}

AptUpdate()
{
   sudo  apt update && sudo apt upgrade
}


Packageinstall()
{


  if dpkg -l | grep -q "$1" ; then
      echo "$1 Installed"
  else
    echo "$1 Not installed"
  fi
}

InstallTraefik()
{
  if dpkg -l | grep docker.io && dpkg -l | grep docker-compose ; then
    DownloadTraefik
     # the following snippet will install and overwrite any previous changes

        read -p "Webaddress to access ui (please use full http Address) : " access
        read -p "Your Email Address :" email
        file = $Containers/traefik/.env
        GenerateFile $file
        sudo echo "email=${email}" >> $file
        sudo echo "access=${access}" >> $filev
        docker-compose -f $Containers/traefik/docker-compose.yml up -d
        echo "Traefik has Successfully been initiated"
  fi
}


DownloadTraefik()
{

  if [ ! -f "${Containers}/traefik/docker-compose.yml" ]; then

     git clone https://github.com/Enginefw/traefik $Containers/traefik
  fi
}

GenerateFile()
{
  file=$1
  touch $file
}

AppendSamba()
{
#  Check if the file already Includeds  the following line of code
  if grep -q "^include = "$SambaLoader "$SambaFile"; then
  else
    sudo echo "include = $SambaLoader" >> "$SambaFile";
  fi

}