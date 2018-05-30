# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

FROM alpine:3.6

ENV HG_VERSION=4.4

RUN apk update \
    && apk add --no-cache bash python2 ca-certificates apache2 \
    && apk add --no-cache --virtual build-dependencies build-base python-dev py-pip \
    && pip install --no-cache --upgrade pip \
    && pip install --no-cache "mercurial>=$HG_VERSION,<$HG_VERSION.99" \
    && mkdir -p /etc/mercurial /repos /run/apache2 \
    && chown -R apache:apache /repos /run/apache2

COPY hgrc /etc/mercurial
COPY hgweb.cgi /var/www/localhost/htdocs
COPY hgweb.config /
COPY hgweb-httpd.conf /etc/apache2/conf.d

COPY entrypoint.sh /
COPY init-repos.sh /

COPY requirements.txt /
RUN pip install -r /requirements.txt \
    && apk del build-dependencies

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]
