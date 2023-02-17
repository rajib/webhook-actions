docker ps
docker ps stop CONTAINER_ID
docker images -a
docker rmi IMAGE_ID
docker build -t webhook-action:1.0 .
sudo docker run -dt -p 9999:9999 techatplay:1.0