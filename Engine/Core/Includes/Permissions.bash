#!/usr/bin/env bash


SetPermissions()
{
# $1 is the foldername

# Add Perssmisions here
sudo chown root:docker $1
sudo chmod ug=rwx,0-rwx $1
}


# SetPermissions()
# {
# #  Set Permission Folder to Manage the folders
#   option=$1

#   if [ "$option" == "--owner" ]; then
#       user=$2
#       group=$3
#       folder=$4

#       if [ -z "$user" ]; then
#         $user=root
#       fi

#       if [ -z "$group" ]; then
#           group=docker
#       fi
#       if [ -z "$folder" ]; then
#           folder=$RootFolder
#       fi
#        sudo chown $user:$group $folder
#   elif [ "$option" == "Access" ]; then
#       folder=$2
#       permissions=$3
#       if [ ! -z "$folder" ]; then
#           sudo chmod $permissions $folder -R
#       else
#         sudo chmod ug=rwx,o-rwx $RootFolder -R
#       fi
#   else
#   {
#     sudo chown root:docker $RootFolder -R
#     sudo chmod ug=rwx,o-rwx $RootFolder -R
#     echo "permissions have been set for $RootFolder"
#   }
#   fi
# }

SetAcpPermissions()
{
# SetAclPermissionsHere
}