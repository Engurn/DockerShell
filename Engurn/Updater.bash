# Make Sure Original File Exisits

if [ "${UpdatedFileActive}" == "1" ] || [ "${1}" == "--override" ]; then

if [ ! -f /Engurn/Sources.bash ]; then
    wget "https://raw.githubusercontent.com/EngurnFw/DockerShell/main/Engurn/Sources.bash" -O "/Engurn/Sources.bash"
else
    if [ ! -d "/Engurn/NV" ]; then
        mkdir -p /Engurn/NV
    fi
    wget "https://raw.githubusercontent.com/EngurnFw/DockerShell/main/Engurn/Sources.bash" -O "/Engurn/NV/Sources.bash"

fi
else
echo "Updater File Is Turned Off"
fi
# grep 'version=' ./Sources.bash
