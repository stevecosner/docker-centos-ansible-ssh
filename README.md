# docker-centos-ssh
Create a Centos Docker container that you can ssh to.

docker run example:

docker run --privileged --name ssh1 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 2222:22 -d  ssh-centos-1

