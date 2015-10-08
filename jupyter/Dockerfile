# Jupyterの各種カーネルのインストール
FROM akihikoitoh/jupyter-notebook:latest
MAINTAINER ITOH Akihiko

###### Shell Modules ######
RUN apt-get update \
&& apt-get install -y build-essential \
&& apt-get install -y wget \
&& apt-get install -y g++ \
&& apt-get install -y ruby
# RUN apt-get install -y ca-certificates

###### Install Kernels ######

RUN apt-get install -y software-properties-common python-software-properties

# Python Packages
# Numpy, Scipy, Matplotlib, Pandas, Sympy, Scikit-learn
RUN apt-get install -y python-setuptools \
    python-numpy \
    python-scipy \
    python-matplotlib \
    python-matplotlib-data \
    python-pandas \
    python-sympy \
    python-nose \
    python-sklearn \
    libhdf5-dev \
    libatlas-dev \
    libatlas3gf-base \
    libopenblas-dev \
    python-all-dev \
    libblas-dev \
    libblas3 \
    liblapack-dev \
    liblapack3 \
    liblapacke \
    liblapacke-dev \
    python-dev \
    libjpeg-dev \
    libfreetype6 \
    libfreetype6-dev \
    zlib1g-dev \
    gfortran \
    libffi-dev \
    libssl-dev \
    && apt-get build-dep -y python-imaging \
    && apt-get install -y python-imaging

RUN pip install --upgrade pip \
    && pip install pyopenssl ndg-httpsclient pyasn1 \
    && pip install Pillow \
    && easy_install http://cheeseshop.python.org/packages/source/p/pyparsing/pyparsing-1.5.7.tar.gz \
    && pip install pydot

# && pip install git+git://github.com/python-pillow/Pillow.git \
# && pip uninstall -y pyparsing \
# && pip install pyparsing==1.5.7 \
# && pip install https://pypi.python.org/packages/source/p/pyparsing/pyparsing-1.5.7.tar.gz \
# && pip install pydot
# && pip install -U pyparsing==1.5.7 pydot

RUN pip install cython \
    && pip install pyyaml \
    && pip install h5py \
    && pip install Theano \
    && pip install chainer \
    && pip install keras \
    && pip install pymatbridge

# set Data path
RUN bash -c 'echo "export PYLEARN2_DATA_PATH=/opt/data" >> /.bashrc'

# set Scripts path
RUN bash -c 'echo "export PATH=/opt/pylearn2/pylearn2/scripts:$PATH" >> /.bashrc'
###### Install R Kernel ######
# https://github.com/IRkernel/IRkernel

# Install R
RUN apt-get remove -y r-base-core \
    && echo 'deb http://cran.rstudio.com/bin/linux/ubuntu trusty/' >> /etc/apt/sources.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9 \
    && add-apt-repository -y ppa:marutter/rdev \
    && add-apt-repository -y ppa:marutter/c2d4u
RUN apt-get update -y \
    && apt-get install -y python-rpy r-base-core r-base r-cran-boot r-cran-class r-cran-cluster r-cran-codetools r-cran-kernsmooth r-cran-lattice r-cran-mass r-cran-matrix r-cran-mgcv r-cran-nlme r-cran-nnet r-cran-r2jags r-cran-rodbc r-cran-rpart r-cran-spatial r-cran-survival r-doc-html r-doc-info r-doc-pdf r-mathlib r-recommended \
    && apt-get upgrade -y

## Install IRKernel

RUN apt-get install -y libxml2-dev

# Install ZMQ
RUN apt-get install libzmq3-dev

RUN R -e "install.packages('devtools', repos='http://cran.us.r-project.org', dependencies=TRUE)" \
    && R -e "install.packages('RCurl', repos='http://cran.us.r-project.org')" \
    && R -e "library(devtools)" \
    && R -e "options('repos'='http://cran.us.r-project.org'); install.packages(c('rzmq','repr','IRkernel','IRdisplay'), repos = c('http://irkernel.github.io/', getOption('repos')), type = 'source')" \
    && R -e "IRkernel::installspec(user=FALSE)"

# Install Packages
ADD ./R_packages.txt /R_packages.txt
ADD ./install_R_packages.sh /install_R_packages.sh
RUN chmod +x /install_R_packages.sh
RUN /install_R_packages.sh
###### INstall Julia Kernel ######
# http://julialang.org/downloads/platform.html

# Install Julia
RUN echo 'deb http://ppa.launchpad.net/staticfloat/juliareleases/ubuntu trusty main' >> /etc/apt/sources.list \
    && echo 'deb-src http://ppa.launchpad.net/staticfloat/juliareleases/ubuntu trusty main' >> /etc/apt/sources.list \
    && add-apt-repository -y ppa:staticfloat/juliareleases \
    && add-apt-repository -y ppa:staticfloat/julia-deps \
    && apt-get update -y \
    && apt-get install -y julia \
    && apt-get upgrade -y julia

# Install IJulia
RUN julia -e 'convert(VersionNumber, chomp(readall(`ipython --version`))); Pkg.build("IJulia"); Pkg.add("IJulia")'
# INCLUDE Dockerfile.c++
# INCLUDE Dockerfile.spark
# INCLUDE Dockerfile.ruby

RUN apt-get clean && \
rm -rf /var/lib/apt/lists/* && rm -rf /tmp && mkdir /tmp

WORKDIR /notebooks
CMD ["/notebook.sh"]
