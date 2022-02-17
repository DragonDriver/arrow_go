# renovate: datasource=docker depName=gcc versioning=docker
ARG GCC_VERSION=latest
FROM gcc:$GCC_VERSION

# renovate: datasource=github-releases depName=Kitware/CMake
ARG CMAKE_VERSION=3.22.1

RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh \
      -q -O /tmp/cmake-install.sh \
      && chmod u+x /tmp/cmake-install.sh \
      && mkdir /usr/bin/cmake \
      && /tmp/cmake-install.sh --skip-license --prefix=/usr/bin/cmake \
      && rm /tmp/cmake-install.sh \
			&& apt-get -y update \
      && apt-get -y install vim git \
			&& mkdir -p /test/arrow \
			&& cd /test/arrow \
			&& git clone https://github.com/dragondriver/arrow_go.git

ENV PATH="/usr/bin/cmake/bin:${PATH}"
