#!/bin/bash
for i in `seq 80 100`
do

	cd 4TtrGroup_boot_${i}
	for j in `seq 1 10`
	do
		mkdir run$j
		cp ../*tpl ../*est  ../*pv *obs run$j
		cd run$j
		fsc26 -t *tpl -n100000  -d -e *est -M -L 10 -c 36 -B 36  -q -C 10 --initValues *pv
		rm *tpl *est *obs
		cd ..
	done
	/home/chenlei/data/TtrWGS/output/demographic/fastsimcoal/Tpu/model1/fsc-selectbestrun.sh
	cd ..
done



