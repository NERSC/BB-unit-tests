#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:20:00
#SBATCH -J SOdir1
#SBATCH --output SOdir.%j.out
#SBATCH --error SOdir.%j.err
#DW jobdw type=scratch capacity=600GB access_mode=striped

srun genFiles.sh

#DW stage_out type=directory source=$DW_JOB_STRIPED/tmpFiles destination=/global/cscratch1/sd/melrom/testSuite/stage_out/tmpFiles

sbatch -d afterok:$SLURM_JOB_ID ./checkSOdir.sh
