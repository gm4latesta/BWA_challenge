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
RUN mkdir /script && \
    mkdir /database
COPY bwa /usr/local/bin 
COPY align_for_container.py /script
COPY /BDP1_2022/hg19/hg19bwaidx.amb /database
COPY /BDP1_2022/hg19/hg19bwaidx.ann /database
COPY /BDP1_2022/hg19/hg19bwaidx.bwt /database
COPY /BDP1_2022/hg19/hg19bwaidx.pac /database
COPY /BDP1_2022/hg19/hg19bwaidx.sa /database
COPY /BDP1_2022/hg19/read_1.fa /database
RUN python3 /script/align_for_container.py
