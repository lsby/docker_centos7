FROM centos:7
USER root
# ==========================================================
ENV HOME=/root
ENV docker_script=$HOME/docker_script
ENV LANG=zh_CN.UTF-8 LANGUAGE=zh_CN:zh LC_ALL=zh_CN.UTF-8
# ==========================================================
ENV NOWNAME=start.sh
ADD ./docker_script/$NOWNAME $docker_script/$NOWNAME
RUN chmod a+x ./$docker_script/$NOWNAME

ENV NOWNAME=保持运行.sh
ADD ./docker_script/$NOWNAME $docker_script/$NOWNAME
RUN chmod a+x ./$docker_script/$NOWNAME
# ==========================================================
WORKDIR $docker_script
# ==========================================================
ENV NOWNAME=yum/centos7设置源.sh
ADD ./docker_script/$NOWNAME $docker_script/$NOWNAME
RUN chmod a+x $docker_script/$NOWNAME
RUN ./$NOWNAME

ENV NOWNAME=yum/centos7中文支持.sh
ADD ./docker_script/$NOWNAME $docker_script/$NOWNAME
RUN chmod a+x $docker_script/$NOWNAME
RUN ./$NOWNAME

ENV NOWNAME=yum/安装ssh.sh
ADD ./docker_script/$NOWNAME $docker_script/$NOWNAME
RUN chmod a+x $docker_script/$NOWNAME
RUN ./$NOWNAME

ENV NOWNAME=通用/设置root密码.sh
ADD ./docker_script/$NOWNAME $docker_script/$NOWNAME
RUN chmod a+x $docker_script/$NOWNAME
RUN ./$NOWNAME

ENV NOWNAME=通用/设置时区.sh
ADD ./docker_script/$NOWNAME $docker_script/$NOWNAME
RUN chmod a+x $docker_script/$NOWNAME
RUN ./$NOWNAME
# ==========================================================
# ENV NOWNAME=yum/安装vnc_xfce.sh
# ADD ./docker_script/$NOWNAME $docker_script/$NOWNAME
# RUN chmod a+x $docker_script/$NOWNAME
# RUN ./$NOWNAME
# ==========================================================
RUN ./保持运行.sh
# ==========================================================
ENV NOWNAME=null
WORKDIR $HOME
# ==========================================================
CMD $docker_script/start.sh
