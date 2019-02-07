FROM node:10.15.1
ARG USERID

RUN userdel -r node && \
echo "Creating user with UID $USERID" && \
useradd --uid $USERID -m -d /home/user/ -s /bin/bash developer

WORKDIR /home/user
COPY ./entrypoint.sh /home/user/entrypoint.sh
USER developer

ENTRYPOINT ["bash", "./entrypoint.sh"]
