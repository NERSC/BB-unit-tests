#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH --qos=premium
#SBATCH -t 00:01:00
#SBATCH -o stage_in_scratch_striped_file.out

#DW jobdw capacity=200GB access_mode=striped type=scratch
#DW stage_in source=/global/cscratch1/sd/djbard/model0112.tar destination=$DW_JOB_STRIPED/model0112.tar   type=file
echo "input file size:"
ls -lrth /global/cscratch1/sd/djbard/model0112.tar

echo "BB file size"
ls -lrth  $DW_JOB_STRIPED/model0112.tar


