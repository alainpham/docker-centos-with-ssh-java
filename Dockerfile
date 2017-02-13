FROM centos:7.3.1611

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd java-1.8.0-openjdk-devel; yum clean all
RUN yum -y install unzip; yum clean all
ADD ./start.sh /start.sh
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

RUN chmod 755 /start.sh
# EXPOSE 22
RUN ./start.sh
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
