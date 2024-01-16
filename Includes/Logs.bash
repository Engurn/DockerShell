#!/bin/bash
#Log Generation Script
#folder
folder="/docker/Projects/EngineShell/Logs/"
filename="$(date +%Y-%m-%d).log"
GenerateFile()
{
#generate a file here
#Check the file exists
if [ ! -f "$folder$filename" ]; then
#  Create the file with the
touch "$folder$filename";
#Make File Appendable But cannot be deleted (root cannot do this either)
sudo chattr +a "$folder$filename"
fi

}

GenerateLog()
{
  GenerateFile
  echo   "$(date +%H:%M:%S) : $USER : $1" >> "$filename"
}