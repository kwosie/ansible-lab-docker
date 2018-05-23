# MASTER image - used to create the master container to manage hosts

# use builded ansible_base (defined in ../base/Dockerfile) as a starting point
FROM ansible_base:latest

# install git package
RUN EPEL_TESTING_PKGS="git ansible" \
	&& yum install -y --setopt=tsflags=nodocs --enablerepo=epel-testing $EPEL_TESTING_PKGS \
	&& rpm -V $EPEL_TESTING_PKGS \
	&& yum clean all

ENV WORK_DIR=/usr/share/ansible

# copy content of ansible directory from local disk to file system inside Docker image
COPY ansible ${WORK_DIR}

# change working directory
WORKDIR ${WORK_DIR}

# generate RSA key pair to allow master to communicate with managed nodes without passphrase
RUN ssh-keygen -t rsa -q -N "" -C "master key" -f master_key 

RUN cp master_key /etc/ssh/ssh_host_rsa_key \
	&& cp master_key /root/.ssh/id_rsa \
	&& cp master_key.pub /root/.ssh/authorized_keys
