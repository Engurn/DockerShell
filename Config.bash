#Main Settings
#Use this to create the root folder
#Please Set your own Root Folder Below ie /var/Docker
RootFolder=/Engine/Docker
#Samba Folder Location Settings
#Do not add Starting or Trailing Slashes At Beginning or the end of the Foldername
#This is done By the Installer where needed.
SambaConf=Samba/Conf
#Logs Settings
#Do not add Starting or Trailing Slashes ie: MyLogs
LogsFolder=Logs
# Create Your Own FIlename or stick with the one below
LogFileName=$(date +%Y-%m-%d).log