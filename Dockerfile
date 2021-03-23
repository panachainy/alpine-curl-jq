FROM alpine:3.12.4

RUN apk add curl
RUN apk add jq

FROM alpine:3.12.4

ENV KUBECTL_VERSION="v1.7.0"

RUN apk add curl
RUN apk add jq

# Install kubectl
RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*

