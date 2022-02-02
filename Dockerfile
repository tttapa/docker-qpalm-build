ARG GCC_VERSION
ARG PYTHON_VERSION
FROM ghcr.io/tttapa/docker-python-build:gcc${GCC_VERSION}-py${PYTHON_VERSION}

RUN wget https://github.com/Kitware/CMake/releases/download/v3.22.2/cmake-3.22.2-linux-$(uname -m).sh && \
    sh ./cmake-3.22.2-linux-$(uname -m).sh --skip-license --prefix=/usr/local && \
    rm cmake-3.22.2-linux-$(uname -m).sh

COPY install-eigen.sh .
RUN bash install-eigen.sh

COPY install-patchelf.sh .
RUN bash install-patchelf.sh

RUN python3 -m pip install -U pip build auditwheel pytest twine
