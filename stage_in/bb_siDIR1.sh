#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:10:00
#SBATCH -J 1cn5bbDIR
#SBATCH --output SI3kDIR.%j.out
#SBATCH --error SI3kDIR.%j.out
#DW jobdw type=scratch capacity=1TB access_mode=striped
#DW stage_in type=directory source=/global/cscratch1/sd/melrom/testSuite/files/TestDIR destination=$DW_JOB_STRIPED/TestDIR

# PFS Location - This should match the source 
PFS="/global/cscratch1/sd/melrom/testSuite/files/TestDIR"
# BB Location - This should match the destination
SO_LOC="$DW_JOB_STRIPED/TestDIR"

echo "5BB Node (1000GB) Capacity - 3000 files, total: 236KB"
echo " "

diff $PFS $SO_LOC

if [ $? -ne 0 ]
then
	echo "FAIL: BB DIR does not match PFS DIR."
else
	echo "PASS: BB DIR matches PFS DIR."
fi
