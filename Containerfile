FROM ghcr.io/void-linux/void-glibc-full

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience" \
      maintainer="r.eddie.walsh@gmail.com"

COPY extra-packages /
# Run xbps-install twice. If there is an update to xbps it will only update itself and requires a second run for the rest of the packages.
RUN xbps-install -Syu && xbps-install -Syu && \
    grep -v '^#' /extra-packages | xargs xbps-install -Sy
RUN rm /extra-packages

#RUN   ln -fs /bin/sh /usr/bin/sh && \
#      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \
#      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
#      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree
#      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
#      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update
