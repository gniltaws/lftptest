# # Only needed when testing on a workstation
# docker build --pull -t lftp_docker .
# docker run -it lftp_docker /bin/bash
FROM centos:centos7
LABEL maintainer="Todd Swatling (swatling@buffalo.edu)"
ENV TZ=America/New_York

RUN yum install -y --setopt=tsflags=nodocs lftp && yum clean all -y
ENV local_base_dir='/'
ENV box_base_dir='/openshifttest'
ENV concurrent_uploads='1'
ENV error_count='0'
COPY mirror.sh ./mirror.sh
RUN chmod +x ./mirror.sh
CMD sleep 1000
