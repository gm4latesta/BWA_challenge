#!/usr/bin/python
import sys,os
from timeit import default_timer as timer

# Control variables
##############################################

#bwa aln -t 1 /hg19/hg19bwaidx myread.fa > myread.sai
#bwa samse -n 10  /hg19/hg19bwaidx myread.sai myread.fa > myread.sam

dbpath = "/database/"
dbname = "hg19bwaidx"

queryname = "/database/read_1.fa"

out_path= "/database/"
out_name = "out"

md5file = "md5.txt"


command = "bwa aln -t 1 " + dbpath + dbname + " " + queryname + " > " + out_path + out_name + ".sai"
print ("launching command: " , command)
os.system(command)

command = "bwa samse -n 10 " + dbpath + dbname + " " + out_path + out_name + ".sai " + queryname + " > " + out_path + out_name + ".sam"
print ("launching command: " , command)
os.system(command)

print ("Creating md5sums")
os.system("md5sum " + out_path + out_name + ".sai " + " > " + out_path + md5file)
os.system("md5sum " + out_path + out_name + ".sam " + " >> " + out_path + md5file)

print ("gzipping out text file")
command = "gzip " + out_path + out_name + ".sam"
print ("launching command: " , command)
os.system(command)

print ("exiting")

exit(0)
