FROM ubuntu:14.04
MAINTAINER drgeb<docker@drgeb.com>

# Update the default application repository sources list
RUN apt-get update

# Set the user back to ROOT
USER root

# install openssh server
RUN apt-get install -y openssh-server

RUN cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original
RUN chmod a-w /etc/ssh/sshd_config.original
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22

# Create a nonroot user, and switch to it
RUN /usr/sbin/useradd --create-home --home-dir /usr/local/nonroot --shell /bin/bash nonroot
RUN /usr/sbin/adduser nonroot sudo

# Set the HOME var
# which will be /root at this point
ENV HOME /usr/local/nonroot

RUN sudo su - nonroot
RUN mkdir .ssh
RUN chmod 700 .ssh
RUN ls -ald .ssh
RUN touch .ssh/authorized_keys

## make the terminal prettier
RUN echo 'export PS1="[\u@docker] \W # "' >> .bash_profile

ADD  mysshd/keys/boot2docker_docker_id_rsa.pub | cat >> .ssh/authorized_keys

RUN ECHO ********************************************************************************
RUN ECHO OK
RUN ECHO ********************************************************************************

CMD ["/usr/sbin/sshd", "-D"]
