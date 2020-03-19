#!/bin/bashr
for sp in Group
do
        for file in `ls ~/data/TtrWGS/output/finalvcf/eachpop/$sp/Group1_unrela.xlnovcf.gz`
        do
                echo $file
                POP=`echo $file | awk 'BEGIN{FS="/"}{print $NF}'|awk 'BEGIN{FS="."}{print $1}'`
                echo $POP
		~/opt/PopLDdecay/bin/PopLDdecay -InVCF $file -OutStat $sp/${POP}_LDdecay -MaxDist 200 -MAF 0.01
	done
done

