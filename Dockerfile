FROM node:alpine

RUN mkdir /prince

WORKDIR /prince

RUN apk add --no-cache curl
RUN curl https://www.princexml.com/download/prince-12.5.1-alpine3.10-x86_64.tar.gz -o prince.tar.gz
RUN tar -zxvf prince.tar.gz
RUN rm prince.tar.gz

RUN apk add --no-cache \
  libxml2 \
  libxml2-utils \
  pixman \
  tiff \
  giflib \
  libpng \
  lcms2 \
  libjpeg-turbo \
  fontconfig \
  freetype \
  libgomp

ENV PRINCE_LOC=/prince/prince-12.5.1-alpine3.10-x86_64/lib/prince/bin/prince

RUN \
  mkdir -p /aws && \
  apk -Uuv add groff less python py-pip bash && \
  pip install awscli && \
  apk --purge -v del py-pip && \
  rm /var/cache/apk/*

