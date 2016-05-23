#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:10:00
#SBATCH -J 1cn3bnSO
#SBATCH --output StageOutFile.%j.out 
#SBATCH --error StageOutFile.%j.err
#DW jobdw type=scratch capacity=600GB access_mode=striped

cd $SLURM_SUBMIT_DIR
mkdir OutFile

dd if=/dev/urandom of=$DW_JOB_STRIPED/1MB bs=1024 count=1024

sleep 5

#DW stage_out type=file source=$DW_JOB_STRIPED/1MB destination=/global/cscratch1/sd/melrom/testSuite/stage_out/OutFile/1MB

sbatch -d afterok:$SLURM_JOB_ID checkSO.sh
