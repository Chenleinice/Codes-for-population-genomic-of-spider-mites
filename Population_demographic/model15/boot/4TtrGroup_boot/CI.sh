#!/bin/bash/
index=4TtrGroup_boot

#grep NPOP ${index}_1/bestrun/${index}.bestlhoods > ${index}_CI.txt

for i in `seq 1 100`
do 
	grep -v NPOP ${index}_${i}/$index/${index}.bestlhoods >> ${index}_CI.txt 
done
