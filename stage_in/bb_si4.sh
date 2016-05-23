#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:15:00
#SBATCH -J 2si3bb1cn
#DW jobdw type=scratch capacity=600GB access_mode=striped
#DW stage_in source=/global/cscratch1/sd/melrom/testSuite/files/100MB destination=$DW_JOB_STRIPED/100MB type=file
#DW stage_in source=/global/cscratch1/sd/melrom/testSuite/files/100GB destination=$DW_JOB_STRIPED/100GB type=file
#DW stage_in source=/global/cscratch1/sd/melrom/testSuite/files/2MB destination=$DW_JOB_STRIPED/2MB type=file

echo "BB Test Suite - Three Stage Ins before Job Started."

# PFS Location - This should match the source 
PFS="/global/cscratch1/sd/melrom/testSuite/files/"
# BB Location - This should match the destination
SO_LOC="$DW_JOB_STRIPED/"

echo "3BB Nodes (600GB) Capacity"
echo " "

echo "Verify staged in files"
echo "Stage In Order: 100MB, 100GB, 2MB"

cd $PFS
find . -type f -name 100MB -print0 | xargs -0 md5sum >/tmp/ORIG_DIR_MD5
find . -type f -name 100GB -print0 | xargs -0 md5sum >/tmp/ORIG_DIR_100GB
find . -type f -name 2MB -print0 | xargs -0 md5sum >/tmp/ORIG_DIR_2MB

cd $SO_LOC
find . -type f -name 100MB -print0 | xargs -0 md5sum >/tmp/STAGED_OUT_DIR_MD5
find . -type f -name 100GB -print0 | xargs -0 md5sum >/tmp/STAGED_OUT_100GB
find . -type f -name 2MB -print0 | xargs -0 md5sum >/tmp/STAGED_OUT_2MB

X=diff /tmp/ORIG_DIR_MD5 /tmp/STAGED_OUT_DIR_MD5
Y=diff /tmp/ORIG_DIR_100GB /tmp/STAGED_OUT_100GB
Z=diff /tmp/ORIG_DIR_2MB /tmp/STAGED_OUT_2MB
FLAG=false

if [ $X -ne 0 ]
then
	echo "FAIL: 100MB - BB file does not match PFS file."
	FLAG=true
fi

if [ $Y -ne 0 ]
then
	echo "FAIL: 100GB - BB file does not match PFS file."
	FLAG=true
fi

if [ $Z -ne 0 ]
then
	echo "FAIL: 2MB - BB file does not match PFS file."
	FLAG=true
fi

if [ $FLAG -eq "false" ]
then
	echo "PASS: Stage In of 100MB, 100GB, and 2MB Complete."
fi

wait
