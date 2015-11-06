FROM ubuntu:15.04
MAINTAINER Collaboratory@OICR 
ENV VERSION=0.5.9
ENV NAME=bwa
ENV URL=https://github.com/lh3/bwa/archive/${VERSION}.tar.gz
RUN apt-get update && apt-get install -y wget make g++ zlib1g-dev python
RUN wget -q -O ${NAME}.tar.gz $URL 
RUN tar -zxvf ${NAME}.tar.gz 
WORKDIR /${NAME}-${VERSION} 
RUN make -j 4 
WORKDIR /
RUN cp ./${NAME}-${VERSION}/${NAME} ./ 
RUN strip ${NAME}
ENV PATH /:$PATH
ENTRYPOINT ["bwa", "mem"]
