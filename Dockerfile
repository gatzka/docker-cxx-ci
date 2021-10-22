FROM ubuntu:20.04
RUN apt-get update -y && apt-get install -y software-properties-common

RUN apt-get install -y wget
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key 2>/dev/null | apt-key add -
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add -

RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
RUN echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-12 main" >> /etc/apt/sources.list.d/llvm.list

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y ninja-build valgrind git pkg-config doxygen g++-powerpc-linux-gnu g++-powerpc64-linux-gnu g++-arm-linux-gnueabihf g++-aarch64-linux-gnu qemu-user curl unzip cmake gcc-11 g++-11 libgtest-dev googletest

RUN apt-get install -y clang-12 clang-tidy-12 clang-format-12 clang-tools-12

RUN cd /opt && wget -q -O gcc-arm-none-eabi.tar.bz2 https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.07/gcc-arm-none-eabi-10.3-2021.07-x86_64-linux.tar.bz2 && tar -xjf gcc-arm-none-eabi.tar.bz2 && rm gcc-arm-none-eabi.tar.bz2

ENV PATH="/opt/gcc-arm-none-eabi-10.3-2021.07/bin/:${PATH}"

RUN mkdir ~/.ssh && echo "StrictHostKeyChecking no\n" >> ~/.ssh/config

