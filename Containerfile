FROM docker.io/library/fedora:39

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience" \
      maintainer="r.eddie.walsh@gmail.com"

COPY distrobox-deps /
COPY extra-packages /
RUN dnf upgrade --refresh -y && \
    grep -v '^#' /distrobox-deps | xargs dnf install -y --allow-erasing
RUN grep -v '^#' /extra-packages | xargs dnf install -y
RUN rm /extra-packages /distrobox-deps

#RUN   ln -fs /bin/sh /usr/bin/sh && \
#      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \
#      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
#      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree
#      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
#      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update
#     
