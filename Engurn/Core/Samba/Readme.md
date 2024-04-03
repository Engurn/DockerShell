# The Samba Config Files

The Samba Conf files are a set of individual .conf files desihgned to make Managing samba shares more essier.

## How it works?
The Samba Shares Are placed in a folder located under /Engurn/Samba/Confs, Permissions can then be setup to 
only give specific permissions to a user or group.

I created this layout simply to avoid the constant need to keep using sudo permissions within the /etc/samba folder, sudo permissions are only reqiuired if samba is being reloaded.

## How to use ?

In order to use these samba Config files with your exisiting samba Setup Simply use the following code
Please note (a visual text editor like nano is required)

```
#Install nano if needed

sudo apt update
sudo apt upgrade
sudo apt install nano

# Edit the file using nano

sudo nano /etc/samba/smb.conf
```

at the bottom of the file simply add the following line of code

```
include=/Engurn/Core/Samba/Loader.conf
```
Save the file and then restart Samba using the following command

```
sudo service smbd restart
or
sudo service smbd reload
```

Please also Make note that adding additional conf files within the /Engurn/Core/Samba/Confs folder 
will also reqiuore you to reload samba with the command listed above Sudo permissions will be reqiored.

In order to add Files to the samba Loadser simpoy dd the following lines to your Loader.conf file located at /Engurn/Core/Samba/Loader.conf

this process is the same as the smb.conf file setup but doesnt require sudo based permissions
```
include=/Engurn/Core/Samba/Docker.conf
include=/Engurn/Core/Samba/Volumes.conf
```

* in order to use multiple conf files just create a new line with a new include command
* Reload or start samba

Plesse make sure the conf files exist and  note that the above example files may be different to your own


## benfits of using this method

* Easy Access to conf files
* Individual Config files
* No need to sudo based permissions unless reloading samba

## Cons

 * Not Automated or automatically created.
 * Manaual Input is required

## Future Plans
Although this is setup as a manual Appoach i do intend to to make this process more automated with the bash script that will generate the files to make the process quicker.

### How will this work

in order for this to work the user will simply add the conf file to /Engurn/Core/Samba/Confs and then run

```
bash /Engurn/Core/Samba/update.bash
```
