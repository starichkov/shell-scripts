# https://docs.docker.com/samples/library/postgres/

CURRENT_DIRECTORY="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
DOCKER_GET_SCRIPT="$CURRENT_DIRECTORY/docker-get.sh"
$DOCKER_GET_SCRIPT

IMAGE_NAME="postgres:9.6-alpine"
CONTAINER_NAME="postgres-9.6"

CONTAINER_ID=$(sudo docker container ls -a --filter=name=$CONTAINER_NAME --format "{{.ID}}")

if [ "$CONTAINER_ID" = "" ]; then
    echo "No docker container with name $CONTAINER_NAME found, downloading image $IMAGE_NAME"
    sudo docker pull $IMAGE_NAME
    echo "Starting container $CONTAINER_NAME from image $IMAGE_NAME"
    sudo docker run --name $CONTAINER_NAME -p 5432:5432 -e POSTGRES_PASSWORD=postgres $IMAGE_NAME
else
    echo "Found docker container with name $CONTAINER_NAME, starting..."
    sudo docker container start $CONTAINER_NAME &
fi

echo "Info :: Exposed from the container '5432' port is not binded by default, do it manually using parameter '-p EXPOSED_PORT:HOST_PORT'"

echo "Info :: Order matters! If you put '-p' at the end - container won't start."

echo "Info :: Sample command (creates container with some default name): sudo docker run -p 5432:5432 -e POSTGRES_PASSWORD=postgres $IMAGE_NAME"

echo "Info :: sample command above will create new container each time you run it"

echo "To create container with specified name, use '--name NEW_CONTAINER_NAME parameter' "

# Removing all containers
# sudo docker container ls -a --filter=name=postgres --format "{{.ID}} {{.Names}}"
# sudo docker container ls -a >> ololo
# sudo docker container rm $(grep -oE "^(\w){0,12}" ololo)

