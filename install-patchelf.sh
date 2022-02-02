#!/usr/bin/env bash

prefix="${1:-/usr/local}"

set -ex

pushd /tmp
git clone https://github.com/NixOS/patchelf --branch 0.14.3
pushd patchelf
./bootstrap.sh
./configure --prefix="${prefix}"
make -j$(nproc)
make check
make install
popd
popd
