# BASE image - used as a starting point by MASTER and HOST images
# https://github.com/openshift/openshift-ansible/blob/master/images/installer/Dockerfile


# I use official Ubuntu 17.10 image as a starting point
FROM centos:7

MAINTAINER Sarel Janse van Rensburg <sarel.jvrensburg@is.co.za>

USER root

# install required packages
# && EPEL_PKGS="python2-boto python2-boto3 python2-crypto which python2-pip.noarch python-scandir python2-packaging" \
# && yum install -y --setopt=tsflags=nodocs $EPEL_PKGS \

RUN INSTALL_PKGS="python-lxml python-dns pyOpenSSL python2-cryptography \
    openssl java-1.8.0-openjdk-headless httpd-tools openssh-clients openssh-server iproute patch which unzip less telnet" \
 && yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS \
 && yum install -y epel-release \
 && rpm -V $INSTALL_PKGS \
 && yum clean all


RUN useradd apps
# copy keystores
COPY jks/* /u01/data/pki/

# copy tmp zip files - populate these if you don't want to pull new ones from nexus
COPY tmp/* /tmp/

# copy keys:
COPY pub/* /root/.ssh/

#setup sshd folder
RUN mkdir /var/run/sshd
COPY pub/id_rsa /etc/ssh/ssh_host_rsa_key
RUN chmod 600 /etc/ssh/ssh_host_rsa_key
RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 644 /root/.ssh/authorized_keys

#ENV USER_UID=1001 \
#ENV HOME=/root \
#    WORK_DIR=/usr/share/ansible \
#    OPTS="-v"
#
# Setup user:
#COPY bin /usr/local/bin
#RUN /usr/local/bin/user_setup
#
#USER ${USER_UID}
#	
# ensure that required directories are created
#RUN mkdir -p /root/.ssh
#
#ENTRYPOINT [ "/usr/local/bin/entrypoint" ]