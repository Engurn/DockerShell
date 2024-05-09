#!/usr/bin/env bash


SetPermissions()
{
# $1 is the foldername

# Add Perssmisions here
sudo chown -R root:docker $1
sudo chmod -R ug=rwx,o-rwx $1
}


# Added Acl permissions
SetUserAcl()
{
    sudo setfacl -dRm u:$1:rwx $2
    sudo setfacl -Rm u:$1:rwx $2
}

SetGroupAcl()
{
    sudo setfacl -dRm g:$1:rwx $2
    sudo setfacl -Rm g:$1:rwx $2
}

removeUserAcl()
{
    sudo setfacl -x u:$1 $2
}

removeGroupAcl()
{
    sudo setfacl -x g:$1 $2
}

DisplayAcl()
{
    getfacl $1;
}
