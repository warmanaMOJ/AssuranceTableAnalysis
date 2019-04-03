#!/bin/sh

loopCount=1

for i in *.xlsx
do
	xlsx2csv --all --escape "$i" out
	mv out/*Assurance*.csv $loopCount.csv
	rm -rf out
	echo "$loopCount: $i"
	loopCount=$((loopCount+1))
done

for i in ?.csv
do
	mv ${i} 0${i}
done
