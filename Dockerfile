FROM python:buster

WORKDIR /root/

RUN apt-get update \
    && apt-get -y install make cmake \
    && pip3 install pillow \
    && pip3 install numba \
    && pip3 install imagehash \
    && pip3 install quart \
    && git clone https://github.com/fumiama/base16384.git \
    && cd base16384 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install

COPY ./image-mark /root/
CMD [ "cd /root/image-mark/", "python3 server_quart.py users img pwd.txt" ]