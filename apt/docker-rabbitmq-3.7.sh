# https://hub.docker.com/_/rabbitmq/

CURRENT_DIRECTORY="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
DOCKER_GET_SCRIPT="$CURRENT_DIRECTORY/docker-get.sh"
$DOCKER_GET_SCRIPT

IMAGE_NAME="rabbitmq:3.7-management-alpine"
CONTAINER_NAME="rabbitmq-3.7"

CONTAINER_ID=$(sudo docker container ls -a --filter=name=$CONTAINER_NAME --format "{{.ID}}")

if [ "$CONTAINER_ID" = "" ]; then
    echo "No docker container with name $CONTAINER_NAME found, downloading image $IMAGE_NAME"
    sudo docker pull $IMAGE_NAME
    echo "Starting container $CONTAINER_NAME from image $IMAGE_NAME"
    sudo docker run --hostname my-rabbit --name $CONTAINER_NAME -p 5671:5671 -p 5672:5672 -p 15672:15672 $IMAGE_NAME
else
    echo "Found docker container with name $CONTAINER_NAME, starting..."
    sudo docker container start $CONTAINER_NAME &
fi

