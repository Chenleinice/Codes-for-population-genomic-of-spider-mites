#!/usr/bin/
for i in `basename -a realign/*bam | xargs -I {}  basename {} _markdup_sorted.realign.bam`
do 
	echo $i
	mkdir dst/$i
	~/opt/bamdst/bamdst -p ~/data/ref/Tu/ref.bed -o dst/${i}/ realign/${i}_markdup_sorted.realign.bam
#	mv dst/$i/coverage.report dst/${i}_coverage.report && rm dst/$i -rf
done
