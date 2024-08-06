FROM alpine:latest

RUN apk add --no-cache gcc g++ musl-dev cmake make

WORKDIR /app

ADD https://www.sqlite.org/2018/sqlite-amalgamation-3260000.zip .

RUN unzip sqlite-amalgamation-3260000.zip && cd sqlite-amalgamation-3260000
COPY CMakeLists.txt /app/sqlite-amalgamation-3260000
RUN mkdir build && cd build
RUN cmake /app/sqlite-amalgamation-3260000 && cmake --build .
