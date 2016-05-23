#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:10:00
#SBATCH -J 1cn2TBbb
#SBATCH --output nodeChk.%j.out
#SBATCH --error nodeChk.%j.err
#DW jobdw type=scratch capacity=2TB access_mode=striped
GRAN=200
REQ_TB=2

module load datawarp
module load dws

sessID=$(dwstat sessions | grep $SLURM_JOBID | awk '{print $1}')
NODES=$(dwstat instances | grep $sessID | awk '{print $5}')

echo "Node Verify: 2TB Requested"
echo "Number of Nodes Allocated via dwstat sessions: $NODES"
echo "Granularity is $GRAN"

ntotal=$(($NODES * $GRAN))

inTB=$(($ntotal / 1000))

if [ $inTB -eq $REQ_TB ]
then
	echo "PASS: Nodes requested = Nodes allocated"
else
	echo "FAIL: BB Space Requested $REQ_TB TB, Allocation: $inTB TB"
fi

wait
