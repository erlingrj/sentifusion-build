FROM ubuntu:bionic

MAINTAINER sentiboard

RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake ninja-build \
    build-essential \
    autoconf \
    git \
    gcc \
    wget \
    pkg-config \
    automake \
    libtool \
    curl \
    make \
    g++ \
    unzip \
    python3-pip \
    gcovr lcov

# Download and install boost v1.73.0
RUN apt-get install libboost-all-dev -y --no-install-recommends




# Install cpplint
RUN pip3 install cpplint

# Install newest version of protobuf
RUN git clone https://github.com/protocolbuffers/protobuf.git /var/local/git/proto && \
    cd /var/local/git/proto && \
    git submodule update --init --recursive && \
    ./autogen.sh && \
    ./configure && \
   make -j$(nproc) && make -j$(nproc) check && make install & ldconfig



# Install Eigen3
RUN apt install libeigen3-dev -y --no-install-recommends

