FROM centos:7
USER root

ENV HOME=/root
ENV docker_script=$HOME/docker_script
ENV LANG=zh_CN.UTF-8 LANGUAGE=zh_CN:zh LC_ALL=zh_CN.UTF-8

ADD ./docker_script $docker_script
RUN find $docker_script -name '*.sh' -exec chmod a+x {} +

WORKDIR $docker_script
RUN ./通用/设置root密码.sh
RUN ./通用/设置时区.sh
RUN ./yum/centos7设置源.sh
RUN ./yum/centos7中文支持.sh
RUN ./yum/安装ssh.sh

RUN ./保持运行.sh
WORKDIR $HOME
CMD $docker_script/start.sh
