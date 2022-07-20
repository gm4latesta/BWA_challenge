#!/usr/bin/python
import sys,os

command = "sudo docker run -v /data/BDP1_2022/hg19:/database alignment"

os.system(command)

exit(0)
