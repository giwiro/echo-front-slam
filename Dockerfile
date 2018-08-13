# build from stagebuilder
FROM golang:alpine AS builder
ARG PROYECT_NAME="echo-front-slam"

RUN mkdir -p /go/src \
    && mkdir -p /go/bin \
    && mkdir -p /go/pkg
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:$PATH

RUN mkdir -p $GOPATH/src/${PROYECT_NAME}
ADD ./vendor $GOPATH/src
ADD . $GOPATH/src/${PROYECT_NAME}
RUN cd $GOPATH/src/${PROYECT_NAME} && go build -o ${PROYECT_NAME}

# build dist image
FROM alpine AS release
ARG PROYECT_NAME="echo-front-slam"
WORKDIR /app
COPY --from=builder /go/src/${PROYECT_NAME} /app/
ENTRYPOINT ./${PROYECT_NAME}
