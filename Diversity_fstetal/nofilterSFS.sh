#!/bin/bash/
REF=~/data/ref/Tu/Tetranychus_urticae.main_genome_200909.scaffolds.fasta
ANC=~/data/ref/Tu/anc_tpi2.fa
for POP in `ls Tpu`
do
	        echo "************************angsd begins static SFS for"$POP
		if [ -e SFSout/Tpu/${POP}.saf.idx ]
		then echo "${POP} SFS done"
		else
		INL=`cat Tpu/$POP | wc -l`
		NUM=$( printf "%.0f" $(echo "scale=2;0.8*$INL" | bc))
		echo $NUM
		angsd -P  40 -b Tpu/${POP} -ref $REF -out SFSout/Tpu/${POP} -anc $ANC\
			-uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -C 50 -baq 1 \
			-minMapQ 30 -minQ 30 -minInd $NUM -setMinDepth $INL  -doCounts 1\
			-GL 2 -doSaf 1 -doMaf 1 -doMajorMinor 1
	fi
		if [ -e SFSout/Tpu/${POP}.sfs ]
		then echo "sfs done"
		else
		/opt/biosoft/angsd/misc/realSFS SFSout/Tpu/$POP.saf.idx -P 10 > SFSout/Tpu/$POP.sfs
	fi
		echo $POP"has done#######################################"

#		 echo "************************angsd begins Theta static SFS for"$POP
	 		INL=`cat Tpu/$POP | wc -l`
			NUM=$( printf "%.0f" $(echo "scale=2;0.8*$INL" | bc))
			echo $NUM
#			angsd -P  40 -b Tpu/${POP} -ref $REF -out Thetaout/Tpu/${POP} -anc $ANC\
#					-uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -C 50 -baq 1 \
#					-minMapQ 30 -minQ 30 -minInd $NUM -setMinDepth $INL  -doCounts 1\
#					-GL 2 -doSaf 1\
#					-doThetas 1 -pest SFSout/Tpu/$POP.sfs
#
#			/opt/biosoft/angsd/misc/thetaStat do_stat Thetaout/Tpu/$POP.thetas.idx 
#			/opt/biosoft/angsd/misc/thetaStat do_stat Thetaout/Tpu/$POP.thetas.idx -win 50000 -step 10000 -outnames Thetaout/Tpu/$POP.thetas	
done




for POP1 in `ls Tpu`
do
	for POP2 in `ls Tpu`        
		do
		      	if [ "$POP1" = "$POP2" ]
		then
			echo "$POP1 and $POP2 pass"
		elif [ -e SFSout/Tpu/$POP2.$POP1.sfs ]
		then 
			echo "SFSout/Tpu/$POP2.$POP1.sfs excits and pass"
		else
		echo "************************angsd begins static SFS for $POP1 and $POP2"
		/opt/biosoft/angsd/misc/realSFS SFSout/Tpu/$POP1.saf.idx SFSout/Tpu/$POP2.saf.idx -P 10 > SFSout/Tpu/$POP1.$POP2.sfs
		/opt/biosoft/angsd/misc/realSFS fst index SFSout/Tpu/$POP1.saf.idx SFSout/Tpu/$POP2.saf.idx -sfs SFSout/Tpu/$POP1.$POP2.sfs -fstout FSTout/Tpu/$POP1.$POP2 -whichFST 1 
		 /opt/biosoft/angsd/misc/realSFS fst stats2 FSTout/Tpu/$POP1.$POP2.fst.idx -win 50000 -step 10000 -whichFST 1 > FSTout/Tpu/$POP1.$POP2.fst.txt
		 /opt/biosoft/angsd/misc/realSFS fst stats FSTout/Tpu/$POP1.$POP2.fst.idx >  FSTout/Tpu/$POP1.$POP2.globalfst
		echo "$POP1 and $POP2 has been done#######################################"
		fi
	done
done
