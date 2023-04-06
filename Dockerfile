FROM ubuntu:22.04
RUN apt-get update -y && apt-get install -y software-properties-common

RUN apt-get install -y wget curl
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key 2>/dev/null | apt-key add -
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN cd /opt && wget -q -O gcc-arm-none-eabi.tar.xz https://developer.arm.com/-/media/Files/downloads/gnu/12.2.mpacbti-rel1/binrel/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi.tar.xz && tar -xJf gcc-arm-none-eabi.tar.xz && rm gcc-arm-none-eabi.tar.xz
ENV PATH="/opt/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi/bin/:${PATH}"

RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ jammy main'
RUN echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main" >> /etc/apt/sources.list.d/llvm.list
RUN echo "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-15 main" >> /etc/apt/sources.list.d/llvm.list

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y ninja-build valgrind git pkg-config doxygen g++-powerpc-linux-gnu g++-powerpc64-linux-gnu g++-arm-linux-gnueabihf g++-aarch64-linux-gnu gcc-riscv64-linux-gnu g++-riscv64-linux-gnu qemu-user unzip cmake openjdk-19-jre-headless nodejs

RUN apt-get install -y clang-15 clang-13 clang-tidy-15 clang-tidy-13 clang-format-15 clang-format-13 clang-tools-13 gcc-12 g++-12 libgtest-dev googletest

RUN mkdir ~/.ssh && echo "StrictHostKeyChecking no\n" >> ~/.ssh/config

