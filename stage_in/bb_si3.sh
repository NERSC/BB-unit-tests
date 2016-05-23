#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:10:00
#SBATCH -J 1cn1bb
#SBATCH --output SIpriv1CN1BB.%j.out 
#SBATCH --error SIpriv1CN1BB.%j.err
#DW jobdw type=scratch capacity=200GB access_mode=private
#DW stage_in source=/global/cscratch1/sd/melrom/testSuite/files/2MB destination=$DW_JOB_STRIPED/2MB type=file

# PFS Location - This should match the source 
PFS="/global/cscratch1/sd/melrom/testSuite/files/"
# BB Location - This should match the destination
SO_LOC="$DW_JOB_STRIPED/"

echo "Private Node, 1BB Node (200GB), 1CN"
echo "Stage In 2MB file."
echo " "

cd $PFS
find . -type f -name 2MB -print0 | xargs -0 md5sum >/tmp/ORIG_DIR_MD5

cd $SO_LOC
find . -type f -name 2MB -print0 | xargs -0 md5sum >/tmp/STAGED_OUT_DIR_MD5

diff /tmp/ORIG_DIR_MD5 /tmp/STAGED_OUT_DIR_MD5

if [ $? -ne 0 ]
then
	echo "FAIL: BB file does not match PFS file."
else
	echo "PASS: BB file matches PFS file."
fi
