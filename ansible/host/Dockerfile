# HOST image - used to create containers to be managed by master

# use builded ansible_base (defined in ../base/Dockerfile) as a starting point
FROM ansible_base:latest

# copy script from local disk to file system inside Docker image
COPY run.sh /var/run.sh

# adjust file permissions to make run.sh executable
RUN chmod 755 /var/run.sh

#RUN useradd -ms /bin/bash ansible

RUN adduser ansible; usermod -a -G root ansible

RUN echo "root:1234" | chpasswd
RUN echo "ansible:1234" | chpasswd

#RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22

#USER ansible
#WORKDIR /home/ansible

CMD ["bash"]

# Start SSH server
# CMD ["/usr/sbin/sshd", "-D"]