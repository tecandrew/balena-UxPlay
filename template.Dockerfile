## dockerize raspbian image
FROM balenalib/rpi-raspbian:buster AS builder

RUN install_packages cmake \
                     libavahi-compat-libdnssd-dev libplist-dev libssl-dev \
                     build-essential\
                     pkg-config \
                     git

RUN install_packages libraspberrypi-dev libraspberrypi-doc

WORKDIR /usr/src/app/

RUN install_packages libssl-dev \
    libplist-dev \
    libavahi-compat-libdnssd-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-libav \
    gstreamer1.0-plugins-bad

COPY ./UxPlay/ .
ENV CFLAGS -D_FILE_OFFSET_BITS=64
ENV CXXFLAGS -D_FILE_OFFSET_BITS=64

# run cmake twice (weird bug)
RUN mkdir build && cd build && cmake ../ && \
    cmake .. -DCMAKE_CXX_FLAGS="-O3" -DCMAKE_C_FLAGS="-O3" &&\
    make -j$(nproc) &&\
    make install

RUN install_packages python3-pip python3-setuptools rsync

WORKDIR /rootfs

WORKDIR /usr/src/app

RUN pip3 install git+https://github.com/larsks/dockerize

RUN dockerize -n --verbose -g video -g audio -o /rootfs/ /usr/local/bin/UxPlay &&\
    rm /rootfs/Dockerfile

# raspberry pi zero arch
FROM --platform=linux/arm/v6 busybox:stable

COPY --from=builder /rootfs/ ./

WORKDIR /usr/src/app/
COPY start.sh ./
COPY VERSION ./

# RUN chmod +x ./start.sh
# CMD ["sh", "./start.sh"]