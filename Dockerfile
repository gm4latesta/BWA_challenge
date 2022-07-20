FROM ubuntu:latest
RUN apt update  
RUN apt install python3 -y
WORKDIR /usr/app/src
RUN mkdir /database
COPY bwa /usr/local/bin 
COPY align_for_container.py ./
CMD ["python3", "./align_for_container.py"]
