
GenerateGroups()
{
  for group in "${groups[@]}";
  do
      if [ $(getent group ${group}) ]; then
        echo "group $group Already Exists"
        else
        sudo addgroup "$group"
         echo "${group} has been created"
        fi
  done
}
