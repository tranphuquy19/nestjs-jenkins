#!/bin/bash

docker run -d \
-p 8080:8080 \
-p 50000:50000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):$(which docker) \
-v /home/jenkins/data:/var/jenkins_home \
--user 1000:999 \
--name jenkins-server \
--restart=always \
jenkins/jenkins:lts