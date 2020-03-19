#!/bin/bash
for i in `seq 1 50`
do
	mkdir run$i
	cp *tpl *est *obs  run${i}
	cd run$i
	fsc26 -t *tpl -n100000 -d -e *est -M -L 40 -c28 -B 28 -s0 -q -C 10
	rm *tpl *est *obs
	cd ..
done

