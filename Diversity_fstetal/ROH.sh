#!/bin/bash/
for sp in Ttr Tpu
do 
	for file in `ls ../finalvcf/eachpop/$sp/*xlnovcf.gz`
	do
		echo $file
		POP=`echo $file | awk 'BEGIN{FS="/"}{print $NF}'|awk 'BEGIN{FS="."}{print $1}'`
		echo $POP
		bcftools roh --AF-tag AF $file  -o $sp/$POP.roh.txt
	done
done
