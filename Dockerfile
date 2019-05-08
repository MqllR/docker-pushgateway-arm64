FROM debian:9
MAINTAINER MqllR <>

ARG VERSION=0.8.0
ARG ARCH=arm64
ARG BINARY_NAME=pushgateway
ARG DOWNLOAD_URL=https://github.com/prometheus/${BINARY_NAME}/releases/download/v${VERSION}/${BINARY_NAME}-${VERSION}.linux-${ARCH}.tar.gz

RUN apt update && \
    apt install -y wget && \
    wget -q ${DOWNLOAD_URL} && \
    tar xzf ${BINARY_NAME}-${VERSION}.linux-${ARCH}.tar.gz ${BINARY_NAME}-${VERSION}.linux-${ARCH}/${BINARY_NAME} && \
    cp ${BINARY_NAME}-${VERSION}.linux-${ARCH}/${BINARY_NAME} .

FROM busybox:1-glibc
MAINTAINER MqllR <>

COPY --chown=nobody:nogroup --from=0 /pushgateway /bin/pushgateway

USER nobody
EXPOSE 9091

ENTRYPOINT [ "/bin/pushgateway" ]
