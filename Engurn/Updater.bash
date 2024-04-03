# Make Sure Original File Exisits

if [ "${UpdatedFileActive}" == "1" ] || [ "${1}" == "--override" ]; then

if [ ! -f /Engine/Sources.bash ]; then
    wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/Engine/Sources.bash" -O "/Engine/Sources.bash"
else
    if [ ! -d "/Engine/NV" ]; then
        mkdir -p /Engine/NV
    fi
    wget "https://raw.githubusercontent.com/EngineFw/DockerShell/main/Engine/Sources.bash" -O "/Engine/NV/Sources.bash"

fi
else
echo "Updater File Is Turned Off"
fi
# grep 'version=' ./Sources.bash
