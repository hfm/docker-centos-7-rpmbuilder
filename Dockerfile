FROM centos:7

RUN yum install -y -q yum-utils sudo wget rpmdevtools \
      && yum groupinstall -y -q 'Development Tools' \
      && useradd builder \
      && (echo 'Defaults !requiretty'; echo 'builder ALL=(ALL) NOPASSWD: ALL') > /etc/sudoers.d/noninteractive

USER builder
WORKDIR /home/builder
RUN rpmdev-setuptree

ONBUILD ADD ./rpmbuild/ /home/builder/rpmbuild/
