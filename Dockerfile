FROM ubuntu
#copy bwa from my machine to the executable container directory
#copy the hg19 database and the python script for running bwa  
RUN mkdir /hg19 && \
    mkdir /script 
ADD /data/BDP1_2022/condor/hg/bwa /usr/local/bin
ADD /data/BDP1_2022/hg19/hg19bwaidx.* /hg19 
ADD /data/BDP1_2022/condor/hg/align_for_container.py /script
  
RUN echo "Starting the alignment..."
RUN /script/align.py 

