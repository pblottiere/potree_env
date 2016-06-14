FROM ubuntu

RUN apt-get update
RUN apt-get -y install git lsb-release

RUN git clone https://github.com/pblottiere/potree_env
RUN cd potree_env/install && sh requirements.sh && potree_env.sh
