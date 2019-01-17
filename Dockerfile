FROM ubuntu:16.04
MAINTAINER Collaboratory@OICR 
ENV VERSION=0.7.17
ENV NAME=bwa
ENV URL=https://github.com/lh3/bwa/releases/download/v${VERSION}/${NAME}-${VERSION}.tar.bz2
RUN apt-get update && apt-get install -y wget make g++ zlib1g-dev python bzip2
RUN wget -q -O ${NAME}.tar.bz2 ${URL}
RUN tar -xvjf ${NAME}.tar.bz2
WORKDIR /${NAME}-${VERSION} 
RUN make -j 4 
WORKDIR /
RUN cp ./${NAME}-${VERSION}/${NAME} ./ 
RUN strip ${NAME}
ENV PATH /:$PATH
CMD ["bwa", "mem"]
