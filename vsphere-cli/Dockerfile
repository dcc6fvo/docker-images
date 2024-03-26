FROM ubuntu:16.04

WORKDIR /root

#ADD ./VMware-vSphere-CLI-5.5.0-1384587.x86_64.tar.gz /root/
ADD ./VMware-vSphere-CLI-5.5.0-2043780.x86_64.tar.gz /root/

RUN apt-get update && apt-get install -yq --no-install-recommends \
	build-essential \
	gcc \
	gcc-multilib \
	uuid \
	uuid-dev \
	perl \
	libxml-libxml-perl \
	perl-doc \
	libssl-dev \
	e2fsprogs \
	libarchive-zip-perl \
	libcrypt-ssleay-perl \
	libclass-methodmaker-perl \
	libdata-dump-perl \
	libsoap-lite-perl \
	iputils-ping \
	module-init-tools \
	unzip \
	git \
	curl \
	vim \
	libuuid-perl 

RUN /root/vmware-vsphere-cli-distrib/vmware-install.pl -d EULA_AGREED=yes

COPY ./hostops.sh /root/hostops.sh

CMD ["/bin/bash"]
