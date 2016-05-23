#!/bin/bash
#SBATCH -p shared
#SBATCH -N 1
#SBATCH -t 00:10:00
#SBATCH -J soCheckDir
#SBATCH --output SOdirCheck.%j.out

NFILES=1000
PFS=/global/cscratch1/sd/melrom/testSuite/stage_out/tmpFiles

if [ -d $PFS ]
then
	CNT=$(ls -l | wc)
	if [ $NFILES -eq $CNT ]
	then
		echo "PASS: Scratch directory exists and has $CNT files."
	else
		echo "FAIL: Scratch directory exists, but number of files does not match. Scratch Dir: $CNT files, Original BB Dir: $NFILES files"
	fi
else
	echo "FAIL: Stage out failed. The SCRATCH directory does not exist."
fi

wait
