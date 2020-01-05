FROM ubuntu

COPY backup.sh /usr/bin/
COPY cron_backup /etc/cron.d/backup

RUN  apt-get update -q -q \
    && apt-get install rdiff-backup openssh-client cron bash --yes \
    && crontab /etc/cron.d/backup

ENTRYPOINT [ "cron", "-f" ]