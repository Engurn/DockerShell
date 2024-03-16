GenerateFile() {

  file=$1

  if [ "$2" == "--sudo" ]; then
    sudo touch $file
  else
    touch $file
  fi
}
