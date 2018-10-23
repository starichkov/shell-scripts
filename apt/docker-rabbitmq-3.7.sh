# https://hub.docker.com/_/rabbitmq/

echo "Docker :: pull postgres:3.7-alpine"
sudo docker pull rabbitmq:3.7-management-alpine

sudo docker run --hostname my-rabbit --name rabbitmq-3.7 -p 5671:5671 -p 5672:5672 -p 15672:15672 rabbitmq:3.7-management-alpine
