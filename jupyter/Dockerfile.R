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
