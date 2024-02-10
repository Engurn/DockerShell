#!/usr/bin/env bash
source ./Config.bash

#Generate New Groups
#The Following Functions will require
# Sudo permissions to create or modify system Changes

groups=("docker" "member" "editor")

GenerateGroups()
{
for group in "${groups[@]}"
do
  NewGroup "$group"
  echo "${group} has been created"
done
}

#This script will remove and
# Recreate the Groups As Long as they
# are not linked to a user.
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
  sudo addgroup "$1"
}

#This function will Delete Group
# Requires Sudo Permissions
# to use Simply Call DeleteGroup "Groupname"
DeleteGroup()
{
  sudo delgroup "$1"
}


 if [ "$1" == "--new-group"]; then
   GenerateGroups;
   else
     echo "Invalid command"



