See https://github.com/anthony-tuininga/cx_Freeze/issues/425

This repo provides scripts to build simple executable and test it in multiple
docker images to demonstrate `cx_Freeze` issues.

Test images:

* `debian:jessie-slim`
* `debian:stretch-slim`
* `ubuntu:16.04`

Build image: `ludditelabs/pyenv-multipy`.

Usage:

    > ./runtests.sh


Files
-----

    Dockerfile      - build image
    theapp.py       - simple app
    theapp.sh       - the app runner
    runtests.sh     - tests runner


`*.log` files created inside a docker container with commands:

    strace build/exe.linux-x86_64-3.6/theapp > noenv.log 2>&1
    LD_LIBRARY_PATH=build/exe.linux-x86_64-3.6/lib strace build/exe.linux-x86_64-3.6/theapp > withenv.log 2>&1
