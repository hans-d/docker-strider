FROM node:0.10
MAINTAINER Hans Donner

RUN mkdir -p /data
WORKDIR /data

RUN git clone -b relative https://github.com/hans-d/strider.git strider-src; \
    npm install -g strider-src strider-docker-build strider-docker-runner; \
    rm -rf strider-src

ADD ./launch.sh /launch.sh
RUN chmod +x /launch.sh

EXPOSE 3000
ENTRYPOINT [ "/launch.sh" ]