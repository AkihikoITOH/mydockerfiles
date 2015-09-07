###### Install C++ Kernel ######
# https://github.com/minrk/clingkernel
WORKDIR /tmp
RUN git clone https://github.com/minrk/clingkernel
WORKDIR /tmp/clingkernel
RUN ipython kernelspec install cling
WORKDIR /

