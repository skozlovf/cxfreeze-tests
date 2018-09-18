#!/usr/bin/env bash

echo "Build package ..."
docker build -t cxfreeze-test .
docker run --rm -v $(pwd):/project cxfreeze-test
echo -e "Build package ... done\n\n"


function dorun() {
    echo "------------ $1 ------------------------------------"
    
    echo -e "-------- Without LD_LIBRARY_PATH"
    docker run --security-opt seccomp:unconfined --rm -v $(pwd):/project $1 /project/theapp.sh
    echo ""

    echo -e "-------- With LD_LIBRARY_PATH"
    docker run --security-opt seccomp:unconfined --rm -v $(pwd):/project $1 /project/theapp.sh setenv
    echo ""
}

dorun debian:jessie-slim
dorun debian:stretch-slim
dorun ubuntu:16.04
