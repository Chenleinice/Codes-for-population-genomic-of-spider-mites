#!/bin/bash
for file in `ls *.vcf.gz`
        do
                echo $file
                POP=`echo $file |awk 'BEGIN{FS="."}{print $1}'`
		NEW=`echo $POP | sed 's/allttrtpu/ttr/g'`
                echo $POP $NEW
		~/opt/plink2  --vcf $file --keep ttrpop --maf 0.01 --indep-pairwise 50 5 0.2 --allow-extra-chr  --set-missing-var-ids @:\# --allow-no-sex --out Ttr/$POP
		~/opt/plink2  --vcf $file --keep ttrpop --extract All/$POP.prune.in --make-bed  --allow-extra-chr  --set-missing-var-ids @:\# --allow-no-sex --out Ttr/$POP
		cd Ttr
		~/opt/plink2 -bfile $POP  --make-bed -out $NEW --allow-extra-chr --geno 0.1 -recode 12  && rm allttrtpu*
		cd ..
	done
#rename -f -v 's/allttrtpu/tpu/g' Tpu/*
sed -i 's/scaffold_//g' Ttr/*bim
