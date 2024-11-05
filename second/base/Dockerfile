# BASE image - used as a starting point by MASTER and HOST images

# I use official Ubuntu 17.10 image as a starting point
# FROM ubuntu:17.10
FROM ubuntu
#ROM amazon/aws-cli

# install required packages
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        aptitude iputils-ping net-tools man vim openssh-server python3 tree less \
    && rm -rf /var/lib/apt/lists/*

COPY run.sh /var/run.sh

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

#RUN adduser ansible
#RUN echo "ansible:1234" | chpasswd

RUN echo "root:1234" | chpasswd


# ensure that required directories are created
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh

