FROM ubuntu:20.04 as build

WORKDIR /app

RUN apt update && apt install -y gcc make unzip git

ADD . .

RUN make all

FROM ubuntu:20.04

WORKDIR /app

COPY --from=build /app/wrk wrk
