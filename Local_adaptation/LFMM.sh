#!/bin/bash
for i in 1 2 3 4 5; do
	~/opt/LFMM_CL_v1.5/bin/LFMM -x Tpu_HQ_snp.lfmm \
		-v tpu_HQ_clim.env -i 10000 -b 5000 -K 5 -p 60 -o Tpu_HQ_snp/K5/res$i &
done
wait
