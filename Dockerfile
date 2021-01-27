FROM ubuntu:18.04
RUN apt-get update && apt-get install -y wget curl lsb-release gnupg mysql-client rsync curl gcc \
    libdbd-mysql-perl \
    libcurl4-openssl-dev \
    libev4 \
    python

WORKDIR /work
# download page https://www.percona.com/downloads/Percona-XtraBackup-2.4/LATEST/
RUN wget https://downloads.percona.com/downloads/Percona-XtraBackup-2.4/Percona-XtraBackup-2.4.21/binary/debian/focal/x86_64/Percona-XtraBackup-2.4.21-r5988af5-focal-x86_64-bundle.tar && tar xvf Percona-XtraBackup-2.4.21-r5988af5-focal-x86_64-bundle.tar
COPY *.deb ./
RUN dpkg -i *.deb && rm *.deb
ENTRYPOINT xtrabackup
