#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:10:00
#SBATCH -J SOlist
#SBATCH --output SOlist.%j.out
#SBATCH --error SOlist.%j.err
#DW jobdw type=scratch capacity=800GB access_mode=striped

#cd $DW_JOB_STRIPED

#echo "This is the first file." >>file1.txt
#echo "This is the second file." >>file2.txt
#echo "This is the third file." >>file3.txt

# Generate List File
#echo "$DW_JOB_STRIPED/file1.txt">>listFile.txt
#echo "$DW_JOB_STRIPED/file2.txt">>listFile.txt
#echo "$DW_JOB_STRIPED/file3.txt">>listFile.txt

#cd $SLURM_SUBMIT_DIR
#mkdir stageOutArea

#DW stage_out type=list source=/global/cscratch1/sd/melrom/testSuite/stage_out/stageOutArea

wait
