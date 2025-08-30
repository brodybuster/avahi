FROM alpine:edge

RUN apk --no-cache --no-progress add avahi avahi-tools tini
RUN rm /etc/avahi/services/*

RUN sed -i 's/.*enable-dbus=.*/enable-dbus=no/' /etc/avahi/avahi-daemon.conf \
  && sed -i 's/.*enable-reflector=.*/enable-reflector=yes/' /etc/avahi/avahi-daemon.conf

COPY --chmod=755 entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/entrypoint.sh"]

CMD ["avahi-daemon"]

VOLUME ["/etc/avahi/services"]
