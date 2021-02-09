## NestJS with Jenkins

### Enable mount Docker sock into Docker containers

1. Edit file `/lib/systemd/system/docker.service`

```systemd
# /lib/systemd/system/docker.service

...
[Service]
Type=notify
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
ExecStart=/usr/bin/dockerd -H unix://var/run/docker.sock -H tcp://<LAN_IP_ADDRESS> --containerd=/run/containerd/containerd.sock

...
```

2. Restart Docker service

```shell
systemctl daemon-reload
systemctl restart docker.service
```

### Install Jenkins using Docker 

```bash
docker run \
    -d \
    -p 8080:8080 \
    -p 50000:50000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(which docker):$(which docker) \
    -v /home/jenkins/data:/var/jenkins_home \
    --user 1000:999 \
    --name jenkins-server \
    --restart=always \
    jenkins/jenkins:lts
```



