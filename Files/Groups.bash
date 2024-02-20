#!/usr/bin/env bash

#Generate New Groups
#The Following Functions will require
# Sudo permissions to create or modify system Changes

#Unless created manually docker will Be Created
groups=("docker" "member" "dev")


#This script will remove and
# Recreate the Groups As Long as they
# are not linked to +
# a user.
ReinstateGroups()
{
  for group in "${groups[@]}"
  do
    DeleteGroup "$group"
    NewGroup "$group"
  done
}

#This Function will Remove All Groups
# As Long as they not linked to a user
RemoveGroups()
{
    for group in "${groups[@]}"
    do
      DeleteGroup "$group"
    done
}


#Assign Group Function here.

#This function will create a new Group
# Requires Sudo Permissions
# to use Simply Call NewGroup "Groupname"
NewGroup()
{

  if [ $(getent group ${1}) ]; then
  echo "group $1 Already Exists"
  else
  sudo addgroup "$1"
   echo "${1} has been created"
   ApplyGroups $1
  fi

}

#This function will Delete Group
# Requires Sudo Permissions
# to use Simply Call DeleteGroup "Groupname"
DeleteGroup()
{
  sudo delgroup "$1"
}

ApplyGroups()
{
  sudo usermod -aG $1 $USER
  echo "Apply Group : $1 to user : $USER"
}


 if [ "$1" == "--new" ]; then
   echo "Coming soon"
   else
     echo "Number of groups found ${#groups[@]}"
     for group in "${groups[@]}"
     do
       NewGroup "$group"

     done
fi


