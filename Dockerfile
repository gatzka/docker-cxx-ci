FROM ubuntu:24.04
RUN apt-get update -y && apt-get install -y software-properties-common

RUN apt-get install -y wget curl
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null

RUN echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ noble main' | tee /etc/apt/sources.list.d/kitware.list >/dev/null

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y gcc-arm-none-eabi
RUN apt-get install -y g++-10-arm-linux-gnueabi
RUN apt-get install -y g++-11-arm-linux-gnueabi
RUN apt-get install -y g++-12-arm-linux-gnueabi
RUN apt-get install -y g++-13-arm-linux-gnueabi
RUN apt-get install -y g++-14-arm-linux-gnueabi

RUN apt-get install -y g++-10
RUN apt-get install -y g++-11
RUN apt-get install -y g++-12
RUN apt-get install -y g++-13
RUN apt-get install -y g++-14

RUN apt-get install -y g++-10-aarch64-linux-gnu
RUN apt-get install -y g++-11-aarch64-linux-gnu
RUN apt-get install -y g++-12-aarch64-linux-gnu
RUN apt-get install -y g++-13-aarch64-linux-gnu
RUN apt-get install -y g++-14-aarch64-linux-gnu

RUN apt-get install -y g++-10-riscv64-linux-gnu
RUN apt-get install -y g++-11-riscv64-linux-gnu
RUN apt-get install -y g++-12-riscv64-linux-gnu
RUN apt-get install -y g++-13-riscv64-linux-gnu
RUN apt-get install -y g++-14-riscv64-linux-gnu

RUN apt-get install -y g++-10-powerpc64-linux-gnu
RUN apt-get install -y g++-11-powerpc64-linux-gnu
RUN apt-get install -y g++-12-powerpc64-linux-gnu
RUN apt-get install -y g++-13-powerpc64-linux-gnu
RUN apt-get install -y g++-14-powerpc64-linux-gnu

RUN apt-get install -y g++-10-powerpc-linux-gnu
RUN apt-get install -y g++-11-powerpc-linux-gnu
RUN apt-get install -y g++-12-powerpc-linux-gnu
RUN apt-get install -y g++-13-powerpc-linux-gnu
RUN apt-get install -y g++-14-powerpc-linux-gnu

RUN apt-get install -y g++-10-arm-linux-gnueabihf
RUN apt-get install -y g++-11-arm-linux-gnueabihf
RUN apt-get install -y g++-12-arm-linux-gnueabihf
RUN apt-get install -y g++-13-arm-linux-gnueabihf
RUN apt-get install -y g++-14-arm-linux-gnueabihf

RUN apt-get install -y clang-14
RUN apt-get install -y clang-15
RUN apt-get install -y clang-16
RUN apt-get install -y clang-17
RUN apt-get install -y clang-18

RUN apt-get install -y clang-tidy-14
RUN apt-get install -y clang-tidy-15
RUN apt-get install -y clang-tidy-16
RUN apt-get install -y clang-tidy-17
RUN apt-get install -y clang-tidy-18

RUN apt-get install -y clang-format-14
RUN apt-get install -y clang-format-15
RUN apt-get install -y clang-format-16
RUN apt-get install -y clang-format-17
RUN apt-get install -y clang-format-18

RUN apt-get install -y clang-tools-14
RUN apt-get install -y clang-tools-15
RUN apt-get install -y clang-tools-16
RUN apt-get install -y clang-tools-17
RUN apt-get install -y clang-tools-18

RUN apt-get install -y libllvm14 lld-14
RUN apt-get install -y libllvm15 lld-15
RUN apt-get install -y libllvm16 lld-16
RUN apt-get install -y libllvm17 lld-17
RUN apt-get install -y libllvm18 lld-18

RUN apt-get install -y ninja-build valgrind git pkg-config doxygen graphviz qemu-user unzip cmake 

RUN apt-get install -y gdb-multiarch
 
RUN mkdir -p ~/.ssh && echo "StrictHostKeyChecking no\n" >> ~/.ssh/config
