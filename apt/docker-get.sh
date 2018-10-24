DOCKER_BINARY=$(command -v docker)

if [ "$DOCKER_BINARY" = "" ]; then
    echo "No Docker found, installing..."
    sudo apt-get install docker.io
else
    echo "Found Docker in $DOCKER_BINARY"
fi

