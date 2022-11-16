FROM --platform=linux/amd64 centos:latest

RUN sed -i -e 's/^mirrorlist/#mirrorlist/g' -e 's/^#baseurl=http:\/\/mirror/baseurl=http:\/\/vault/g' /etc/yum.repos.d/CentOS-*repo

RUN yum update -y && yum upgrade -y 
RUN yum install -y \
    curl\
    stow\
    tmux\
    gcc\
    vim\
    nodejs\
    perl\
    python3\
    ruby\
    ctags\
    git


RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && yum update -y&& yum install -y testdisk
