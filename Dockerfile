FROM debian:latest
LABEL version="1.0"
LABEL author="@edt ASIX-M06"
LABEL subject="PAM host"
RUN apt-get update --fix-missing
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install samba-client cifs-utils procps iproute2 tree nmap vim less finger passwd libpam-pwquality nfs-common mlocate nano libpam-mkhomedir libpam-mount libpam-ldapd libnss-ldapd nslcd nslcd-utils ldap-utils openssh-server sshfs
RUN mkdir /opt/docker
COPY . /opt/docker/
RUN chmod +x /opt/docker/startup.sh
WORKDIR /opt/docker
CMD /opt/docker/startup.sh
