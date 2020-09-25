FROM alpine:3.5

# Install OpenSSH
RUN apk add --no-cache openssh dialog

EXPOSE 22

# Setup .ssh with keys and config
ARG SSH_PRIVATE_KEY
RUN mkdir -p /root/.ssh
RUN chmod 700 /root/.ssh
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_ed25519
RUN chmod 600 /root/.ssh/id_ed25519
ADD conf/ssh.rc /root/.ssh/rc
ADD conf/config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown -Rf root:root /root/.ssh
ADD conf/sshd_config /etc/ssh/sshd_config

# Add scripts
RUN mkdir /var/run/sshd
ADD bin/run.sh /run.sh
RUN chmod +x /run.sh
ADD bin/menu.sh /menu.sh
RUN chmod +x /menu.sh

ADD VERSION /VERSION
CMD /run.sh
