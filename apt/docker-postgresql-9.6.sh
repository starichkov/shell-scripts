# https://docs.docker.com/samples/library/postgres/

echo "Removing previous docker installation"
sudo apt-get purge docker*

echo "Installing docker"
sudo apt-get install docker.io

echo "Docker :: pull postgres:9.6-alpine"
sudo docker pull postgres:9.6-alpine

echo "Info :: Exposed from the container '5432' port is not binded by default, do it manually using parameter '-p EXPOSED_PORT:HOST_PORT'"

echo "Info :: Order matters! If you put '-p' at the end - container won't start."

echo "Info :: Sample command (creates container with some default name): sudo docker run -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgres:9.6-alpine"

echo "Info :: sample command above will create new container each time you run it"

echo "To create container with specified name, use '--name NEW_CONTAINER_NAME parameter' "

echo "Docker :: running 'postgres:9.6-alpine' image with container name specified - 'postgres-9.6' "
sudo docker run --name postgres-9.6 -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgres:9.6-alpine

# Removing all containers
# sudo docker container ls -a >> ololo
# sudo docker container rm $(grep -oE "^(\w){0,12}" ololo)

