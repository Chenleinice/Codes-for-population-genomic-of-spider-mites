#!/bin/bash/
for i in `seq 1 16`
do 
	treemix -i ../ttrtpu_withoutSC.treemix.frq.gz -m $i -root Tpi -o ttrtpu_withoutSC/all.$i  --bootstrap -k 500 > treemix_$i.log
done
