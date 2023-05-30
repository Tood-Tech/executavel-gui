#!/bin/bash

#Cria a imagem do docker
sudo docker stop $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)

sudo docker build -t dockerfile -f Dockerfile-mysql .

sudo docker run -d -p 3306:3306 --name ContainerBD -e MYSQL_ROOT_PASSWORD=sptech -e MYSQL_DATABASE=ToodDatabase dockerfile

sleep 2

sudo chmod 777 ToodInterface.jar
java -jar ToodInterface.jar
