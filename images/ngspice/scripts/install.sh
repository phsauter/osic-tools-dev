#!/bin/bash

source scl_source enable gcc-toolset-9

git clone ${REPO_URL} ${NAME}
cd ${NAME}

git checkout ${REPO_COMMIT}

./autogen.sh
./autogen.sh

./configure --disable-debug --enable-openmp --with-x --with-readline=no --enable-xspice --with-fftw3=yes --prefix=/foss/tools/${NAME}/${REPO_COMMIT}
make -j$(nproc) 
make install
