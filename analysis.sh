#!/bin/sh

echo "Question,N/A,Not Held,Partial,Held,Avg. Conf. Score"

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39
do
  outLine="OID${i}"
  outLine=${outLine}","`grep -E "^OID${i}.+,N/A," *.csv | wc -l`
  outLine=${outLine}","`grep -E "^OID${i}.+,Not Held," *.csv | wc -l`
  outLine=${outLine}","`grep -E "^OID${i}.+,Partial," *.csv | wc -l`
  outLine=${outLine}","`grep -E "^OID${i}.+,Held," *.csv | wc -l`
  
  valueCount=0
  runningTotal=0
  for j in 1 2 3 4 5 6 7 8 9 10 11 12 13 14
  do
    matches=`grep -E "OID${i}.+,(Held|N/A|Not Held|Partial),${j}(\.|,)" *.csv | wc -l`
    if [ ${matches} -ne 0 ]
    then
      valueCount=$((valueCount+matches))
      runningTotal=$((runningTotal+j*matches))
    fi
    # echo "${j}: ${matches}"
  done
  # echo "valueCount=${valueCount} runningTotal=${runningTotal}"
  if [ ${valueCount} -ne 0 ]
  then
    averageScore=$((runningTotal / valueCount))
  else
    averageScore=0
  fi
  outLine=${outLine}","${averageScore}
  echo ${outLine}
done

