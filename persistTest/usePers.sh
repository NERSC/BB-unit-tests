#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:05:00
#SBATCH --error=usePers.%J.err
#SBATCH --output=usePers.%J.out
#DW persistentdw $DW_PERSISTENT_STRIPED_BBSuiteT1 

echo "BB Test Suite: Persistent Reservation, 1TB, usePers.sh"
echo "Job script to use the reservation."

echo "Test making directory."
dtest="$DW_PERSISTENT_STRIPED_BBSuiteT1/testDir"
mkdir $dtest

if [ ! -d $dtest ]
then
	echo "FAIL: Mkdir on persistent reservation not found."
else
	echo "PASS: Persistent reservation connect and make directory was successful."
fi

sbatch -d afterok:$SLURM_JOB_ID ./deletePersistent.she

wait
