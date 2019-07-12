FROM tensorflow/tensorflow:1.12.3-gpu-py3

RUN apt-get update && apt-get install -y texlive-latex-base texlive-latex-extra ghostscript libgs-dev wget

RUN wget http://www.imagemagick.org/download/ImageMagick.tar.gz && \
    tar -xvf ImageMagick.tar.gz && \
    cd ImageMagick-7.* && \
    ./configure --with-gslib=yes && \
    make && \
    make install && \
    ldconfig /usr/local/lib && \
    cd .. && \
    rm ImageMagick.tar.gz && \
    rm -r ImageMagick-7.*

COPY requirements.txt .
RUN pip install -r requirements.txt

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8


