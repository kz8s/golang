FROM kz8s/centos
MAINTAINER jono@kz8s.io

ENV VERSION 1.6
ENV FILE go$VERSION.linux-amd64.tar.gz
ENV URL https://storage.googleapis.com/golang/$FILE
ENV SHA256 5470eac05d273c74ff8bac7bef5bad0b5abbd1c4052efbdbc8db45332e836b0b

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN set -eux &&\
  yum -y install git &&\
  yum -y clean all &&\
  curl -OL $URL &&\
	echo "$SHA256  $FILE" | sha256sum -c - &&\
	tar -C /usr/local -xzf $FILE &&\
	rm $FILE &&\
  mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
  
WORKDIR $GOPATH
