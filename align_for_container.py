#!/usr/bin/python
import sys,os
from timeit import default_timer as timer

# Control variables
##############################################

#bwa aln -t 1 /hg19/hg19bwaidx myread.fa > myread.sai
#bwa samse -n 10  /hg19/hg19bwaidx myread.sai myread.fa > myread.sam

dbpath = input("insert dbpath")
dbname = "hg19bwaidx"

queryname = input("insert path and file to align")

out_name = "out"

md5file = "md5.txt"


command = "bwa aln -t 1 " + dbpath + dbname + " " + queryname + " > " + out_name + ".sai"
print ("launching command: " , command)
os.system(command)

command = "bwa samse -n 10 " + dbpath + dbname + " " + out_name + ".sai " + queryname + " > " + out_name + ".sam"
print ("launching command: " , command)
os.system(command)

print ("Creating md5sums")
os.system("md5sum " + out_name + ".sai " + " > " + md5file)
os.system("md5sum " + out_name + ".sam " + " >> " + md5file)

print ("gzipping out text file")
command = "gzip " + out_name + ".sam"
print ("launching command: " , command)
os.system(command)

print ("exiting")

exit(0)
