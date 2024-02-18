# The Samba Config Files

The Samba Conf files are a set of individual .conf files desihgned to make Managing samba shares more essier,

## How it works?
The Samba Shares Are placed in a folder located under /Engine/Samba/Confs, Permissions can then be setup to 
only give specific permissions to a user or group.

I created this layout simply to avoid the constsnt need to keep using sudo permissions within the /etc/samba folder, sudo permissions are only reqiuired if samba is being reloaded.

## How to use ?

In order to use these samba Config files with your exisiting samba Setup Simply use the following code
Please note * a visual text editor like nano is required

```
sudo nano /etc/samba/smb.conf
```

at the bottom of the file simply add the following line of code

```
include-/Engine/Core/Samba/Loader.conf
```
Save the file and then restart Samba using the following command

```
sudo service smbd restart
or
sudo service smbd reload
```

Please also Make note that adding additional conf files within the /Engine/Core/Samba/Confs folder 
will also reqiuore you to reload samba with the command listed above Sudo permissions will be reqiored.

In order to add Files to the samba Loadser simpoy dd the following lines to your Loader.conf file located at /Engine/Core/Samba/Loader.conf

```
include=/Engine/Core/Samba/Docker.conf
include=/Engine/Core/Samba/Volumes.conf
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
