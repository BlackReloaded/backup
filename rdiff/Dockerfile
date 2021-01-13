FROM ubuntu:20.04

COPY backup.sh /usr/bin/
COPY cron_backup /etc/cron.d/backup

RUN  apt-get update -q \
    && apt-get install python3-pip openssh-client cron bash --yes \
    && crontab /etc/cron.d/backup
RUN pip3 install -U rdiff-backup

ENTRYPOINT [ "cron", "-f" ]