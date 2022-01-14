#!/usr/bin/env bash

set -x

env

ssh-add -l || true

ssh -T git@github.com || true

# statically compile tcpdump -- lifted from https://github.com/eldadru/ksniff/blob/master/Makefile
STATIC_TCPDUMP_NAME=tcpdump
TCPDUMP_VERSION=4.9.2
wget http://www.tcpdump.org/release/tcpdump-${TCPDUMP_VERSION}.tar.gz || exit 1
tar -xvf tcpdump-${TCPDUMP_VERSION}.tar.gz || exit 1
cd tcpdump-${TCPDUMP_VERSION} && CFLAGS=-static ./configure --without-crypto && make || exit 1
mv tcpdump-${TCPDUMP_VERSION}/tcpdump ./${STATIC_TCPDUMP_NAME} || exit 1
rm -rf tcpdump-${TCPDUMP_VERSION} tcpdump-${TCPDUMP_VERSION}.tar.gz || exit 1

