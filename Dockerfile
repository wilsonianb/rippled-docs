FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install build-essential g++ git libbz2-dev wget

# Install Boost
RUN wget -O boost_1_60_0.tar.gz http://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.gz/download
RUN tar xzvf boost_1_60_0.tar.gz
RUN cd boost_1_60_0 && ./bootstrap.sh --prefix=/usr/local 
RUN cd boost_1_60_0 && ./b2 install
ENV BOOST_ROOT=/boost_1_60_0

# Install dependencies
RUN apt-get -y install doxygen
RUN apt-get -y install xsltproc

# Get rippled commit for building docs
RUN git clone https://github.com/ripple/rippled.git
RUN cd rippled && git remote add wilsonianb https://github.com/wilsonianb/rippled.git
RUN cd rippled && git fetch wilsonianb
RUN cd rippled && git checkout wilsonianb/doc

ENV INPUT_PATHS=../src/ripple/

COPY build_docs.sh .

CMD ./build_docs.sh
