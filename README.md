
Create a Centos Docker container that you can ssh to.

docker run example:

docker run --privileged --name ssh1 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 2222:22 -d  ssh-centos-1




Copy id_rsa_dev to your ~/.ssh directory

Install Ansible

Build the docker container from the cloned git directory:

docker build -t c1 .

Run the container:

docker run -itd -p 8080:80 -p 2222:22 c1-1

Port 22 will be opened on the container and 2222 will be opened on the host allowing reachability on the private network.

Ping the new container:

ping 172.17.0.2

If using a different docker bridge you may have a different ip address.

Test ssh to the container:

ssh -i ~/.ssh/id_rsa_dev root@172.17.0.2

Use an ansible adhoc command to test:

ansible docker -m ping -u root

If all good, perform update using ansible ad hoc:

ansible docker -m yum -a update_cache=yes -u root

Try and install nginx to test the webserver:

ansible docker -m yum -a "name=httpd state=present" -u root

Start the service:

ansible docker -m service -a "name=httpd state=started" -u root



