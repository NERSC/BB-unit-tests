#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:10:00
#SBATCH -J permsViaSI
#SBATCH --output SIperm.%j.out
#SBATCH --error SIperm.%j.err
#DW jobdw type=scratch capacity=400GB access_mode=striped
#DW stage_in type=file source=/global/cscratch1/sd/melrom/testSuite/files/testVid.sh destination=$DW_JOB_STRIPED/testVid.sh
PFS="/global/cscratch1/sd/melrom/testSuite/files"
BBTS="$DW_JOB_STRIPED"

echo "BB Test Suite - Stage In an Executable, Perms: 755 and verify preservation."
cd $PFS
echo "SCRATCH LOC: $PFS"
scrPers=$(stat -c "%a" testVid.sh)
echo "SCRATCH perms: $scrPers"

cd $BBTS
echo "DW LOC: $BBTS"
bbPers=$(stat -c "%a" testVid.sh)
echo "BB perms: $bbPers"

if [ $scrPers -ne $bbPers ] 
then
	echo "FAIL: Permissions on SCRATCH do not match permissions on BB."
else
	echo "PASS: Permissions are the same."
fi

wait
