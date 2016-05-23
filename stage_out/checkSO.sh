#!/bin/bash
#SBATCH -p shared
#SBATCH -N 1
#SBATCH -t 00:10:00
#SBATCH -J soCheck
#SBATCH --output SOcheckFile.%j.out

sleep 10 

OUTCHK="/global/cscratch1/sd/melrom/testSuite/stage_out/OutFile/1MB"
fsize=$(wc -c <"$OUTCHK")

if [ ! -f $OUTCHK ]
then
	echo "FAIL: File does not exist."
elif [ $fsize -ne "1048576" ]
then
	echo "FAIL: File is not 1MB in size."
else
	echo "PASS: 1MB File staged out correctly."
fi

wait
