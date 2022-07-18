FROM ubuntu
#copy bwa from my machine to the executable container directory
#copy the hg19 database and the python script for running bwa  
RUN mkdir /hg19 && \
    mkdir /script 
COPY bwa /usr/local/bin
COPY hg19bwaidx.* /hg19 
COPY align_for_container.py /script
  
RUN echo "Starting the alignment..."
RUN /script/align.py 

