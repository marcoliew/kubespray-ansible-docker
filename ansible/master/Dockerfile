# MASTER image - used to create the master container to manage hosts

# use builded ansible_base (defined in ../base/Dockerfile) as a starting point
FROM ansible_base:latest

# install ansible package
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    ansible curl unzip ca-certificates pip python3-botocore python3-boto3 jq \
    && rm -rf /usr/lib/python3/dist-packages/ansible_collections/*

# Install aws cli
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
  && unzip awscliv2.zip \
  && ./aws/install \
  && rm -rf aws awscliv2.zip

# Copy aws cli config file to .aws
COPY config /root/.aws/.

# copy content of ansible directory from local disk to file system inside Docker image
COPY ansible /var/ans/

# generate RSA key pair to allow master to communicate with managed nodes
# default private key passphrase is '12345' (not a good idea for production environment ;)
#RUN ssh-keygen -t rsa -N 12345 -C "master key" -f master_key

COPY run.sh /var/run.sh

#RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# change working directory
WORKDIR /var/ans

# Use bash by default
SHELL ["/bin/bash", "-c"]


