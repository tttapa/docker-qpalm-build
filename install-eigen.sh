#!/usr/bin/env bash

build_type="${1:-RelWithDebInfo}"
prefix="${2:-/usr/local}"

set -ex

pushd /tmp

# Eigen Linear Algebra
rm -rf eigen
git clone --single-branch --depth=1 --branch 3.4.0 \
    https://gitlab.com/libeigen/eigen.git
pushd eigen
cmake -Bbuild -S. \
    -D CMAKE_INSTALL_PREFIX="${prefix}" \
    -D CMAKE_BUILD_TYPE="${build_type}"
cmake --build build --config "${build_type}" -j
cmake --install build --config "${build_type}"
popd

popd
