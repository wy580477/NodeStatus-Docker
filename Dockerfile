FROM cokemine/nodestatus

COPY ./content /workdir

RUN apk add --no-cache curl runit \
    && sh /workdir/install.sh \
    && rm /workdir/install.sh \
    && chmod +x /workdir/service/*/run \
    && ln -s /workdir/service/* /etc/service/

ENV NODE_PORT=18000
ENV PORT=3000
ENV USER=admin
ENV PASSWORD=password
ENV NO_AUTH=Disable
ENV NO_HEADER=Disable
ENV CADDY_EMAIL=internal

EXPOSE 3000

ENTRYPOINT ["runsvdir", "-P", "/etc/service"]
