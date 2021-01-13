FROM ubuntu:20.04

RUN apt update -q
RUN apt install python-dev libldap2-dev libsasl2-dev rdiff-backup build-essential curl python3-pip --yes
RUN pip3 install -U rdiffweb

COPY rdw.conf /etc/rdiffweb/

EXPOSE 8080

ENTRYPOINT [ "/usr/local/bin/rdiffweb" ]