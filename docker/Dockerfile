FROM ubuntu

RUN apt-get update
RUN apt-get -y install git lsb-release

RUN git clone https://github.com/pblottiere/potree_env
RUN cd potree_env/install && sh before_install.sh
RUN cd potree_env/install && sh requirements.sh
RUN cd potree_env/install && mkdir -p $PWD/../potree_env_build_dir
RUN cd potree_env/install && sh lastools.sh $PWD/../potree_env_build_dir
RUN cd potree_env/install && sh lazperf.sh $PWD/../potree_env_build_dir
# RUN cd potree_env/install && sh pdal.sh $PWD/../potree_env_build_dir
# RUN cd potree_env/install && sh entwine.sh $PWD/../potree_env_build_dir
# RUN cd potree_env/install && sh greyhound.sh $PWD/../potree_env_build_dir
RUN cd potree_env/install && sh potree.sh $PWD/../potree_env_build_dir
RUN cd potree_env/tests/potree_entwine_greyhound/terrain/ && sh terrain.sh
RUN cp potree_env/docker/apache.conf /etc/supervisor/conf.d

CMD ["/bin/bash", "-e", "/potree_env/docker/start.sh"]
