FROM alpine:3.15.0

CMD ["/bin/sh"]

ENV HUGO_VERSION=0.91.2 \
    HUGO_USER=root \
    HUGO_SITE=/srv/hugo

ENV HUGO_URL=https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

ADD ${HUGO_URL} /tmp/

RUN tar -xzf /tmp/*.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/local/bin/ \
    && rm -rf /tmp/*
RUN apk add git

USER ${HUGO_USER}

WORKDIR ${HUGO_SITE}

VOLUME ${HUGO_SITE}

EXPOSE 1313

ENTRYPOINT ["hugo"]
