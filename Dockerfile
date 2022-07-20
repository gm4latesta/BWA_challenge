FROM ubuntu
RUN apt update
#copy bwa from my machine to the executable container directory
#the python script for running bwa  
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.5 \
    python3-pip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir /script 
COPY bwa /usr/local/bin 
COPY align_for_container.py /script

