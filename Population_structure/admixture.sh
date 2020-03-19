#!/bin/bash
for F in /home/chenlei/data/TtrWGS/output/admixture/All/*.bed
do
       	name=`echo $F | awk 'BEGIN{FS="/"}{print $NF}'| awk 'BEGIN{FS="."}{print $1}'`
	echo "++++++++++++++++++++$name starts+++++++++++++++++++++++++++"
	for K in 4 10 
	do for R in 1 2 3 4 5 6 7 8 9 10
	do
		cd /home/chenlei/data/TtrWGS/output/admixture/All/out/R$R
		if test -e ../${name}_K${K}_R${R}.out;then
			echo "=============${name}_K${K}_R${R}.out had been done=========="
	        else 
			echo "+++========++++${name}_K${K}_R${R}.out is being caculasted+++++===========+++++++"
			admixture -s time -C 100 --cv $F $K -j20 | tee ../${name}_K${K}_R${R}.out
		fi
		done
	done
	echo "+++++++++++++++++++$name overs+++++++++++++++++++++++++++"
done
