#!/bin/bash

#Cria a imagem do docker
sudo docker stop $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)

sudo docker build -t dockerfile -f Dockerfile-mysql .

sudo docker run -d -p 3306:3306 --name ContainerBD -e MYSQL_ROOT_PASSWORD=sptech -e MYSQL_DATABASE=ToodDatabase dockerfile

sleep 5

sudo chmod 777 login-tood-java-swing-1.0-SNAPSHOT-jar-with-dependencies.jar
java -jar login-tood-java-swing-1.0-SNAPSHOT-jar-with-dependencies.jar
