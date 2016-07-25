#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:15:00
#SBATCH -J 2si3bb1cn
#DW jobdw type=scratch capacity=1TB access_mode=striped
#DW stage_in source=/global/cscratch1/sd/melrom/testSuite/files/100MB destination=$DW_JOB_STRIPED/100MB type=file
#DW stage_in source=/global/cscratch1/sd/melrom/testSuite/files/testVid.sh destination=$DW_JOB_STRIPED/testVid.sh type=file
#DW stage_in source=/global/cscratch1/sd/melrom/testSuite/files/2MB destination=$DW_JOB_STRIPED/2MB type=file

echo "BB Test Suite - Three Stage Ins before Job Started."

# PFS Location - This should match the source 
PFS="/global/cscratch1/sd/melrom/testSuite/files/"
# BB Location - This should match the destination
SO_LOC="$DW_JOB_STRIPED/"

echo "BB Nodes (1TB) Capacity"
echo " "

echo "Verify staged in files"
echo "Stage In Order: 100MB, testVid.sh, 2MB"

cd $SO_LOC
ls -ltarh
