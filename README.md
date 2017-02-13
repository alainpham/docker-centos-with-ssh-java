This docker file allows you to spin up centos servers with ssh access.
I made this while I was looking for something to test ansible scripts on different hosts for deploying a Fuse/A-MQ cluster: 
https://github.com/alainpham/ansible-role-jboss-fuse-amq-ha


To build the docker image : 

docker build --rm -t ssh:centos7 .


docker run -d --name fusea ssh:centos7
docker run -d --name fuseb ssh:centos7

docker run -d -v <pathToYourLocalFolder>:/nfs:z --name amqa ssh:centos7
docker run -d -v <pathToYourLocalFolder>:/nfs:z --name amqb ssh:centos7


To connect to your containers 
standard user/password is user/user
root password is "user".

	ssh user@<containerIPAddress>
