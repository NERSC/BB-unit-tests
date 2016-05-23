#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:10:00
#SBATCH -J 1cn1bbTAR
#SBATCH --output tarChk.%j.out
#SBATCH --error tarChk.%j.err
#DW jobdw type=scratch capacity=400GB access_mode=striped

tar -zcvf stageIn.tar.gz "$SCRATCH/testSuite/stage_in"

cp stageIn.tar.gz $DW_JOB_STRIPED

cd $DW_JOB_STRIPED

VTAR=$(ls -ltarh)

echo "Contents of DW Job Directory with Tarball: $VTAR"
echo "Preparing to untar on the burst buffer."
tar -xzvf stageIn.tar.gz

if [ $? -eq 0 ]
then
	echo "PASS: Tar returned successfully."
else
	echo "FAIL: tar returned failure code: $?"
fi

echo "Contents of BB directory after untar."
ls -ltarh $DW_JOB_STRIPED

wait
