FROM alpine:3.16.0

# Default CMake version for linux distribution
ARG CMAKE_VER=3.23.2

# Extract CMake files
WORKDIR /tmp/cmake
ADD https://github.com/Kitware/CMake/releases/download/v$CMAKE_VER/cmake-$CMAKE_VER-linux-x86_64.tar.gz .
RUN tar -xzf cmake-$CMAKE_VER-linux-x86_64.tar.gz

# Copy CMake files to output directory
WORKDIR /content/cmake
RUN mkdir bin
RUN cp -r /tmp/cmake/cmake-$CMAKE_VER-linux-x86_64/bin/* ./bin
RUN mkdir -p share/doc
RUN cp -r /tmp/cmake/cmake-$CMAKE_VER-linux-x86_64/doc/* ./share/doc
RUN mkdir -p share/man
RUN cp -r /tmp/cmake/cmake-$CMAKE_VER-linux-x86_64/man/* ./share/man
RUN mkdir -p share
RUN cp -r /tmp/cmake/cmake-$CMAKE_VER-linux-x86_64/share/* ./share

# Clean tmp directory
RUN rm -rf /tmp/*
