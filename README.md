# BWA_challenge

This repo contains the Dockerfile needed for building the bwa containerized application for aligning sequences against the hg19 database. 

## Dockerfile 
I give the instruction to copy the bwa executable and the python script that run the alignment in the container.
The Dockerfile it's been modified in order to copy the bwa executable, the python script, the hg19 database and the file to align (read_1.fa with 1000 sequences). With the CMD command the container, once running, will execute the alignment. 
### Command for building the container 
```docker build -t alignment .```
Got the error Error processing tar file(exit status 1): write /database/hg19bwaidx.sa: no space left on device
### Command for running the container 
```
```

### Command for running the container in interactive mode with the old version of the image 
```
sudo docker run -v /data/BDP1_2022/hg19:/database -it alignment /bin/bash
```
It is needed to map a local directory on which the hg19 database is avialable for allowing the alignment once in the container. Also, in local should be available the query file in FASTA format in order to have the input for the python script. 

## align-for-container.py
It's the python script that will run bwa asking in input the directory in which is avaiable the hg19 database and the query file. 
Once in the container, go the /script directory. 
Type ```python3 align-for-container.py``` for running the script 


