FROM ubuntu

RUN apt-get update
RUN apt-get -y install git lsb-release

RUN git clone https://github.com/pblottiere/potree_env
RUN cd potree_env/install && sh before_install.sh
RUN cd potree_env/install && sh requirements.sh && sh potree_env.sh

CMD ["/bin/bash", "-e", "/potree_env/docker/start.sh"]
