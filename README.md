<!-- docker ps
docker ps stop CONTAINER_ID
docker images -a
docker rmi IMAGE_ID
docker build -t webhook-action:1.0 .
sudo docker run --rm --env username=root --env password=toor -dt -p 9999:9999 webhook-action:1.0 -->

From Docker hub
---------------
docker stop $(docker ps -q --filter ancestor=rajibchowdhury/webhook-actions )
docker rmi -f $(docker images | grep 'rajibchowdhury/webhook-actions')
docker run --rm --env username=root --env password=toor -dt -p 9999:9999 rajibchowdhury/webhook-actions:latest
