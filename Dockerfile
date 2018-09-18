# $ docker build -t cxfreeze-test .
# $ docker run --rm -v /path/to/project:/project cxfreeze-test
FROM ludditelabs/pyenv-multipy

RUN sudo apt-get update && sudo apt-get install -y \
    libyaml-dev unzip cmake flex bison

RUN cd $HOME && pyenv global 3.6.6

RUN python -m pip install docutils==0.14 PyYAML==3.13
# RUN python -m pip install cx_freeze==5.1.1
RUN python -m pip install cx_freeze==6.0b1

CMD cd /project && python cxsetup.py build
