FROM erickotenyo/gsky-base:latest
LABEL maintainer="Erick Otenyo <otenyo.erick@gmail.com>" 

ARG gsky_repo
ARG gsky_branch

COPY ./scripts/build_gsky.sh /
RUN ./build_gsky.sh $gsky_repo $gsky_branch

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

COPY ./entrypoint.sh /

ENTRYPOINT /wait && ./entrypoint.sh