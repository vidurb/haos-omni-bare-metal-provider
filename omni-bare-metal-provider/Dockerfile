FROM ghcr.io/siderolabs/omni-infra-provider-bare-metal:v0.8.1 AS upstream

FROM ghcr.io/home-assistant/base:latest

RUN apk add --no-cache xz-libs

COPY --from=upstream /provider /usr/local/bin/provider
COPY --from=upstream /usr/bin/zbin /usr/bin/zbin
COPY --from=upstream /usr/bin/zbin /bin/zbin
COPY --from=upstream /var/lib/ipxe /var/lib/ipxe
COPY --from=upstream /assets /assets

COPY run.sh /
RUN chmod a+x /run.sh

WORKDIR /data

CMD [ "/run.sh" ]
