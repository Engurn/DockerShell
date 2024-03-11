#!/usr/bin/env bash

Folder=$1

GenerateFolder()
{
#$2 is the Sudo Option --sudo
  if [ "$2" == "--sudo" ];then
    sudo mkdir -p ${Folder}
  else
    mkdir -p ${Folder}
  fi
}

Test()
{
  echo "Hello Martin this is a test";
}



