FROM alpine:latest

WORKDIR /usr/src/app
COPY package.json package.json
COPY package-lock.json package-lock.json
RUN apk add --no-cache nodejs npm bash git openssl openssh-client nano curl iputils tzdata ca-certificates
RUN npm install -g --production --unsafe-perm node-red
RUN npm install --unsafe-perm --production && npm cache clean --force

ADD settings.js /usr/src/app/
ADD start.sh /usr/src/app/
COPY ./app ./


EXPOSE 1880
#CMD ["bash", "/usr/src/app/start.sh"]
CMD ["/bin/bash", "/usr/src/app/start.sh"]