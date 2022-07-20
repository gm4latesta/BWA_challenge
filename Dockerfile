FROM ubuntu:latest
RUN apt update
#copy bwa from my machine to the executable container directory
#the python script for running bwa  
RUN apt install python3 -y
WORKDIR /usr/app/src
RUN mkdir /database
COPY bwa /usr/local/bin 
COPY align_for_container.py ./
COPY hg19bwaidx.amb /database
COPY hg19bwaidx.ann /database
COPY hg19bwaidx.bwt /database
COPY hg19bwaidx.pac /database
#COPY hg19bwaidx.sa /database
COPY read_1.fa /database
CMD ["python3", "./align_for_container.py"]
