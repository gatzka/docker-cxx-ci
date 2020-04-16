FROM ubuntu:18.04
RUN apt-get update -y && apt-get install -y software-properties-common

RUN apt-get install -y wget
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key 2>/dev/null | apt-key add -
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add -

RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
RUN echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic main" >> /etc/apt/sources.list.d/llvm.list
RUN echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main" >> /etc/apt/sources.list.d/llvm.list
RUN echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main" >> /etc/apt/sources.list.d/llvm.list
RUN echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-10 main" >> /etc/apt/sources.list.d/llvm.list

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y ninja-build valgrind git pkg-config doxygen gcc-powerpc-linux-gnu gcc-powerpc64-linux-gnu gcc-arm-linux-gnueabihf gcc-aarch64-linux-gnu qemu-user curl unzip cmake

RUN apt-get install -y clang-10 clang-tidy-10 clang-format-10 clang-tools-10

