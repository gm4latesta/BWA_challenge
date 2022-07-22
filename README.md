# BWA_challenge

This repo contains the Dockerfile needed for building the bwa containerized application for aligning sequences against the hg19 database. 

## Dockerfile 
I give the instruction to copy the bwa executable and the python script that run the alignment in the container.
With the CMD command the container, once running, will execute the alignment. 

### Command for building the container 
```
docker build -t alignment .
```

### Command for running the container 
```
docker run -v /data/BDP1_2022/hg19:/database alignment 
```
It is needed to map a local directory on which the hg19 database is avialable for allowing the alignment once in the container. Also, in local should be available the query file in FASTA format in order to have the input for the python script. 

## align-for-container.py
It's the python script that will run bwa inside the container.


