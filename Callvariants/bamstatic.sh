#!/usr/bin/


echo "Sample\tClean Reads\tClean Bases(Mb)\tMapped Reads\tMapped Bases(Mb)\tMapping Rate\tDepth(x)\tCoverage(>=1x)" > Bam_static.txt
for i in `basename -a realign/*bam | xargs -I {}  basename {} _markdup_sorted.realign.bam`
do 
	
	CLEANREAD=`grep "Raw Reads (All reads)" dst/${i}_coverage.report | cut -f2`
	CLEANDATA=`grep "\[Total\] Raw Data(Mb)" dst/${i}_coverage.report | cut -f2`
	MAPREAD=`grep "\[Total\] Mapped Reads" dst/${i}_coverage.report | cut -f2`
	MAPRATE=`grep "Fraction of Mapped Reads" dst/${i}_coverage.report | cut -f2`
	DEPTH=`grep "\[Target\] Average depth" dst/${i}_coverage.report | cut -f2 |sed -n '1p'`
	COV=`grep "\[Target\] Coverage (>0x)" dst/${i}_coverage.report | cut -f2`
	MAPDATA=`grep "\[Total\] Mapped Data(Mb)" dst/${i}_coverage.report | cut -f2`
	echo "$i\t$CLEANREAD\t$CLEANDATA\t$MAPREAD\t$MAPDATA\t$MAPRATE\t$DEPTH\t$COV" >> Bam_static.txt
done
