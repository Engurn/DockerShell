#! /bin/bash

NewUser()
{
#Variable for username
 username=$1;
# Set Default Group
group=docker
# Set Location for Shell
 shell=/bin/bash
# Generate Home Folder
 home=/docker/users/$username
 # Set crypt3 Password Up for User
 password=$(perl -e 'print crypt($ARGV[0], "password")' $2)

# Do a check if the folder for the user to be stored in exisit
  FolderCreation /docker/users
#  Create Folder for User
  FolderCreation /docker/users/$username

#Run the command
sudo useradd -g $group -p $password  -s $shell -d $home $username

#Set Permissions to the folder
echo $username;
sudo chown -R $username:root /docker/users/$username
sudo chmod -R ug=rwx,o-rwx  /docker/users/$username

#End Code here
}

DelUser()
{

#  Deleting the user will not delete the group
  username=$1
  sudo deluser $username
}

