#!/bin/sh
apk update
apk add \
    bash \
    git \
    perl \
    make \
    cmake \
    flex \
    bison \
    automake \
    autoconf \
    libtool \
    qemu-arm \
    qemu-aarch64 \
    file \
    texinfo \
    zip \
    wget \
    coreutils \
    gawk \
    gmp-dev \
    libunistring-dev \
    libffi-dev
