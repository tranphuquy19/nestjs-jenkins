## NestJS with Jenkins

### Install Jenkins using Docker 

```bash
docker run \
-p 8080:8080 \
-p 50000:50000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):$(which docker) \
-v /home/christian/Documents/jenkins_home:/var/jenkins_home \
--name jenkins-server \
-d jenkins/jenkins:lts
```
