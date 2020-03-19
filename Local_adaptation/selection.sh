#!/bin/bash
FSTFILE=Tpu_sourthandnorth_beagle
fPIFILE=Tpu_northeast_beagle
sPIFILE=Tpu_south_beagle
resultFILE=Tpu_northandsouth_beagle


#vcftools --gzvcf ~/data/TtrWGS/output/finalvcf/all.passfilter.vcf.gz --weir-fst-pop ../Args/Ttr_northeast.args --weir-fst-pop ../Args/Ttr_south.args --fst-window-size 100000 --fst-window-step 10000 --out Ttr_sourth_eastnorth

#calculate pi
#vcftools --gzvcf ~/data/TtrWGS/output/finalvcf/eachpop/Ttr/GS.xlnovcf.gz  --window-pi 100000 --window-pi-step 10000  --TajimaD 100000 --out TtrGS

#calculate TajimaD


####join fst and pi files


awk '{ print $1"-"$2"-"$3, $6}' Fst/${FSTFILE}.windowed.weir.fst  | sed 's/[\t," "]/,/g' > ${FSTFILE}.windowed.weir.fst.csv 
awk '{ print $1"-"$2"-"$3, $5}' pi/${fPIFILE}.windowed.pi | sed "s/PI/${fPIFILE}/g" | sed 's/[\t," "]/,/g' > ${fPIFILE}.windowed.pi.csv 
awk '{ print $1"-"$2"-"$3, $5}' pi/${sPIFILE}.windowed.pi | sed "s/PI/${sPIFILE}/g" | sed 's/[\t," "]/,/g' > ${sPIFILE}.windowed.pi.csv 

csvtk join -f 1 ${fPIFILE}.windowed.pi.csv  ${sPIFILE}.windowed.pi.csv ${FSTFILE}.windowed.weir.fst.csv  > ${resultFILE}_selection.csv 

csvtk csv2tab ${resultFILE}_selection.csv   > ${resultFILE}_selection.txt 
rm ${fPIFILE}.windowed.pi.csv  ${sPIFILE}.windowed.pi.csv ${FSTFILE}.windowed.weir.fst.csv ${resultFILE}_selection.csv


