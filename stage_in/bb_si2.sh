#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:10:00
#SBATCH -J 1cn5bb
#SBATCH --output 500gbSI.%j.out
#SBATCH --error 500gbSI.%j.err
#DW jobdw type=scratch capacity=1TB access_mode=striped
#DW stage_in source=/global/cscratch1/sd/melrom/testSuite/files/500GB destination=$DW_JOB_STRIPED/500GB type=file

# PFS Location - This should match the source 
PFS="/global/cscratch1/sd/melrom/testSuite/files/500GB"
# BB Location - This should match the destination
SO_LOC="$DW_JOB_STRIPED/500GB"

echo "5BB Node (1TB), Capacity, 1 500GB file"
echo "500GB too big for md5sum or diff "
echo "Comparing file sizes with stat instead."

SC=$(stat --printf='%s' $PFS)
DB=$(stat --printf='%s' $SO_LOC)

result=$(($SC - $DB))

if [ $result -ne 0 ]
then
	echo "FAIL: File size on BB does not match PFS."
else
	echo "PASS: BB file size matches PFS file size."
fi
