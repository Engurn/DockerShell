DownloadFile()
{
method=$1
if [ "${method}" == "--git" ]; then
  echo "git Download"
else
  echo "No Selection Made"
fi
}