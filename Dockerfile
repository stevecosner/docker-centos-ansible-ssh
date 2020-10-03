FROM centos/systemd


RUN yum install openssh-server -y

RUN mkdir /root/.ssh

ADD authorized_keys /root/.ssh

RUN chmod 600 /root/.ssh/authorized_keys

RUN chmod 700 /root/.ssh


EXPOSE 80

CMD ["/usr/sbin/init"]



