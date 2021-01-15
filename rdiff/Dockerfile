FROM ubuntu:20.04

COPY backup.sh /usr/bin/
COPY cron_backup /etc/cron.d/backup

RUN  apt update -q \
    && apt install python3-pip openssh-client cron bash --yes \
    && crontab /etc/cron.d/backup \
    && chmod +x /usr/bin/backup.sh \
    && pip3 install -U rdiff-backup

ENTRYPOINT [ "cron", "-f" ]